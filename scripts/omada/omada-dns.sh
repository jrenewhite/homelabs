#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$HERE/lib-omada.sh"

omada_parse_common_args "$@"

POOL=""
PRIMARY=""
SECONDARY=""
FALLBACK="1.1.1.1"
YES=0

set -- "${OMADA_REST[@]}"
while (( $# )); do
  case "$1" in
    --pool) POOL="${2:?Missing value}"; shift 2 ;;
    --primary) PRIMARY="${2:?Missing value}"; shift 2 ;;
    --secondary) SECONDARY="${2:?Missing value}"; shift 2 ;;
    --fallback) FALLBACK="${2:?Missing value}"; shift 2 ;;
    --yes) YES=1; shift ;;
    -h|--help)
      cat <<'EOF'
Usage:
  omada-dns.sh --host ROUTER --user USER --pool POOL \
    --primary IP [--secondary IP] [--fallback 1.1.1.1] [--yes]

Safety:
  The final DNS pair MUST contain at least one known public resolver:
  Cloudflare: 1.1.1.1, 1.0.0.1
  Google:     8.8.8.8, 8.8.4.4
  Quad9:      9.9.9.9, 149.112.112.112

If --secondary is omitted, a public fallback is supplied automatically.
EOF
      exit 0
      ;;
    *) die "Unknown argument: $1" ;;
  esac
done

[[ -n "$POOL" && -n "$PRIMARY" ]] ||
  die "--pool and --primary are required"

valid_ipv4 "$PRIMARY" || die "Invalid primary IPv4: $PRIMARY"
valid_ipv4 "$FALLBACK" || die "Invalid fallback IPv4: $FALLBACK"

if [[ -z "$SECONDARY" ]]; then
  if [[ "$PRIMARY" == "$FALLBACK" ]]; then
    SECONDARY="8.8.8.8"
  else
    SECONDARY="$FALLBACK"
  fi
fi

valid_ipv4 "$SECONDARY" || die "Invalid secondary IPv4: $SECONDARY"

if ! is_known_public_dns "$PRIMARY" && ! is_known_public_dns "$SECONDARY"; then
  die "Refusing DNS change: at least one final resolver must be a known public DNS"
fi

printf 'Requested DNS configuration:\n'
printf '  Pool      : %s\n' "$POOL"
printf '  Primary   : %s' "$PRIMARY"
is_known_public_dns "$PRIMARY" && printf ' (%s)' "$(known_public_dns_name "$PRIMARY")"
printf '\n'
printf '  Secondary : %s' "$SECONDARY"
is_known_public_dns "$SECONDARY" && printf ' (%s)' "$(known_public_dns_name "$SECONDARY")"
printf '\n'

if (( YES == 0 )); then
  printf 'Type APPLY to continue: '
  IFS= read -r confirmation
  [[ "$confirmation" == "APPLY" ]] || {
    printf 'Cancelled.\n'
    exit 0
  }
fi

omada_need_deps

# Intentionally do NOT clear the DNS configuration first.
# dns1 is updated, then dns2, so this tool never deliberately creates an
# intermediate state with zero configured resolvers.
omada_with_password_retries \
  "$OMADA_HOST" "$OMADA_USER" "$OMADA_PORT" "$OMADA_TIMEOUT" "$OMADA_PASSWORD_STDIN" \
  "enable" \
  "config" \
  "show ip dhcp server pool" \
  "ip dhcp server pool $POOL" \
  "dns-server dns1 $PRIMARY" \
  "dns-server dns2 $SECONDARY" \
  "exit" \
  "show ip dhcp server pool"
