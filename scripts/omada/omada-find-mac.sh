#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$HERE/lib-omada.sh"

omada_parse_common_args "$@"
MAC=""

set -- "${OMADA_REST[@]}"
while (( $# )); do
  case "$1" in
    --mac) MAC="${2:?Missing value}"; shift 2 ;;
    -h|--help)
      cat <<'EOF'
Usage:
  omada-find-mac.sh --host ROUTER --user USER --mac MAC [--password-stdin]
EOF
      exit 0
      ;;
    *) die "Unknown argument: $1" ;;
  esac
done

[[ -n "$MAC" ]] || die "--mac is required"
MAC="$(normalize_mac "$MAC")" || die "Invalid MAC address"
omada_need_deps

TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

# Keep the complete router output for evidence, then filter the normalized MAC.
set +e
(
  omada_with_password_retries \
    "$OMADA_HOST" "$OMADA_USER" "$OMADA_PORT" "$OMADA_TIMEOUT" "$OMADA_PASSWORD_STDIN" \
    "enable" \
    "config" \
    "show dhcp server client-list" \
    "show arp"
) | tee "$TMP"
status=${PIPESTATUS[0]}
set -e
(( status == 0 )) || exit "$status"

compact_target="${MAC//:/}"
printf '\n=== Matches for %s ===\n' "$MAC"

found=0
while IFS= read -r line; do
  compact_line="$(tr -cd '0-9A-Fa-f' <<<"$line" | tr '[:upper:]' '[:lower:]')"
  if [[ "$compact_line" == *"$compact_target"* ]]; then
    printf '%s\n' "$line"
    found=1
  fi
done <"$TMP"

if (( found == 0 )); then
  printf 'No matching current DHCP/ARP entry was found.\n'
fi
