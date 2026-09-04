#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$HERE/lib-omada.sh"

omada_parse_common_args "$@"
YES=0

set -- "${OMADA_REST[@]}"
while (( $# )); do
  case "$1" in
    --yes) YES=1; shift ;;
    -h|--help)
      cat <<'EOF'
Usage:
  omada-reboot.sh --host ROUTER --user USER [--password-stdin] [--yes]

Without --yes, you must type REBOOT before the command is sent.
EOF
      exit 0
      ;;
    *) die "Unknown argument: $1" ;;
  esac
done

omada_need_deps

if (( YES == 0 )); then
  printf 'Router: %s\n' "$OMADA_HOST"
  printf 'Type REBOOT to confirm: '
  IFS= read -r confirmation
  [[ "$confirmation" == "REBOOT" ]] || {
    printf 'Cancelled.\n'
    exit 0
  }
fi

omada_with_password_retries \
  "$OMADA_HOST" "$OMADA_USER" "$OMADA_PORT" "$OMADA_TIMEOUT" "$OMADA_PASSWORD_STDIN" \
  "enable" \
  "show system-info" \
  "reboot"
