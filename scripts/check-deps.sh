#!/usr/bin/env bash
set -euo pipefail

missing=0

check() {
  local cmd="$1" package="$2"
  if command -v "$cmd" >/dev/null 2>&1; then
    printf '[OK]      %-12s %s\n' "$cmd" "$(command -v "$cmd")"
  else
    printf '[MISSING] %-12s package: %s\n' "$cmd" "$package"
    missing=1
  fi
}

check ssh openssh-client
check ssh-keygen openssh-client
check sshpass sshpass
check expect expect

printf '\n'
if (( missing )); then
  cat <<'EOF'
On Ubuntu/Debian/WSL:
  sudo apt update
  sudo apt install openssh-client sshpass expect
EOF
  exit 1
fi

printf 'All toolkit dependencies are present.\n'
