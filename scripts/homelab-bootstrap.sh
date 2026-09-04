#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$HERE/lib.sh"

KEY="$HOMELAB_KEY_DEFAULT"
PASSWORD_STDIN=0
TIMEOUT=8
PORT_DEFAULT=22
TARGETS=()

usage() {
  cat <<'EOF'
Usage:
  homelab-bootstrap.sh [options] --target USER@HOST[:PORT] [--target ...]

Options:
      --target USER@HOST[:PORT]   Repeatable
      --password-stdin            Read password/retries as newline-separated stdin
      --key FILE                  Default: ~/.ssh/homelabing
      --timeout SECONDS           Default: 8
  -P, --port PORT                 Default port when target omits one (default 22)

Behavior:
  * creates ~/.ssh/homelabing if missing
  * first tries key authentication
  * asks for a password only when necessary
  * reuses a successful password for later targets
  * if that password is rejected, asks for another
  * maximum 3 password attempts per target
EOF
}

parse_target() {
  local target="$1"
  [[ "$target" == *@* ]] || return 1

  local user="${target%%@*}"
  local hostport="${target#*@}"
  local host="$hostport"
  local port="$PORT_DEFAULT"

  if [[ "$hostport" =~ ^\[([^]]+)\]:([0-9]+)$ ]]; then
    host="${BASH_REMATCH[1]}"
    port="${BASH_REMATCH[2]}"
  elif [[ "$hostport" =~ ^([^:]+):([0-9]+)$ ]]; then
    host="${BASH_REMATCH[1]}"
    port="${BASH_REMATCH[2]}"
  fi

  [[ -n "$user" && -n "$host" ]] || return 1
  printf '%s\t%s\t%s\n' "$user" "$host" "$port"
}

while (( $# )); do
  case "$1" in
    --target) TARGETS+=("${2:?Missing value}"); shift 2 ;;
    --password-stdin) PASSWORD_STDIN=1; shift ;;
    --key) KEY="${2:?Missing value}"; shift 2 ;;
    --timeout) TIMEOUT="${2:?Missing value}"; shift 2 ;;
    -P|--port) PORT_DEFAULT="${2:?Missing value}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) die "Unknown argument: $1" ;;
  esac
done

(( ${#TARGETS[@]} > 0 )) || {
  usage >&2
  die "At least one --target is required"
}

need_cmd ssh
need_cmd sshpass
ensure_key_exists "$KEY"

CURRENT_PASSWORD=""
HAVE_PASSWORD=0
FAILURES=()

for target in "${TARGETS[@]}"; do
  parsed="$(parse_target "$target")" || {
    FAILURES+=("$target: invalid target")
    continue
  }
  IFS=$'\t' read -r user host port <<<"$parsed"

  printf '\n== %s@%s:%s ==\n' "$user" "$host" "$port"

  if ssh_key_test "$host" "$user" "$port" "$KEY" "$TIMEOUT"; then
    printf 'homelabing key already authorized.\n'
    continue
  fi

  success=0
  for attempt in 1 2 3; do
    if (( HAVE_PASSWORD == 0 )); then
      read_password \
        CURRENT_PASSWORD \
        "Password for ${user}@${host}: " \
        "$PASSWORD_STDIN" || {
          FAILURES+=("${user}@${host}: no password available")
          break
        }
      HAVE_PASSWORD=1
    fi

    set +e
    authorize_public_key_with_password \
      "$host" "$user" "$port" \
      "$CURRENT_PASSWORD" "$KEY" "$TIMEOUT"
    status=$?
    set -e

    if (( status == 0 )); then
      if ssh_key_test "$host" "$user" "$port" "$KEY" "$TIMEOUT"; then
        printf 'Key installed and verified.\n'
        printf 'Keeping this password for subsequent targets if needed.\n'
        success=1
      else
        FAILURES+=("${user}@${host}: key verification failed")
      fi
      break
    fi

    if (( status == 10 )); then
      printf 'Password rejected for %s@%s (attempt %s/3).\n' \
        "$user" "$host" "$attempt" >&2

      if (( attempt < 3 )); then
        HAVE_PASSWORD=0
        CURRENT_PASSWORD=""
      else
        FAILURES+=("${user}@${host}: password rejected 3 times")
      fi
      continue
    fi

    FAILURES+=("${user}@${host}: SSH/key installation failed (exit ${status})")
    break
  done

  if (( success == 0 )); then
    printf 'Target not bootstrapped: %s@%s\n' "$user" "$host" >&2
  fi
done

unset CURRENT_PASSWORD

if (( ${#FAILURES[@]} )); then
  printf '\nCompleted with failures:\n' >&2
  for failure in "${FAILURES[@]}"; do
    printf '  - %s\n' "$failure" >&2
  done
  exit 1
fi

printf '\nAll targets completed successfully.\n'
