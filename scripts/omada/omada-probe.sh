#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$HERE/lib-omada.sh"

omada_parse_common_args "$@"
omada_need_deps

omada_with_password_retries \
  "$OMADA_HOST" "$OMADA_USER" "$OMADA_PORT" "$OMADA_TIMEOUT" "$OMADA_PASSWORD_STDIN" \
  "enable" \
  "show system-info" \
  "config" \
  "help" \
  "show ip dhcp server pool" \
  "show dhcp server client-list" \
  "show arp"
