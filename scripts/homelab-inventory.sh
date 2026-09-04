#!/usr/bin/env bash
set -euo pipefail

VERSION="1.0.0"

usage() {
  cat <<'EOF'
Usage:
  homelab-inventory.sh --host HOST --user USER [authentication options] [options]

Required:
  -H, --host HOST             Hostname or IP address
  -u, --user USER             SSH username

Authentication (choose one):
  -p, --password PASSWORD     SSH password (convenient, but may remain in shell history)
      --password-stdin        Read SSH password from stdin
      --identity FILE         SSH private key
                              If none is given, normal SSH agent/key auth is used.

Options:
  -P, --port PORT             SSH port (default: 22)
  -o, --output FILE           Markdown output path
      --full-packages         Include the complete installed-package list
      --sudo                  Use passwordless sudo (-n) for extra read-only probes when available
      --no-hostkey-check      Disable host-key verification (not recommended)
      --timeout SECONDS       SSH connection timeout (default: 8)
  -h, --help                  Show help

Examples:
  ./homelab-inventory.sh -H 192.168.0.20 -u jrenewhite --password-stdin
  ./homelab-inventory.sh -H nas -u jrenewhite --identity ~/.ssh/id_ed25519
  ./homelab-inventory.sh -H 192.168.0.30 -u admin -p 'secret' --full-packages

Security:
  Prefer --password-stdin or SSH keys. Supplying a password with -p/--password
  can expose it in shell history and, briefly, in the local process command line.
EOF
}

HOST=""
USER_NAME=""
PASSWORD=""
PASSWORD_STDIN=0
IDENTITY=""
PORT=22
OUTPUT=""
FULL_PACKAGES=0
USE_SUDO=0
STRICT_HOSTKEY=1
TIMEOUT=8

while [[ $# -gt 0 ]]; do
  case "$1" in
    -H|--host)
      HOST="${2:?Missing value for $1}"
      shift 2
      ;;
    -u|--user)
      USER_NAME="${2:?Missing value for $1}"
      shift 2
      ;;
    -p|--password)
      PASSWORD="${2:?Missing value for $1}"
      shift 2
      ;;
    --password-stdin)
      PASSWORD_STDIN=1
      shift
      ;;
    --identity)
      IDENTITY="${2:?Missing value for $1}"
      shift 2
      ;;
    -P|--port)
      PORT="${2:?Missing value for $1}"
      shift 2
      ;;
    -o|--output)
      OUTPUT="${2:?Missing value for $1}"
      shift 2
      ;;
    --full-packages)
      FULL_PACKAGES=1
      shift
      ;;
    --sudo)
      USE_SUDO=1
      shift
      ;;
    --no-hostkey-check)
      STRICT_HOSTKEY=0
      shift
      ;;
    --timeout)
      TIMEOUT="${2:?Missing value for $1}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --version)
      echo "$VERSION"
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ -z "$HOST" || -z "$USER_NAME" ]]; then
  echo "ERROR: --host and --user are required." >&2
  usage >&2
  exit 2
fi

if [[ $PASSWORD_STDIN -eq 1 && -n "$PASSWORD" ]]; then
  echo "ERROR: use either --password or --password-stdin, not both." >&2
  exit 2
fi

if [[ $PASSWORD_STDIN -eq 1 ]]; then
  IFS= read -r PASSWORD
fi

if [[ -n "$PASSWORD" && -n "$IDENTITY" ]]; then
  echo "ERROR: use password authentication or --identity, not both." >&2
  exit 2
fi


# Prefer the reusable homelabing key when no explicit auth method was supplied.
if [[ -z "$PASSWORD" && -z "$IDENTITY" && -r "${HOME}/.ssh/homelabing" ]]; then
  IDENTITY="${HOME}/.ssh/homelabing"
fi

if [[ -n "$IDENTITY" && ! -r "$IDENTITY" ]]; then
  echo "ERROR: identity file is not readable: $IDENTITY" >&2
  exit 2
fi

if [[ -n "$PASSWORD" ]] && ! command -v sshpass >/dev/null 2>&1; then
  echo "ERROR: password authentication requires 'sshpass' on the machine running this script." >&2
  echo "       Alternatively use --identity or your SSH agent." >&2
  exit 3
