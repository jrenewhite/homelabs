# Colibrí 138 — Stage 1 Access Bootstrap and Detailed Inventory

## Purpose

Execute the generic Linux-host Stage 1 procedure for the Colibrí infrastructure.

Primary goals:

1. leave reusable `homelabing` SSH key access ready on every reachable Linux infrastructure host;
2. positively identify the HP EliteDesk after it is reconnected, even if its current MAC/IP differs from the previous declaration;
3. resolve the AOOSTAR WTR Pro `...:46` vs `...:47` interface discrepancy using host-level evidence;
4. collect a detailed Markdown inventory from every accessible host;
5. produce proposed, evidence-backed reconciliation changes without silently rewriting `inventory.yaml`.

Follow:

```text
docs/stages/linux-host-stage-1.md
```

This file adds Colibrí-specific constraints and priorities.

---

## Site files

Use:

```text
locations/colibri-138/.env
locations/colibri-138/inventory.yaml
locations/colibri-138/probe-results/
locations/colibri-138/inventory-results/
```

From repository root:

```bash
source locations/colibri-138/.env
```

The `.env` already provides the site credentials, including:

```text
SSH_USER
SSH_PASSWORD
ROUTER_USER
ROUTER_PASSWORD
```

Do not print or persist either password.

---

## Declared Colibrí infrastructure

Read the authoritative declared baseline from:

```text
locations/colibri-138/inventory.yaml
```

Do not duplicate or hardcode that YAML as a second source of truth.

At the beginning of Stage 1 it declares these host roles/names:

```text
management-hp-elitedesk-800-g4
nas-aoostar-wtr-pro
services-minisforum-um890
ai-gpu-minisforum-790S7
orangepi5-ultra
orangepi5-max
orangepi5-a
orangepi5-b
```

Declared MAC/IP values are hints for discovery and reconciliation, not proof of current identity.

---

## Prior Stage 0 evidence

Read the latest Stage 0 summary and relevant raw evidence under:

```text
locations/colibri-138/probe-results/
```

The Stage 0 run on 2026-09-04 established the following observations that matter to Stage 1:

- `services-minisforum-um890` matched its declared `.12` MAC/IP;
- `ai-gpu-minisforum-790S7` matched `.13`;
- `orangepi5-ultra` matched `.14`;
- `orangepi5-max` matched `.15`;
- `orangepi5-a` matched `.16`;
- `orangepi5-b` matched `.17`;
- the previous management identity was visible in ARP at `.10`, but the router did not expose it as a permanent DHCP `bind:1` entry;
- `nas-aoostar-wtr-pro` was declared with MAC ending `:47`, while router ARP observed `.11` using MAC ending `:46`.

These are previous observations only. Refresh current router observations before deciding where a host is now.

---

## 1. Colibrí discovery refresh

Before bootstrapping Linux hosts, collect a fresh **read-only** router snapshot so the recently reconnected EliteDesk can be found even if DHCP assigns a different address.

Create:

```bash
SITE_DIR="locations/colibri-138"
INVENTORY_RESULTS_DIR="${INVENTORY_RESULTS_DIR:-$SITE_DIR/inventory-results}"
mkdir -p "$INVENTORY_RESULTS_DIR"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
ROUTER_DISCOVERY_FILE="$INVENTORY_RESULTS_DIR/router-discovery-${TIMESTAMP}.txt"
```

If `ROUTER_PASSWORD` is available:

```bash
printf '%s\n' "$ROUTER_PASSWORD" |
  scripts/homelab omada probe \
    --host "$ROUTER_HOST" \
    --user "$ROUTER_USER" \
    --port "${ROUTER_PORT:-22}" \
    --password-stdin \
    2>&1 | tee "$ROUTER_DISCOVERY_FILE"
```

This helper may only be used for its existing read-only commands (`show ...` and CLI help). Do not perform the Stage 0 contextual DHCP-pool entry experiment and do not execute router write commands during Stage 1.

Use the fresh DHCP client list and ARP table to identify candidate addresses.

---

## 2. EliteDesk management host — special handling

`management-hp-elitedesk-800-g4` is being re-added to the network.

Do **not** require its previous declared MAC or `.10` address to match before attempting identification.

Treat the old MAC/IP as historical hints only.

Discovery procedure:

1. check whether the previous `.10` address is currently reachable and what MAC owns it;
2. inspect the fresh router DHCP client list and ARP table for newly/currently active candidates;
3. prefer candidates whose DHCP hostname or later SSH hostname resembles the management host;
4. test TCP/22 only against declared infrastructure addresses and candidate addresses already returned by router DHCP/ARP evidence;
5. when SSH authentication succeeds, collect host identity before deciding it is the EliteDesk;
6. confirm using multiple host-level signals such as:
   - hostname;
   - HP manufacturer/model information;
   - EliteDesk 800 G4 model identity;
   - CPU/platform information;
   - NIC inventory;
   - storage layout;
   - management role/software where already present.

A new MAC is acceptable if the host-level evidence confirms the same EliteDesk.

If identity is confirmed with a different management MAC, report `MATCH_MAC_CHANGED` or `MATCH_INTERFACE_CHANGED` as appropriate.

If the current IP differs from `.10`, report `MATCH_IP_CHANGED`. Do not replace the declared `reserved_ip` automatically.

If no candidate can be positively confirmed, mark the host `UNRESOLVED` rather than guessing.

---

## 3. AOOSTAR WTR Pro — special handling

For `nas-aoostar-wtr-pro`, Stage 0 observed a discrepancy between the declared management MAC ending `:47` and the ARP MAC ending `:46` at `.11`.

