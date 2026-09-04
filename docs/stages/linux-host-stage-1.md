# Stage 1 — Linux Host Access Bootstrap and Detailed Inventory

## Objective

Establish reusable SSH key access to Linux homelab hosts and collect a detailed, read-only inventory for each identified host.

Stage 1 has two phases:

1. **Stage 1A — Access bootstrap**
   - identify the current host address;
   - try the existing `~/.ssh/homelabing` key first;
   - when necessary, use the location's SSH password once to install `homelabing.pub`;
   - verify subsequent key-only access.

2. **Stage 1B — Detailed inventory**
   - connect using `homelabing`;
   - collect hardware, OS, network, storage, services and container state;
   - preserve one Markdown evidence file per host;
   - compare observed identity with the location's declared `inventory.yaml`.

The only remote state change permitted during Stage 1 is the idempotent installation of the management public key in the target account's `~/.ssh/authorized_keys`.

Do not otherwise modify host configuration.

---

## Repository contract

Run Stage 1 from the repository root.

```text
homelabs/
├── docs/stages/linux-host-stage-1.md
├── locations/
│   └── <site>/
│       ├── .env
│       ├── inventory.yaml
│       ├── stage-1.md
│       └── inventory-results/
└── scripts/
    ├── homelab
    ├── homelab-keygen.sh
    ├── homelab-bootstrap.sh
    └── homelab-inventory.sh
```

The location's `inventory.yaml` is **declared state**. It is useful for names, roles, previously known MAC addresses and desired/reserved IP addresses, but it must not be treated as proof of the host's current identity.

Observed host state must be reported separately.

Do not silently rewrite `inventory.yaml` during Stage 1. If a declared MAC/IP appears stale, report a proposed reconciliation in the Stage 1 summary and preserve the evidence that supports it.

---

## Required `.env`

Load the location environment:

```bash
SITE_DIR="locations/<site>"
source "$SITE_DIR/.env"
```

Required SSH variables:

```bash
SSH_USER="..."
SSH_PASSWORD="..."
```

Optional:

```bash
SSH_KEY="$HOME/.ssh/homelabing"
SSH_PORT="22"
INVENTORY_RESULTS_DIR="locations/<site>/inventory-results"
```

Defaults:

```bash
SSH_KEY="${SSH_KEY:-$HOME/.ssh/homelabing}"
SSH_PORT="${SSH_PORT:-22}"
SITE_DIR="locations/$SITE_NAME"
INVENTORY_RESULTS_DIR="${INVENTORY_RESULTS_DIR:-$SITE_DIR/inventory-results}"
```

Never echo, log, persist or commit `SSH_PASSWORD`.

Never commit `.env`.

---

## 1.1 Verify local toolkit

From repository root:

```bash
scripts/homelab --help
scripts/check-deps.sh
```

Ensure the management key exists:

```bash
scripts/homelab keygen
```

This is idempotent. Existing `~/.ssh/homelabing` keys must be preserved.

Do not use `--force` unless the operator explicitly requests key rotation.

---

## 1.2 Read declared inventory and existing router evidence

Read:

```text
locations/<site>/inventory.yaml
```

When Stage 0 router evidence exists, also inspect the newest relevant files under:

```text
locations/<site>/probe-results/
```

Use DHCP and ARP observations to locate current hosts.

Important:

- a declared `reserved_ip` is a desired/previous address, not proof that the host currently uses it;
- a declared MAC may be stale after NIC replacement, port changes or hardware reinstallation;
- do not reject a candidate host only because its MAC/IP differs from declared state;
- do not claim a new MAC belongs to a declared host until host-level evidence confirms identity.

Normalize MAC separators and case before comparison.

---

## 1.3 Host discovery rules

Use the least invasive discovery method available.

Preferred sources, in order:

1. current router DHCP client list;
2. current router ARP table;
3. previously captured Stage 0 evidence;
4. declared IP/MAC hints from `inventory.yaml`;
5. hostname information returned by a successful SSH connection.

