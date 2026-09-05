# Perú 39 — Stage 0 Omada Discovery

## Purpose

Execute the generic Omada Stage 0 procedure for the Perú 39 site and establish a router/network baseline before bootstrapping Linux hosts.

Follow the generic procedure in:

```text
docs/stages/omada-stage-0.md
```

This file adds Perú-specific constraints for a site whose infrastructure inventory is not yet populated.

Stage 0 is READ-ONLY for the router.

Do not change DHCP, DNS, reservations, LAN/WAN configuration, VLANs, firewall, VPN, firmware or reboot state.

---

## Site files

Use:

```text
locations/peru-39/.env
locations/peru-39/inventory.yaml
locations/peru-39/probe-results/
```

From repository root:

```bash
source locations/peru-39/.env
```

Do not print or persist credentials from `.env`.

The environment should provide the router connection values expected by the generic Stage 0 workflow, including:

```text
ROUTER_HOST
ROUTER_PORT
ROUTER_USER
ROUTER_PASSWORD
```

and the Linux-host credentials that will be used later by Stage 1:

```text
SSH_USER
SSH_PASSWORD
```

Stage 0 itself must not use Linux-host credentials unless required solely for a clearly read-only identification check.

---

## Declared router

The current declared inventory identifies:

```text
Model: TL-R605-v2
Mode:  standalone
```

Treat this as the declared model. Detect and record the actual model, hardware revision and firmware exposed by the router.

Do not assume its CLI is identical to Colibrí's ER707-M2.

---

## Network discovery

`locations/peru-39/inventory.yaml` currently has no authoritative LAN CIDR, gateway or infrastructure entries.

Do not invent them.

Use router evidence to determine, when exposed read-only:

- router LAN address;
- LAN subnet/netmask;
- DHCP pool range;
- DHCP DNS values;
- DHCP client list;
- permanent/bound DHCP clients;
- ARP table;
- router model and firmware.

Record observed values in Stage 0 evidence and summary. Do not silently write them into `inventory.yaml` during Stage 0.

---

## Empty inventory behavior

The infrastructure list is currently empty.

Therefore Stage 0 must not fail merely because there are no declared hosts to compare.

Instead, after collecting DHCP and ARP evidence, create a discovery section in the summary containing infrastructure candidates observed on the LAN.

Prefer candidates that have one or more of these signals:

- permanent DHCP binding;
- stable/private IPv4 address outside the dynamic pool;
- hostname suggesting a server, NAS, Raspberry Pi, Minisforum, HP/EliteDesk or other infrastructure device;
- SSH port reachable;
- MAC/vendor information already available from local/router evidence.

Do not classify ordinary guest/client devices as infrastructure merely because they appear in DHCP.

Do not scan unrelated ports or perform broad network reconnaissance. A targeted TCP/22 reachability check against plausible infrastructure candidates is acceptable.

For each candidate record, when available:

```text
observed hostname
observed IPv4
observed MAC
DHCP binding/permanent status
ARP presence
SSH/22 reachable: yes/no
confidence: HIGH / MEDIUM / LOW
reason
```

This discovery list is evidence for Stage 1, not declared state.

---

## Router capability discovery

Follow `docs/stages/omada-stage-0.md` to determine from observed firmware behavior whether the gateway exposes read-only support for:

- system information;
- DHCP pool inspection;
- DHCP client inspection;
- ARP inspection;
- MAC lookup.

Also determine, without executing them, whether exact CLI syntax can be proven for:

- DHCP reservation creation;
- DHCP reservation removal;
- DHCP DNS configuration;
- reboot.

Never guess write syntax.

If contextual help requires entering a command mode whose command is described as creating or modifying configuration, do not enter it during this site's strict Stage 0. Mark the nested syntax UNKNOWN unless it can be established by non-mutating help/output.

---

## Evidence

Write all evidence under:

```text
locations/peru-39/probe-results/
```

At minimum preserve:

```text
<router>-<timestamp>.txt
<router>-<timestamp>-capabilities.txt
<router>-<timestamp>-summary.md
```

Create a MAC test artifact only if a known/observed candidate MAC can be tested read-only.

The summary must additionally contain:

```markdown
## Observed infrastructure candidates

| Observed name | IPv4 | MAC | DHCP binding | ARP | SSH/22 | Confidence | Reason |
|---|---|---|---|---|---|---|---|
```

---

## Completion

Stage 0 for Perú is complete when:

1. router model/hardware revision/firmware are observed;
2. LAN/DHCP evidence is preserved when exposed by the CLI;
3. read-only Omada capabilities are classified;
4. reservation CREATE/REMOVE syntax is classified independently as SUPPORTED/UNSUPPORTED/UNKNOWN;
5. DNS and reboot syntax are classified without executing write operations;
6. plausible Linux infrastructure candidates are recorded for Stage 1;
7. no router configuration was changed.

Do not proceed to router write operations.
