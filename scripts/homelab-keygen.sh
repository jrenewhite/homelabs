#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib.sh
source "$HERE/lib.sh"

KEY="$HOMELAB_KEY_DEFAULT"
FORCE=0
COMMENT="homelabing@$(hostname 2>/dev/null || printf unknown)"

usage() {
  cat <<'EOF'
Usage:
  homelab-keygen.sh [--path FILE] [--comment TEXT] [--force]

Creates the reusable Ed25519 key pair:
  ~/.ssh/homelabing
  ~/.ssh/homelabing.pub

Designed for Linux/WSL/macOS with OpenSSH installed.
EOF
}

while (( $# )); do
  case "$1" in
    --path) KEY="${2:?Missing value}"; shift 2 ;;
    --comment) COMMENT="${2:?Missing value}"; shift 2 ;;
    --force) FORCE=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) die "Unknown argument: $1" ;;
  esac
done

need_cmd ssh-keygen

mkdir -p "$(dirname "$KEY")"
chmod 700 "$(dirname "$KEY")" 2>/dev/null || true

if [[ -f "$KEY" && "$FORCE" != "1" ]]; then
  if [[ ! -f "${KEY}.pub" ]]; then
    info "Private key exists but public key is missing; reconstructing it."
    ssh-keygen -y -f "$KEY" | {
      IFS= read -r pub
      printf '%s %s\n' "$pub" "$COMMENT"
    } >"${KEY}.pub"
    chmod 644 "${KEY}.pub" 2>/dev/null || true
  fi
  printf 'Key already exists; nothing changed.\n'
  printf 'Private: %s\nPublic : %s\n' "$KEY" "${KEY}.pub"
  exit 0
fi

if [[ "$FORCE" == "1" ]]; then
  rm -f -- "$KEY" "${KEY}.pub"
fi

ssh-keygen -q -t ed25519 -f "$KEY" -N '' -C "$COMMENT"
chmod 600 "$KEY" 2>/dev/null || true
chmod 644 "${KEY}.pub" 2>/dev/null || true

printf 'Created homelabing key.\n'
printf 'Private: %s\nPublic : %s\n' "$KEY" "${KEY}.pub"