fi

SAFE_HOST="${HOST//[^A-Za-z0-9._-]/_}"
if [[ -z "$OUTPUT" ]]; then
  OUTPUT="inventory-${SAFE_HOST}-$(date +%Y%m%d-%H%M%S).md"
fi

SSH_OPTS=(
  -p "$PORT"
  -o "ConnectTimeout=${TIMEOUT}"
  -o "ServerAliveInterval=5"
  -o "ServerAliveCountMax=2"
  -o "LogLevel=ERROR"
)

if [[ $STRICT_HOSTKEY -eq 1 ]]; then
  SSH_OPTS+=(-o "StrictHostKeyChecking=accept-new")
else
  SSH_OPTS+=(
    -o "StrictHostKeyChecking=no"
    -o "UserKnownHostsFile=/dev/null"
  )
fi

if [[ -n "$IDENTITY" ]]; then
  SSH_OPTS+=(-i "$IDENTITY" -o "IdentitiesOnly=yes" -o "BatchMode=yes")
elif [[ -z "$PASSWORD" ]]; then
  SSH_OPTS+=(-o "BatchMode=yes")
fi

REMOTE="${USER_NAME}@${HOST}"

REMOTE_SCRIPT=$(cat <<'REMOTE_EOF'
set -u

FULL_PACKAGES="${INVENTORY_FULL_PACKAGES:-0}"
USE_SUDO="${INVENTORY_USE_SUDO:-0}"

have() {
  command -v "$1" >/dev/null 2>&1
}

heading() {
  printf '\n## %s\n\n' "$1"
}

subheading() {
  printf '\n### %s\n\n' "$1"
}

code_begin() {
  printf '```text\n'
}

code_end() {
  printf '```\n'
}

run_block() {
  local title="$1"
  shift
  subheading "$title"
  code_begin
  "$@" 2>&1 || true
  code_end
}

run_shell_block() {
  local title="$1"
  local command="$2"
  subheading "$title"
  code_begin
  ( eval "$command" ) 2>&1 || true
  code_end
}

print_kv() {
  local key="$1"
  local value="$2"
  printf -- '- **%s:** %s\n' "$key" "${value:-not detected}"
}

echo "# Host Inventory"
echo
print_kv "Audit timestamp" "$(date --iso-8601=seconds 2>/dev/null || date)"
print_kv "Audit user" "$(id -un 2>/dev/null || whoami 2>/dev/null || echo unknown)"
print_kv "Hostname" "$(hostname 2>/dev/null || echo unknown)"
print_kv "FQDN" "$(hostname -f 2>/dev/null || echo not-detected)"


heading "Management identity"

run_shell_block "Primary management interface" '
  if have ip; then
    IFACE=$(ip route show default 2>/dev/null | awk "NR==1 {for(i=1;i<=NF;i++) if(\$i==\"dev\") {print \$(i+1); exit}}")
    if [ -n "$IFACE" ]; then
      MAC=$(cat "/sys/class/net/$IFACE/address" 2>/dev/null || true)
      IPV4=$(ip -4 -o addr show dev "$IFACE" scope global 2>/dev/null | awk "NR==1 {print \$4}" | cut -d/ -f1)
      echo "primary_interface=$IFACE"
      echo "primary_mac=${MAC:-not-detected}"
      echo "primary_ipv4=${IPV4:-not-detected}"
    else
      echo "primary_interface=not-detected"
      echo "primary_mac=not-detected"
      echo "primary_ipv4=not-detected"
    fi
  else
    echo "ip command not installed"
  fi
'

heading "Identity and operating system"

if have hostnamectl; then
  run_block "hostnamectl" hostnamectl
fi

run_shell_block "Operating system" '
  if [ -r /etc/os-release ]; then
    cat /etc/os-release
  elif have lsb_release; then
    lsb_release -a
  else
    uname -a
  fi
'

run_block "Kernel and architecture" uname -a

if [ -r /sys/class/dmi/id/sys_vendor ] || [ -r /sys/class/dmi/id/product_name ]; then
  run_shell_block "System manufacturer and model" '
    for f in \
      sys_vendor product_name product_version board_vendor board_name board_version \
      bios_vendor bios_version bios_date; do
      p="/sys/class/dmi/id/$f"
      if [ -r "$p" ]; then
        printf "%-18s: " "$f"
        cat "$p"
      fi
    done
  '
fi

heading "Compute"

if have lscpu; then
  run_block "CPU" lscpu
else
  run_shell_block "CPU" 'cat /proc/cpuinfo'
fi

run_shell_block "Memory" '
  if have free; then free -h; fi
  echo
  grep -E "MemTotal|MemAvailable|SwapTotal|SwapFree|HugePages_Total|Hugepagesize" /proc/meminfo 2>/dev/null || true
'

if have swapon; then
  run_block "Swap devices" swapon --show
fi

if have lspci; then
  run_shell_block "PCI devices relevant to GPU, network and storage" \
    'lspci -nnk | grep -iEA4 "VGA|3D|Display|Ethernet|Network|SATA|RAID|Non-Volatile|USB controller"'
fi

if have lsusb; then
  run_block "USB devices" lsusb
fi

if have nvidia-smi; then
  run_block "NVIDIA GPU" nvidia-smi
fi

if have rocminfo; then
  run_shell_block "ROCm devices" 'rocminfo | head -n 160'
fi

heading "Networking"

if have ip; then
  run_block "Interfaces and addresses" ip -br addr
  run_block "Link-layer details" ip -br link
  run_block "Routing table" ip route
  run_block "Neighbour table" ip neigh
fi

run_shell_block "Interface link speeds" '
  if have ethtool && have ip; then
    for iface in $(ip -o link show | awk -F": " "{print \$2}" | cut -d@ -f1); do
      [ "$iface" = "lo" ] && continue
      echo "### $iface"
      ethtool "$iface" 2>/dev/null | grep -E "Speed:|Duplex:|Link detected:|Port:" || true
      echo
    done
  else
    echo "ethtool not installed"
  fi
'

run_shell_block "DNS resolver" '
  if have resolvectl; then
    resolvectl status
  elif [ -r /etc/resolv.conf ]; then
    cat /etc/resolv.conf
  fi
'

if have tailscale; then
  run_block "Tailscale" tailscale status
  run_shell_block "Tailscale addresses" 'tailscale ip 2>/dev/null || true'
fi

heading "Storage"

if have lsblk; then
  run_block "Block devices" lsblk -e7 -o NAME,PATH,TYPE,SIZE,MODEL,SERIAL,TRAN,ROTA,FSTYPE,FSVER,LABEL,UUID,MOUNTPOINTS,FSAVAIL,FSUSE%
fi

if have blkid; then
  run_block "Filesystem identifiers" blkid
fi

if have findmnt; then
  run_block "Mounted filesystems" findmnt -R /
fi

if have df; then
  run_block "Filesystem usage" df -hT
fi

if [ -r /proc/mdstat ]; then
  run_shell_block "Linux MD RAID" 'cat /proc/mdstat'
fi

if have mdadm; then
  run_shell_block "MD RAID details" '
    for md in /dev/md/* /dev/md[0-9]*; do
      [ -e "$md" ] || continue
      echo "### $md"
      mdadm --detail "$md" 2>/dev/null || true
      echo
    done
  '
fi

if have pvs || have vgs || have lvs; then
  run_shell_block "LVM" '
    have pvs && pvs 2>/dev/null || true
    echo
    have vgs && vgs 2>/dev/null || true
    echo
    have lvs && lvs -a -o +devices 2>/dev/null || true
  '
fi

if have btrfs; then
  run_shell_block "Btrfs" '
    btrfs filesystem show 2>/dev/null || true
    echo
    btrfs filesystem usage / 2>/dev/null || true
  '
fi

if have zpool; then
  run_shell_block "ZFS pools" 'zpool status; echo; zpool list'
fi

run_shell_block "Network filesystems" '
  if have findmnt; then
    findmnt -t nfs,nfs4,cifs,fuse.sshfs 2>/dev/null || true
  fi
'

run_shell_block "NFS exports" '
  if have exportfs; then
    exportfs -v 2>/dev/null || true
  elif [ -r /etc/exports ]; then
    cat /etc/exports
  else
    echo "No readable NFS export configuration detected"
  fi
'

run_shell_block "MergerFS" '
  if have mergerfs; then
    mergerfs --version 2>/dev/null || true
  fi
  if have findmnt; then
    findmnt -t fuse.mergerfs 2>/dev/null || true
  fi
  grep -R "mergerfs" /etc/fstab /etc/systemd/system 2>/dev/null | head -n 100 || true
'

if [ "$USE_SUDO" = "1" ] && have sudo && sudo -n true 2>/dev/null; then
  if have smartctl; then
    run_shell_block "SMART health (passwordless sudo)" '
      lsblk -dn -o PATH,TYPE | while read -r d type; do
        [ "$type" = "disk" ] || continue
        echo "### $d"
        sudo -n smartctl -i -H "$d" 2>/dev/null || true
        echo
      done
    '
  fi
fi

heading "Containers and virtualization"

if have docker; then
  run_block "Docker version" docker version
  run_shell_block "Docker containers" \
    'docker ps -a --no-trunc --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
  run_shell_block "Docker container mounts" '
    for c in $(docker ps -a --format "{{.Names}}" 2>/dev/null); do
      echo "### $c"
      docker inspect --format "{{range .Mounts}}{{.Type}}: {{.Source}} -> {{.Destination}} (rw={{.RW}}){{println}}{{end}}" "$c" 2>/dev/null || true
      echo
    done
  '
  run_block "Docker images" docker image ls
  run_block "Docker networks" docker network ls
  run_block "Docker volumes" docker volume ls
  run_shell_block "Docker disk usage" 'docker system df 2>/dev/null || true'
fi

if have podman; then
  run_block "Podman version" podman version
  run_shell_block "Podman containers" \
    'podman ps -a --no-trunc --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
  run_block "Podman images" podman images
  run_block "Podman volumes" podman volume ls
fi

if have lxc; then
  run_block "LXC containers" lxc list
elif have lxc-ls; then
  run_block "LXC containers" lxc-ls -f
fi

if have virsh; then
  run_block "libvirt virtual machines" virsh list --all
fi

heading "Software and services"

run_shell_block "Notable software" '
  commands="
    docker
    podman
    nerdctl
    containerd
    ctr
    docker-compose
    kubectl
    k3s
    kubeadm
    helm
    ansible
    terraform
    tailscale
    cloudflared
    pihole
    jellyfin
    ffmpeg
    nginx
    apache2
    httpd
    caddy
    traefik
    samba
    smbd
    nmbd
    mount.nfs
    exportfs
    mergerfs
    smartctl
    mdadm
    btrfs
    zpool
    python3
    node
    npm
    java
    dotnet
    git
    restic
    borg
    rclone
    rsync
    upsc
  "

  for c in $commands; do
    if have "$c"; then
      path=$(command -v "$c")
      version=$(
        "$c" --version 2>/dev/null | head -n 2 | tr "\n" " " ||
        "$c" version 2>/dev/null | head -n 2 | tr "\n" " " ||
        true
      )
      printf "%-18s %-35s %s\n" "$c" "$path" "$version"
    fi
  done
'

if have systemctl; then
  run_shell_block "Running systemd services" \
    'systemctl list-units --type=service --state=running --no-pager --no-legend'
  run_shell_block "Enabled systemd services" \
    'systemctl list-unit-files --type=service --state=enabled --no-pager --no-legend'
  run_shell_block "Systemd timers" \
    'systemctl list-timers --all --no-pager'
  run_shell_block "Failed systemd units" \
    'systemctl --failed --no-pager'
fi

run_shell_block "Listening TCP/UDP ports" '
  if have ss; then
    ss -lntup 2>/dev/null || ss -lntu
  elif have netstat; then
    netstat -lntup 2>/dev/null || netstat -lntu
  fi
'

heading "Packages"

run_shell_block "Package-manager summary" '
  if have dpkg-query; then
    echo "Package manager: dpkg"
    printf "Installed packages: "
    dpkg-query -W 2>/dev/null | wc -l
  elif have rpm; then
    echo "Package manager: rpm"
    printf "Installed packages: "
    rpm -qa 2>/dev/null | wc -l
  elif have pacman; then
    echo "Package manager: pacman"
    printf "Installed packages: "
    pacman -Q 2>/dev/null | wc -l
  elif have apk; then
    echo "Package manager: apk"
    printf "Installed packages: "
    apk info 2>/dev/null | wc -l
  else
    echo "No supported package manager detected"
  fi
'

if [ "$FULL_PACKAGES" = "1" ]; then
  run_shell_block "Complete installed-package list" '
    if have dpkg-query; then
      dpkg-query -W 2>/dev/null
    elif have rpm; then
      rpm -qa --qf "%{NAME}\t%{VERSION}-%{RELEASE}\n" 2>/dev/null | sort
    elif have pacman; then
      pacman -Q 2>/dev/null
    elif have apk; then
      apk info -v 2>/dev/null
    else
      echo "No supported package manager detected"
    fi
  '
else
  echo
  echo "_Full package list omitted. Run with \`--full-packages\` to include it._"
fi

heading "Scheduled jobs and boot configuration"

run_shell_block "User crontab" 'crontab -l 2>/dev/null || echo "No readable user crontab"'

run_shell_block "System cron directories" '
  for p in /etc/crontab /etc/cron.d /etc/cron.daily /etc/cron.hourly /etc/cron.weekly /etc/cron.monthly; do
    if [ -e "$p" ]; then
      echo "### $p"
      if [ -d "$p" ]; then
        ls -la "$p"
      else
        cat "$p"
      fi
      echo
    fi
  done
'

heading "Security-safe SSH summary"

run_shell_block "SSH daemon presence and listening state" '
  if have sshd; then
    sshd -V 2>&1 | head -n 1 || true
  fi
  if have ss; then
    ss -lnt 2>/dev/null | grep -E "(:22|:2222)([[:space:]]|$)" || true
  fi
'

heading "Inventory notes"

echo "- No environment variables, passwords, tokens, private keys, or container secrets were intentionally collected."
echo "- Commands that were unavailable or denied were skipped."
echo "- The audit is read-only by design."
REMOTE_EOF
)

export INVENTORY_FULL_PACKAGES="$FULL_PACKAGES"
export INVENTORY_USE_SUDO="$USE_SUDO"

TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

{
  echo "# Homelab Inventory: ${HOST}"
  echo
  echo "- **Requested target:** \`${HOST}:${PORT}\`"
  echo "- **SSH user:** \`${USER_NAME}\`"
  echo "- **Collector:** \`homelab-inventory.sh ${VERSION}\`"
  echo "- **Collected at:** \`$(date --iso-8601=seconds 2>/dev/null || date)\`"
  echo
  echo "---"
  echo
} > "$TMP"

echo "Connecting to ${REMOTE}:${PORT}..." >&2

set +e
if [[ -n "$PASSWORD" ]]; then
  SSHPASS="$PASSWORD" \
    sshpass -e ssh "${SSH_OPTS[@]}" "$REMOTE" \
      "INVENTORY_FULL_PACKAGES='$FULL_PACKAGES' INVENTORY_USE_SUDO='$USE_SUDO' bash -s" \
      <<< "$REMOTE_SCRIPT" >> "$TMP"
  STATUS=$?
else
  ssh "${SSH_OPTS[@]}" "$REMOTE" \
    "INVENTORY_FULL_PACKAGES='$FULL_PACKAGES' INVENTORY_USE_SUDO='$USE_SUDO' bash -s" \
    <<< "$REMOTE_SCRIPT" >> "$TMP"
  STATUS=$?
fi
set -e

if [[ $STATUS -ne 0 ]]; then
  echo "ERROR: SSH inventory failed with exit code $STATUS." >&2
  exit "$STATUS"
fi

mv "$TMP" "$OUTPUT"
trap - EXIT

echo "Inventory written to: $OUTPUT"
