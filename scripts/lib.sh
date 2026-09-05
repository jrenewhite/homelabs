#!/usr/bin/env bash
# Shared helpers for the homelab Bash toolkit.
# shellcheck shell=bash

set -o pipefail

HOMELAB_KEY_DEFAULT="${HOME}/.ssh/homelabing"
HOMELAB_SSH_TIMEOUT_DEFAULT=8

die() {
  printf 'ERROR: %s\n' "$*" >&2
  exit 1
}

warn() {
  printf 'WARNING: %s\n' "$*" >&2
}

info() {
  printf '%s\n' "$*" >&2
}

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || die "Required command not found: $1"
}

is_auth_failure() {
  local text="${1:-}"
  grep -Eqi \
    'permission denied|authentication failed|authentication failure|access denied|incorrect password|login incorrect' \
    <<<"$text"
}

ssh_common_opts() {
  local timeout="${1:-$HOMELAB_SSH_TIMEOUT_DEFAULT}"
  printf '%s\n' \
    "-o" "ConnectTimeout=${timeout}" \
    "-o" "ServerAliveInterval=5" \
    "-o" "ServerAliveCountMax=2" \
    "-o" "StrictHostKeyChecking=accept-new" \
    "-o" "LogLevel=ERROR"
}

read_password() {
  # Usage:
  #   read_password VAR "Prompt" stdin_mode
  #
  # stdin_mode=1:
  #   consumes exactly one line from stdin. This makes it possible for Codex
  #   or another script to provide retry passwords as newline-separated input.
  #
  # stdin_mode=0:
  #   reads silently from /dev/tty when available.
  local __var="$1"
  local prompt="${2:-Password: }"
  local stdin_mode="${3:-0}"
  local value=""

  if [[ "$stdin_mode" == "1" ]]; then
    printf '%s' "$prompt" >&2
    if ! IFS= read -r value; then
      return 1
    fi
  else
    if [[ -r /dev/tty ]]; then
      printf '%s' "$prompt" >/dev/tty
      IFS= read -rs value </dev/tty || return 1
      printf '\n' >/dev/tty
    else
      printf '%s' "$prompt" >&2
      IFS= read -rs value || return 1
      printf '\n' >&2
    fi
  fi

  printf -v "$__var" '%s' "$value"
}

normalize_mac() {
  local raw
  raw="$(tr -d ':. -' <<<"${1:-}" | tr '[:upper:]' '[:lower:]')"
  [[ "$raw" =~ ^[0-9a-f]{12}$ ]] || return 1
  printf '%s:%s:%s:%s:%s:%s\n' \
    "${raw:0:2}" "${raw:2:2}" "${raw:4:2}" \
    "${raw:6:2}" "${raw:8:2}" "${raw:10:2}"
}

valid_ipv4() {
  local ip="${1:-}"
  local a b c d extra
  IFS=. read -r a b c d extra <<<"$ip"
  [[ -z "${extra:-}" && -n "${d:-}" ]] || return 1
  local x
  for x in "$a" "$b" "$c" "$d"; do
    [[ "$x" =~ ^[0-9]+$ ]] || return 1
    (( 10#$x >= 0 && 10#$x <= 255 )) || return 1
  done
}

is_known_public_dns() {
  case "${1:-}" in
    1.1.1.1|1.0.0.1|8.8.8.8|8.8.4.4|9.9.9.9|149.112.112.112)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

known_public_dns_name() {
  case "${1:-}" in
    1.1.1.1|1.0.0.1) printf 'Cloudflare' ;;
    8.8.8.8|8.8.4.4) printf 'Google' ;;
    9.9.9.9|149.112.112.112) printf 'Quad9' ;;
    *) printf 'unknown' ;;
  esac
}

ensure_key_exists() {
  local key="${1:-$HOMELAB_KEY_DEFAULT}"
  if [[ -f "$key" && -f "${key}.pub" ]]; then
    return 0
  fi
  local here
  here="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
  "$here/homelab-keygen.sh" --path "$key"
}

ssh_key_test() {
  local host="$1" user="$2" port="${3:-22}" key="${4:-$HOMELAB_KEY_DEFAULT}" timeout="${5:-8}"
  ssh \
    -i "$key" \
    -p "$port" \
    -o IdentitiesOnly=yes \
    -o BatchMode=yes \
    -o PasswordAuthentication=no \
    -o KbdInteractiveAuthentication=no \
    -o ConnectTimeout="$timeout" \
    -o StrictHostKeyChecking=accept-new \
    -o LogLevel=ERROR \
    "${user}@${host}" true </dev/null >/dev/null 2>&1
}

ssh_password_exec() {
  # Usage:
  # ssh_password_exec HOST USER PORT PASSWORD TIMEOUT REMOTE_COMMAND
  local host="$1" user="$2" port="$3" password="$4" timeout="$5" remote_cmd="$6"
  need_cmd sshpass
  SSHPASS="$password" sshpass -e ssh \
    -p "$port" \
    -o PreferredAuthentications=password,keyboard-interactive \
    -o PubkeyAuthentication=no \
    -o NumberOfPasswordPrompts=1 \
    -o ConnectTimeout="$timeout" \
    -o StrictHostKeyChecking=accept-new \
    -o LogLevel=ERROR \
    "${user}@${host}" "$remote_cmd" </dev/null
}

authorize_public_key_with_password() {
  # Installs a key without removing any existing authorized_keys entries.
  local host="$1" user="$2" port="$3" password="$4" key="$5" timeout="$6"
  local pub="${key}.pub"

  [[ -r "$pub" ]] || {
    printf 'Missing public key: %s\n' "$pub" >&2
    return 2
  }

  need_cmd sshpass

  local output status
  set +e
  output="$(
    cat "$pub" | SSHPASS="$password" sshpass -e ssh \
      -p "$port" \
      -o PreferredAuthentications=password,keyboard-interactive \
      -o PubkeyAuthentication=no \
      -o NumberOfPasswordPrompts=1 \
      -o ConnectTimeout="$timeout" \
      -o StrictHostKeyChecking=accept-new \
      -o LogLevel=ERROR \
      "${user}@${host}" \
      'set -eu
       umask 077
       mkdir -p "$HOME/.ssh"
       chmod 700 "$HOME/.ssh"
       touch "$HOME/.ssh/authorized_keys"
       chmod 600 "$HOME/.ssh/authorized_keys"
       IFS= read -r key
       grep -qxF -- "$key" "$HOME/.ssh/authorized_keys" ||
         printf "%s\n" "$key" >> "$HOME/.ssh/authorized_keys"' \
      2>&1
  )"
  status=$?
  set -e

  if (( status != 0 )); then
    printf '%s\n' "$output" >&2
    if is_auth_failure "$output" || (( status == 5 )); then
      return 10
    fi
    return "$status"
  fi
  return 0
}
