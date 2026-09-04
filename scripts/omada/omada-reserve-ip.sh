#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$HERE/lib-omada.sh"

omada_parse_common_args "$@"

MAC=""
IP=""
DESCRIPTION=""

set -- "${OMADA_REST[@]}"
while (( $# )); do
  case "$1" in
    --mac) MAC="${2:?Missing value}"; shift 2 ;;
    --ip) IP="${2:?Missing value}"; shift 2 ;;
    --description) DESCRIPTION="${2:?Missing value}"; shift 2 ;;
    -h|--help)
      cat <<'EOF'
Usage:
  omada-reserve-ip.sh --host ROUTER --user USER --mac MAC --ip IP \
    [--description TEXT] [--password-stdin]

Current behavior:
  * validates MAC and IPv4
  * looks the device up in DHCP + ARP
  * asks the installed firmware CLI for help
  * DOES NOT guess an undocumented reservation write command

TP-Link documents Address Reservation in the Standalone web UI, while the
published standalone CLI guide does not document the create-reservation syntax.
EOF
      exit 0
      ;;
    *) die "Unknown argument: $1" ;;
  esac
done

[[ -n "$MAC" && -n "$IP" ]] || die "--mac and --ip are required"
MAC="$(normalize_mac "$MAC")" || die "Invalid MAC address"
valid_ipv4 "$IP" || die "Invalid IPv4: $IP"

printf 'Requested reservation:\n'
printf '  MAC : %s\n' "$MAC"
printf '  IP  : %s\n' "$IP"
[[ -n "$DESCRIPTION" ]] && printf '  Desc: %s\n' "$DESCRIPTION"
printf '\n'

omada_need_deps

omada_with_password_retries \
  "$OMADA_HOST" "$OMADA_USER" "$OMADA_PORT" "$OMADA_TIMEOUT" "$OMADA_PASSWORD_STDIN" \
  "enable" \
  "config" \
  "show dhcp server client-list" \
  "show arp" \
  "show ip dhcp server pool" \
  "help"

cat <<'EOF'

No reservation change was sent.

Reason:
TP-Link documents DHCP Address Reservation for these gateways in Standalone
mode, but the published standalone CLI guide does not document a command for
creating the reservation. This tool intentionally refuses to invent write
syntax.

If this router's `help` output exposes a reservation/binding command, save the
probe output; a firmware-specific writer can then be added safely.
EOF
