#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$HERE/lib.sh"

HOST=""
USER_NAME=""
PORT=22
KEY="$HOMELAB_KEY_DEFAULT"
PASSWORD_STDIN=0
TIMEOUT=8

usage() {
  cat <<'EOF'
Usage:
  homelab-authorize.sh --host HOST --user USER [options]

Options:
  -H, --host HOST
  -u, --user USER
  -P, --port PORT             Default: 22
      --key FILE              Default: ~/.ssh/homelabing
      --password-stdin        Consume password from one stdin line
      --timeout SECONDS       Default: 8

The remote user's existing authorized_keys entries are preserved.
EOF
}

while (( $# )); do
  case "$1" in
    -H|--host) HOST="${2:?Missing value}"; shift 2 ;;
    -u|--user) USER_NAME="${2:?Missing value}"; shift 2 ;;
    -P|--port) PORT="${2:?Missing value}"; shift 2 ;;
    --key) KEY="${2:?Missing value}"; shift 2 ;;
    --password-stdin) PASSWORD_STDIN=1; shift ;;
    --timeout) TIMEOUT="${2:?Missing value}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) die "Unknown argument: $1" ;;
  esac
done

[[ -n "$HOST" && -n "$USER_NAME" ]] || {
  usage >&2
  die "--host and --user are required"
}

ensure_key_exists "$KEY"

if ssh_key_test "$HOST" "$USER_NAME" "$PORT" "$KEY" "$TIMEOUT"; then
  printf 'homelabing key already works for %s@%s.\n' "$USER_NAME" "$HOST"
  exit 0
fi

PASSWORD=""
read_password PASSWORD "Password for ${USER_NAME}@${HOST}: " "$PASSWORD_STDIN" ||
  die "No password received"

set +e
authorize_public_key_with_password \
  "$HOST" "$USER_NAME" "$PORT" "$PASSWORD" "$KEY" "$TIMEOUT"
STATUS=$?
set -e

unset PASSWORD

case "$STATUS" in
  0) ;;
  10) die "Password authentication was rejected" ;;
  *) die "Could not authorize the key (exit $STATUS)" ;;
esac

ssh_key_test "$HOST" "$USER_NAME" "$PORT" "$KEY" "$TIMEOUT" ||
  die "Public key was written, but key authentication verification failed"

printf 'Authorized and verified %s.pub for %s@%s.\n' "$KEY" "$USER_NAME" "$HOST"