Do not perform broad or unrelated network scanning.

It is acceptable to test ICMP and TCP/22 only against:

- declared infrastructure addresses; and
- candidate addresses already observed in DHCP/ARP evidence for this site.

When a host cannot be positively identified, mark it `UNRESOLVED` and continue with the remaining hosts.

---

## 1.4 Bootstrap SSH access

For each positively identified Linux host, first let the existing bootstrap helper try key authentication.

If `SSH_PASSWORD` is populated, run the host individually so credentials are not exposed and failures remain attributable to one machine:

```bash
printf '%s\n' "$SSH_PASSWORD" |
  scripts/homelab bootstrap \
    --password-stdin \
    --key "$SSH_KEY" \
    --target "$SSH_USER@$HOST:$SSH_PORT"
```

The helper must:

1. try `homelabing` first;
2. use password authentication only when the key is not already authorized;
3. append the public key idempotently to `authorized_keys`;
4. preserve existing authorized keys;
5. verify key authentication after installation.

Do not change SSH daemon configuration.

Do not disable password authentication during Stage 1.

Do not modify firewall rules.

If bootstrap fails, record the reason and continue with other hosts.

---

## 1.5 Verify key-only access

After bootstrap, verify that the host can be reached using the management key without password fallback.

Example:

```bash
ssh \
  -i "$SSH_KEY" \
  -o IdentitiesOnly=yes \
  -o BatchMode=yes \
  -o ConnectTimeout=8 \
  -p "$SSH_PORT" \
  "$SSH_USER@$HOST" \
  'printf "hostname=%s\n" "$(hostname)"'
```

Record access status as:

```text
KEY_ALREADY_PRESENT
KEY_INSTALLED_AND_VERIFIED
KEY_VERIFICATION_FAILED
UNREACHABLE
AUTHENTICATION_FAILED
UNRESOLVED
```

---

## 1.6 Detailed inventory collection

Create the output directory:

```bash
mkdir -p "$INVENTORY_RESULTS_DIR"
```

For every host with verified key access, run:

```bash
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
OUTPUT="$INVENTORY_RESULTS_DIR/${HOST_ID}-${TIMESTAMP}.md"

scripts/homelab inventory \
  --host "$HOST" \
  --user "$SSH_USER" \
  --port "$SSH_PORT" \
  --identity "$SSH_KEY" \
  --output "$OUTPUT"
```

If passwordless sudo is already available, `--sudo` may be used for additional **read-only** probes. Do not change sudo configuration to make this possible.

Do not use `--password` on the command line.

The inventory collector is expected to capture, when available:

- hostname/FQDN and operating system;
- manufacturer/model/board/BIOS information;
- CPU and architecture;
- memory totals;
- relevant PCI and USB devices;
- GPU information;
- all network interfaces and addresses;
- link-layer information, routing, neighbours and interface speeds;
- DNS and Tailscale state when installed;
- disks, models, serials, partitions, filesystems, UUIDs and mountpoints;
- MD RAID, LVM, Btrfs, ZFS, NFS and mergerfs state when applicable;
- Docker/Podman/LXC/libvirt state;
- notable software;
- running/enabled/failed systemd services and timers;
- listening TCP/UDP ports;
- package-manager summary and scheduled jobs.

Do not install packages on a target merely to improve inventory coverage.

If a useful read-only command is missing, note the gap rather than changing the host.

---

## 1.7 Confirm management identity

For each collected host, extract and explicitly record:

```text
hostname
primary management interface
primary MAC
primary IPv4
all physical Ethernet interfaces and MAC addresses observed
system manufacturer/model
```

Use these host-level observations to correlate the machine with `inventory.yaml`.

A changed MAC or address alone must not be treated as a different machine when stronger host evidence (hostname, hardware model, storage layout, role-specific configuration) confirms identity.

Likewise, do not overwrite a declared identity based only on an ARP entry.

---

## 1.8 Declared-vs-observed classification

For each declared infrastructure host, classify Stage 1 as one of:

