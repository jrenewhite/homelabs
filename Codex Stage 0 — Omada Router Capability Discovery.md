# Stage 0 — Omada Router Capability Discovery

## Objective

Discover the exact SSH CLI capabilities exposed by the currently installed TP-Link Omada gateway firmware before implementing or using any write operations related to:

- DHCP Address Reservations
- removal of DHCP Address Reservations
- DHCP DNS changes
- reboot
- client lookup by MAC address

This stage is READ-ONLY.

Do not modify router configuration.

---

## Inputs

The operator will provide:

```text
ROUTER_HOST
ROUTER_USER
ROUTER_NAME
SITE_NAME
```

Examples:

```text
ROUTER_HOST=192.168.0.1
ROUTER_USER=admin
ROUTER_NAME=ER707-M2
SITE_NAME=colibri
```

or:

```text
ROUTER_NAME=TL-R605-v2
SITE_NAME=peru
```

Do NOT request or store the password in a file.

Use hidden interactive input or `--password-stdin`.

---

## 0.1 Locate the homelab toolkit

Find the repository/toolkit containing:

```text
homelab
homelab-keygen.sh
homelab-authorize.sh
homelab-bootstrap.sh
homelab-inventory.sh
omada/
```

Prefer the current working directory or repository.

Verify:

```bash
./homelab --help
```

Do not modify toolkit source during Stage 0.

---

## 0.2 Verify local WSL/Linux dependencies

Run:

```bash
./check-deps.sh
```

Expected tools:

```text
ssh
ssh-keygen
sshpass
expect
```

If dependencies are missing and this is Ubuntu/Debian/WSL, installing ONLY these local management dependencies is allowed:

```bash
sudo apt update
sudo apt install -y openssh-client sshpass expect
```

Do not install anything on the router.

Afterward run:

```bash
./check-deps.sh
```

again and save the result.

---

## 0.3 Verify connectivity

Check that the router is reachable.

Use lightweight checks only.

For example:

```bash
ping -c 2 "$ROUTER_HOST"
```

Then test TCP/22 without performing a scan of unrelated hosts.

Examples:

```bash
nc -vz "$ROUTER_HOST" 22
```

or another already-installed equivalent.

Do not install nmap just for this step.

Record:

```text
router reachable: yes/no
SSH port reachable: yes/no
```

---

## 0.4 Run the Omada firmware probe

Create an output directory:

```bash
mkdir -p "probe-results/${SITE_NAME}"
```

Generate a timestamp:

```bash
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
```

Output file:

```bash
PROBE_FILE="probe-results/${SITE_NAME}/${ROUTER_NAME}-${TIMESTAMP}.txt"
```

Run:

```bash
./homelab omada probe \
  --host "$ROUTER_HOST" \
  --user "$ROUTER_USER"
```

If password must come from stdin, use:

```bash
./homelab omada probe \
  --host "$ROUTER_HOST" \
  --user "$ROUTER_USER" \
  --password-stdin
```

Capture the COMPLETE raw output using `tee`:

```bash
./homelab omada probe \
  --host "$ROUTER_HOST" \
  --user "$ROUTER_USER" \
  2>&1 | tee "$PROBE_FILE"
```

Do not sanitize, summarize or modify this raw file.

Do not include the password in the file.

---

## 0.5 Information that MUST be collected

The probe must attempt to capture the complete output for:

```text
show system-info
help
show ip dhcp server pool
show dhcp server client-list
show arp
```

Preserve command prompts and command errors because they may reveal firmware-specific syntax.

---

## 0.6 Search the CLI capabilities

After preserving the raw probe, inspect it for terms related to DHCP reservations.

Search case-insensitively for:

```text
reservation
reserve
binding
bind
static
static-binding
address
address-binding
ip-mac
mac-ip
ipmac
mac
client
dhcp
lease
pool
```

Example:

```bash
grep -Ein \
  'reserv|bind|static|address|ip.?mac|mac.?ip|client|dhcp|lease|pool' \
  "$PROBE_FILE"
```

Save this separately:

```bash
CAPABILITY_FILE="probe-results/${SITE_NAME}/${ROUTER_NAME}-${TIMESTAMP}-capabilities.txt"
```

Example:

```bash
grep -Ein \
  'reserv|bind|static|address|ip.?mac|mac.?ip|client|dhcp|lease|pool' \
  "$PROBE_FILE" \
  | tee "$CAPABILITY_FILE"
```

Do not infer command syntax from a keyword alone.

---

## 0.7 Explore CLI help safely

If the firmware exposes contextual help such as:

```text
?
help
```

it is acceptable to explore help output.

