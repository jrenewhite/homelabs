# Stage 0 — Omada Router Capability Discovery

## Objective

Discover the exact SSH CLI capabilities exposed by the installed TP-Link Omada gateway firmware before implementing or using write operations related to:

- DHCP Address Reservations
- removal of DHCP Address Reservations
- DHCP DNS changes
- reboot
- client lookup by MAC address

Stage 0 is **READ-ONLY** for the router.

Do not modify router configuration during this stage.

## Repository contract

Run Stage 0 from the repository root.

Repository layout:

```text
homelabs/
├── docs/stages/omada-stage-0.md
├── locations/
│   └── <site>/
│       ├── .env
│       ├── inventory.yaml
│       ├── stage-0.md
│       └── probe-results/
└── scripts/
    ├── check-deps.sh
    ├── homelab
    └── omada/
```

Each location provides two inputs:

- `.env`: local, ignored configuration/credentials for connecting to the site
- `inventory.yaml`: versioned declared infrastructure state

Observed state from the router always takes precedence when reporting what is actually present. Do not silently rewrite `inventory.yaml` during Stage 0.

## Required location `.env`

Load the location environment before running the stage:

```bash
SITE_DIR="locations/<site>"
source "$SITE_DIR/.env"
```

Expected variables:

```bash
SITE_NAME="..."
ROUTER_NAME="..."
ROUTER_HOST="..."
ROUTER_PORT="22"
ROUTER_USER="..."
ROUTER_PASSWORD="..."
```

Optional location variables may include:

```bash
LAN_CIDR="..."
LAN_GATEWAY="..."
PROBE_RESULTS_DIR="..."
INVENTORY_RESULTS_DIR="..."
```

Never print `ROUTER_PASSWORD` or include it in generated files.

If `ROUTER_PASSWORD` is empty, allow the existing Omada helper to request it interactively.

## Required declared inventory

Read:

```text
locations/<site>/inventory.yaml
```

Use it as declared state for:

- site identity
- network information
- router model/mode
- infrastructure host names
- MAC addresses
- reserved IPs
- roles
- expected enabled state

Normalize MAC addresses before comparison. For example, these values represent the same MAC:

```text
C4-65-16-AC-AB-37
c4:65:16:ac:ab:37
C46516ACAB37
```

Do not invent missing values in `inventory.yaml`.

## 0.1 Verify toolkit and dependencies

From repository root:

```bash
scripts/homelab --help
scripts/check-deps.sh
```

Expected local tools:

```text
ssh
ssh-keygen
sshpass
expect
```

If dependencies are missing and the management environment is Ubuntu/Debian/WSL, installing only these local management dependencies is allowed:

```bash
sudo apt update
sudo apt install -y openssh-client sshpass expect
```

Do not install anything on the router.

Run `scripts/check-deps.sh` again after installation.

## 0.2 Validate location variables

At minimum verify:

```bash
required_vars=(
  SITE_NAME
  ROUTER_NAME
  ROUTER_HOST
  ROUTER_PORT
  ROUTER_USER
)

for var in "${required_vars[@]}"; do
  if [[ -z "${!var:-}" ]]; then
    printf 'Missing required variable: %s\n' "$var" >&2
    exit 1
  fi
done
```

If the location's `inventory.yaml` declares no router, or declares a non-Omada/non-standalone router, stop the Omada-specific stage and report that it is not applicable yet.

## 0.3 Verify connectivity

Use lightweight checks only:

```bash
ping -c 2 "$ROUTER_HOST"
```

Test SSH port reachability using an already-installed tool such as `nc` if available.

Do not scan unrelated hosts and do not install nmap for this stage.

Record:

```text
router reachable: yes/no
SSH port reachable: yes/no
```

## 0.4 Prepare evidence paths

Default the results directory to the location folder unless `.env` overrides it:

```bash
SITE_DIR="locations/$SITE_NAME"
PROBE_RESULTS_DIR="${PROBE_RESULTS_DIR:-$SITE_DIR/probe-results}"
mkdir -p "$PROBE_RESULTS_DIR"

TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
PROBE_FILE="$PROBE_RESULTS_DIR/${ROUTER_NAME}-${TIMESTAMP}.txt"
CAPABILITY_FILE="$PROBE_RESULTS_DIR/${ROUTER_NAME}-${TIMESTAMP}-capabilities.txt"
SUMMARY_FILE="$PROBE_RESULTS_DIR/${ROUTER_NAME}-${TIMESTAMP}-summary.md"
MAC_TEST_FILE="$PROBE_RESULTS_DIR/${ROUTER_NAME}-${TIMESTAMP}-mac-test.txt"
```

## 0.5 Run the firmware probe

If `ROUTER_PASSWORD` is populated:

```bash
printf '%s\n' "$ROUTER_PASSWORD" |
  scripts/homelab omada probe \
    --host "$ROUTER_HOST" \
    --user "$ROUTER_USER" \
    --port "$ROUTER_PORT" \
    --password-stdin \
    2>&1 | tee "$PROBE_FILE"
```

Otherwise run interactively:

```bash
scripts/homelab omada probe \
  --host "$ROUTER_HOST" \
  --user "$ROUTER_USER" \
  --port "$ROUTER_PORT" \
  2>&1 | tee "$PROBE_FILE"
```

Preserve the complete raw output, including prompts and command errors.

The probe must attempt to collect:

```text
show system-info
help
show ip dhcp server pool
show dhcp server client-list
show arp
```

## 0.6 Extract candidate capabilities

Search the preserved probe for reservation/DHCP-related terms:

```bash
grep -Ein \
  'reserv|bind|static|address|ip.?mac|mac.?ip|client|dhcp|lease|pool' \
  "$PROBE_FILE" \
  | tee "$CAPABILITY_FILE"
```

Do not infer a write command merely from a keyword match.

## 0.7 Explore contextual help safely

Read-only help discovery is allowed when the firmware supports `help` or `?`.

Useful command families may include:

```text
show
show dhcp
show ip dhcp
ip
ip dhcp
ip dhcp server
ip dhcp server pool
```

Do not execute a candidate write command merely to discover whether it works.

In particular, do not execute anything that could create/delete reservations, clear configuration, change DNS or save configuration.

If safety is uncertain, do not execute it.

## 0.8 Classify observed read-only capabilities

Classify each as `SUPPORTED`, `UNSUPPORTED`, or `UNKNOWN` based on observed firmware behavior:

| Capability | Expected observation |
|---|---|
| System information | `show system-info` |
| DHCP pool inspection | `show ip dhcp server pool` |
| DHCP client list | `show dhcp server client-list` |
| ARP table | `show arp` |
| MAC lookup | correlation using DHCP and/or ARP |

Documentation alone is not sufficient to mark a capability supported.

## 0.9 Determine DNS syntax without changing DNS

From firmware help/output only, determine whether syntax equivalent to the following exists:

```text
ip dhcp server pool <pool>
dns-server dns1 <ip>
dns-server dns2 <ip>
```

Do not change DNS during Stage 0.

Record the exact firmware-provided syntax when available.

## 0.10 Determine reservation create/remove capabilities

Independently determine whether the firmware exposes an exact command for:

```text
CREATE DHCP RESERVATION
REMOVE DHCP RESERVATION
```

Do not guess.

Classify each:

```text
SUPPORTED
UNSUPPORTED
UNKNOWN
```

If supported, preserve the exact help output proving the syntax.

Do not execute either write command during Stage 0.

## 0.11 Verify declared infrastructure against router observations

For every enabled entry in `locations/<site>/inventory.yaml` that contains a MAC address, compare declared state with:

- DHCP client list
- ARP table
- any reservation information exposed by the router

Use these statuses:

- `MATCH` — declared reservation and observed device agree
- `RESERVED_NOT_ACTIVE` — reservation exists but device is not currently observed
- `ACTIVE_DIFFERENT_IP` — MAC is active on another IP
- `MAC_MISMATCH` — declared IP points to another MAC
- `RESERVATION_MISSING` — expected reservation is absent
- `DUPLICATE` — duplicate reservation/IP/MAC relationship detected
- `UNKNOWN` — insufficient evidence

Do not repair discrepancies during Stage 0.

## 0.12 Run one MAC lookup test

Choose one MAC from an enabled infrastructure entry in `inventory.yaml`.

If `ROUTER_PASSWORD` is populated:

```bash
printf '%s\n' "$ROUTER_PASSWORD" |
  scripts/homelab omada find-mac \
    --host "$ROUTER_HOST" \
    --user "$ROUTER_USER" \
    --port "$ROUTER_PORT" \
    --mac "$KNOWN_MAC" \
    --password-stdin \
    2>&1 | tee "$MAC_TEST_FILE"
```

Otherwise run the same command interactively without `--password-stdin`.

Determine whether the MAC can be correlated through:

```text
DHCP client list
ARP table
both
neither
```

## 0.13 Reboot capability

Determine from help/output whether `reboot` is supported.

Do **not** reboot during Stage 0.

Record:

```text
REBOOT COMMAND: SUPPORTED / UNSUPPORTED / UNKNOWN
```

and the observed syntax.

## 0.14 Generate summary

Create `$SUMMARY_FILE` with:

```markdown
# Omada Stage 0 Capability Report

## Router

- Site:
- Declared model:
- Detected model:
- Firmware:
- Host:
- SSH port:
- Audit timestamp:

## Connectivity

- ICMP:
- SSH:
- Authentication:
- CLI prompt detected:

## Read-only commands

| Capability | Status | Observed command |
|---|---|---|
| System information | | |
| DHCP pool inspection | | |
| DHCP client list | | |
| ARP table | | |
| MAC lookup | | |

## DHCP DNS

- Status:
- Pool command:
- DNS1 syntax:
- DNS2 syntax:
- Evidence:

## DHCP Reservation — Create

- Status:
- Exact syntax:
- Evidence:

## DHCP Reservation — Remove

- Status:
- Exact syntax:
- Evidence:

## Reboot

- Status:
- Exact syntax:
- NOT EXECUTED during Stage 0

## Declared infrastructure verification

| Name | Declared MAC | Declared IP | Router reservation | DHCP observation | ARP observation | Status |
|---|---|---|---|---|---|---|

## Relevant CLI help

Include only relevant snippets from the router's own output.

## Unknowns

List anything that could not be established.

## Raw evidence

- Probe:
- Capability grep:
- MAC lookup:
- Declared inventory: `locations/<site>/inventory.yaml`
```

## 0.15 Safety constraints

During Stage 0, never execute router commands that can:

- modify DHCP configuration
- create or remove a reservation
- modify DNS
- reboot
- reset or factory reset
- modify WAN/LAN/VLANs/routes/firewall/VPNs
- update firmware
- save/write configuration

Only read-only inspection and clearly non-mutating help discovery are permitted.

## Completion criteria

Stage 0 is complete when these artifacts exist:

```text
locations/<site>/probe-results/<router>-<timestamp>.txt
locations/<site>/probe-results/<router>-<timestamp>-capabilities.txt
locations/<site>/probe-results/<router>-<timestamp>-summary.md
locations/<site>/probe-results/<router>-<timestamp>-mac-test.txt
```

At completion report:

1. detected router model and firmware
2. whether reservation CREATE syntax was discovered
3. whether reservation REMOVE syntax was discovered
4. whether DNS syntax was confirmed
5. whether MAC lookup works
6. declared-vs-observed discrepancies
7. generated evidence paths

Do not implement or execute Stage 1 changes yet.