Do not treat either MAC as a typo.

After SSH access is established, the detailed inventory must explicitly identify:

- every physical Ethernet interface;
- interface names;
- every interface MAC;
- link state when available;
- current IPv4 addresses;
- primary/default-route interface;
- primary management MAC;
- interface speed when available.

Determine whether `...:46` and `...:47` are separate interfaces on the same WTR Pro.

The Stage 1 summary must state which MAC is currently the management path and whether the other MAC belongs to another physical port on the same host.

Recommendation rules:

- if both MACs belong to the WTR Pro and `:46` is currently primary, recommend `ADD_INTERFACE` plus a reviewed management-MAC reconciliation;
- if `:47` is not observed on the WTR Pro, recommend `UPDATE_MAC` only when host identity is otherwise conclusively established;
- if evidence remains incomplete, recommend `REVIEW_HOST_IDENTITY`.

Do not change the router reservation during Stage 1.

---

## 4. Remaining declared hosts

As of Stage 0, the following hosts had matching declared and router-observed MAC/IP pairs:

```text
services-minisforum-um890
ai-gpu-minisforum-790S7
orangepi5-ultra
orangepi5-max
orangepi5-a
orangepi5-b
```

Use their current fresh router observations rather than assuming Stage 0 state is unchanged.

For each host:

1. identify the current address;
2. bootstrap/verify `homelabing` access;
3. run the detailed inventory collector;
4. extract primary interface/MAC/IP;
5. compare against `inventory.yaml`.

---

## 5. SSH bootstrap order

Use this order so the two identity questions are resolved first:

```text
1. management-hp-elitedesk-800-g4
2. nas-aoostar-wtr-pro
3. services-minisforum-um890
4. ai-gpu-minisforum-790S7
5. orangepi5-ultra
6. orangepi5-max
7. orangepi5-a
8. orangepi5-b
```

For each positively identified host, run bootstrap individually.

Example:

```bash
printf '%s\n' "$SSH_PASSWORD" |
  scripts/homelab bootstrap \
    --password-stdin \
    --key "${SSH_KEY:-$HOME/.ssh/homelabing}" \
    --target "$SSH_USER@$HOST:${SSH_PORT:-22}"
```

The same password may be reused by the operator across hosts, but each host should still be processed as its own target so failures remain isolated and attributable.

If key access already works, bootstrap must not unnecessarily rewrite `authorized_keys`.

Do not install or enable an SSH server if a host does not already expose SSH. Record that condition instead.

---

## 6. Detailed inventory output naming

Store evidence under:

```text
locations/colibri-138/inventory-results/
```

Use stable host IDs from `inventory.yaml` for filenames, not transient IP addresses.

Examples:

```text
management-hp-elitedesk-800-g4-<timestamp>.md
nas-aoostar-wtr-pro-<timestamp>.md
services-minisforum-um890-<timestamp>.md
ai-gpu-minisforum-790S7-<timestamp>.md
orangepi5-ultra-<timestamp>.md
orangepi5-max-<timestamp>.md
orangepi5-a-<timestamp>.md
orangepi5-b-<timestamp>.md
stage-1-<timestamp>-summary.md
router-discovery-<timestamp>.txt
```

Run the existing collector with key-only access:

```bash
scripts/homelab inventory \
  --host "$HOST" \
  --user "$SSH_USER" \
  --port "${SSH_PORT:-22}" \
  --identity "${SSH_KEY:-$HOME/.ssh/homelabing}" \
  --output "$OUTPUT"
```

Use `--sudo` only if passwordless sudo is already configured and the additional probes remain read-only.

Do not configure passwordless sudo during this stage.

---

## 7. Colibrí summary requirements

In addition to the generic Stage 1 summary, explicitly answer:

### EliteDesk

- Was the host positively identified?
- Current hostname?
- Current IPv4?
- Current primary interface?
- Current primary MAC?
- Does the previous declared MAC still exist on any interface?
- Does `.10` remain the current address?
- Was `homelabing` already present or newly installed?

### WTR Pro

- Current hostname?
- Current primary IPv4?
- Current primary interface/MAC?
- Is MAC ending `:46` present?
- Is MAC ending `:47` present?
- Are both MACs interfaces on the same machine?
- Which interface owns the default route/current management path?
- Recommended `inventory.yaml` reconciliation?

### All hosts

Create a table:

```markdown
| Host ID | Current IP | Primary MAC | SSH key state | Identity state | Inventory file |
|---|---|---|---|---|---|
```

Then create:

```markdown
## Proposed inventory.yaml reconciliation

| Host | Field | Declared | Observed | Recommendation | Evidence |
|---|---|---|---|---|---|
```

Do not modify `locations/colibri-138/inventory.yaml` during this execution.

---

## 8. Commit policy

It is acceptable to commit generated Stage 1 evidence files under:

```text
locations/colibri-138/inventory-results/
```

and any Stage 1 documentation changes explicitly required by the task.

Never commit:

```text
locations/colibri-138/.env
SSH_PASSWORD
ROUTER_PASSWORD
private SSH keys
```

Before committing, inspect generated evidence for accidental credential disclosure.

Do not include plaintext passwords in commit messages, files or console summaries.

---

## Completion

Colibrí Stage 1 is complete when every identifiable/reachable Linux infrastructure host has been processed and the summary clearly distinguishes:

- confirmed host identity;
- current management IP/MAC;
- SSH key bootstrap state;
- detailed inventory evidence;
- proposed reconciliation of any stale declared state.

Do not make DHCP reservation, DNS, service migration or other infrastructure configuration changes as part of this stage.