READ-ONLY exploration is allowed.

Examples of commands whose help may be inspected:

```text
ip
ip dhcp
ip dhcp server
ip dhcp server pool
show
show dhcp
show ip dhcp
```

Use only help/context discovery.

DO NOT execute any candidate write command.

In particular, DO NOT execute anything resembling:

```text
reservation ...
binding ...
static-binding ...
no ...
delete ...
remove ...
ip dhcp server ...
```

unless it is clearly only a help invocation and cannot mutate state.

When uncertain, do not execute it.

---

## 0.8 Verify supported existing operations

Determine whether the current firmware accepts these commands without modifying state:

### System information

```text
show system-info
```

### DHCP pools

```text
show ip dhcp server pool
```

### DHCP client lookup

```text
show dhcp server client-list
```

### ARP lookup

```text
show arp
```

Record each as:

```text
SUPPORTED
UNSUPPORTED
UNKNOWN
```

Do not classify a command as supported solely because documentation says so.

Observed firmware behavior wins.

---

## 0.9 Determine DNS syntax without changing DNS

From `help` and contextual help only, determine whether the firmware exposes syntax corresponding to:

```text
ip dhcp server pool <pool>
dns-server dns1 <ip>
dns-server dns2 <ip>
```

Do NOT apply a DNS change during Stage 0.

Record:

```text
DNS pool configuration syntax:
SUPPORTED / UNSUPPORTED / UNKNOWN
```

If supported, include the exact syntax shown by the router.

---

## 0.10 Determine reservation capabilities

The most important result of Stage 0 is determining whether the installed firmware exposes commands for:

### Create reservation

Conceptually:

```text
MAC + reserved IPv4
```

### Remove reservation

Conceptually:

```text
remove reservation associated with MAC and/or IPv4
```

Search the firmware's own help for the exact syntax.

Do not guess.

Classify each independently:

```text
CREATE DHCP RESERVATION:
SUPPORTED
UNSUPPORTED
UNKNOWN

REMOVE DHCP RESERVATION:
SUPPORTED
UNSUPPORTED
UNKNOWN
```

If supported, record the exact help output that demonstrates the syntax.

Do NOT execute the command.

---

## 0.11 Test MAC lookup

Choose ONE MAC belonging to a known infrastructure host if one is already available from the homelab inventory.

Do not invent a MAC.

Run:

```bash
./homelab omada find-mac \
  --host "$ROUTER_HOST" \
  --user "$ROUTER_USER" \
  --mac "$KNOWN_MAC"
```

Save the result:

```text
probe-results/<site>/<router>-<timestamp>-mac-test.txt
```

This operation must remain read-only.

Determine whether the router can correlate the MAC through:

```text
DHCP client list
ARP table
both
neither
```

---

## 0.12 DO NOT reboot during Stage 0

Verify from firmware help/output whether:

```text
reboot
```

exists.

But DO NOT reboot the router during Stage 0.

Record only:

```text
REBOOT COMMAND:
SUPPORTED / UNSUPPORTED / UNKNOWN
```

and its observed syntax.

---

## 0.13 Create Stage 0 summary

Create:

```text
probe-results/<site>/<router>-<timestamp>-summary.md
```

Use this structure:

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

## Relevant CLI help

Include only the relevant snippets from the router's own help output.

## Unknowns

List anything that could not be established.

## Raw evidence

- Probe:
- Capability grep:
- MAC lookup:
```

---

## 0.14 Safety constraints

During Stage 0, NEVER execute router commands that can:

- modify DHCP configuration
- create a reservation
- remove a reservation
- modify DNS
- reboot
- reset
- factory reset
- modify WAN
- modify LAN
- modify VLANs
- modify routes
- modify firewall rules
- modify VPNs
- update firmware
- save/write configuration

The only permitted router operations are READ-ONLY inspection and CLI help.

If a command's safety is uncertain, do not execute it.

---

## 0.15 Completion criteria

Stage 0 is complete only when these artifacts exist:

```text
probe-results/<site>/<router>-<timestamp>.txt
probe-results/<site>/<router>-<timestamp>-capabilities.txt
probe-results/<site>/<router>-<timestamp>-summary.md
```

And, when a known MAC was available:

```text
probe-results/<site>/<router>-<timestamp>-mac-test.txt
```

At completion, report only:

1. detected router model and firmware;
2. whether DHCP reservation CREATE syntax was discovered;
3. whether DHCP reservation REMOVE syntax was discovered;
4. whether DNS syntax was confirmed;
5. whether MAC lookup works;
6. paths to all generated evidence files.

Do not implement or execute Stage 1 changes yet.