- `MATCH` — declared identity and current management identity agree;
- `MATCH_IP_CHANGED` — host identity confirmed, current IP differs from declared/reserved address;
- `MATCH_MAC_CHANGED` — host identity confirmed, current management MAC differs from declared MAC;
- `MATCH_INTERFACE_CHANGED` — host identity confirmed, another interface/port is now the management path;
- `ACCESS_BOOTSTRAPPED` — identity confirmed and `homelabing` was newly installed;
- `ACCESS_ALREADY_READY` — identity confirmed and key already worked;
- `UNREACHABLE` — candidate address exists but host is not reachable;
- `AUTHENTICATION_FAILED` — host is reachable but credentials/key could not establish access;
- `UNRESOLVED` — insufficient evidence to positively identify the declared host.

Multiple observations may apply; the summary should retain both access state and identity state.

---

## 1.9 Reconciliation rules

Do **not** automatically replace `reserved_ip` simply because DHCP currently shows another address. `reserved_ip` represents declared network intent.

Do **not** automatically replace a MAC until the host itself confirms the interface identity.

Instead, create a reconciliation section in the summary:

```markdown
## Proposed inventory.yaml reconciliation

| Host | Field | Declared | Observed | Recommendation | Evidence |
|---|---|---|---|---|---|
```

Recommendations may be:

```text
NO_CHANGE
UPDATE_MAC
ADD_INTERFACE
REVIEW_RESERVED_IP
REVIEW_HOST_IDENTITY
```

Actual `inventory.yaml` changes belong to a reviewed reconciliation step after Stage 1 evidence has been collected.

---

## 1.10 Stage 1 summary

Create:

```text
locations/<site>/inventory-results/stage-1-<timestamp>-summary.md
```

Use this structure:

```markdown
# Linux Host Stage 1 Report

## Site

- Site:
- Audit timestamp:
- SSH user:
- Management key:

## Access bootstrap

| Host ID | Target address | Access result | Key verified |
|---|---|---|---|

## Identity reconciliation

| Host ID | Hostname | Observed primary MAC | Observed IPv4 | Declared MAC | Declared reserved IP | Identity status |
|---|---|---|---|---|---|---|

## Inventory evidence

| Host ID | Inventory file |
|---|---|

## Proposed inventory.yaml reconciliation

| Host | Field | Declared | Observed | Recommendation | Evidence |
|---|---|---|---|---|---|

## Unresolved hosts

List hosts that could not be positively identified or accessed and why.

## Safety confirmation

- `authorized_keys` was the only intended remote mutation.
- no network configuration was changed.
- no services were reconfigured/restarted intentionally.
- no packages were installed on managed hosts.
- no credentials were written to evidence files.
```

---

## 1.11 Safety constraints

Stage 1 must not:

- change host IP configuration;
- change DHCP reservations;
- modify router configuration;
- modify DNS;
- change firewall rules;
- change SSH daemon configuration;
- disable password login;
- install/remove/update packages on managed hosts;
- restart/reboot hosts;
- start/stop containers or services;
- alter RAID/filesystems/mounts;
- modify application configuration;
- rotate SSH keys;
- expose passwords/private keys in logs or committed files.

The only intended managed-host write is adding the existing management **public** key to `authorized_keys` when required.

---

## Completion criteria

Stage 1 is complete when:

1. each identifiable Linux infrastructure host has an access result;
2. every accessible host has verified `homelabing` key access;
3. every accessible host has a detailed inventory Markdown file;
4. primary interface/MAC/IP have been extracted for each inventoried host;
5. declared-vs-observed discrepancies are summarized;
6. unresolved hosts are explicitly listed;
7. no unreviewed `inventory.yaml` reconciliation has been performed.

At completion report:

1. hosts with key access ready;
2. hosts where the key was newly installed;
3. hosts that could not be accessed;
4. confirmed current MAC/IP for each inventoried host;
5. proposed `inventory.yaml` reconciliations;
6. paths to all generated evidence files.

Do not proceed to later configuration stages.