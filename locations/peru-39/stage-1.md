# Perú 39 — Stage 1 Access Bootstrap and Detailed Inventory

## Purpose

Execute the generic Linux-host Stage 1 procedure for Perú 39.

Primary goals:

1. identify the Linux infrastructure currently present on the Perú LAN;
2. leave reusable `~/.ssh/homelabing` key access ready on every positively identified and reachable Linux host;
3. collect a detailed Markdown inventory from every accessible host;
4. establish current IP/MAC/interface identity from each host itself;
5. produce evidence-backed proposed entries for `locations/peru-39/inventory.yaml` without silently rewriting it.

Follow:

```text
docs/stages/linux-host-stage-1.md
```

This file adds Perú-specific discovery behavior because the current declared infrastructure list is empty.

---

## Site files

Use:

```text
locations/peru-39/.env
locations/peru-39/inventory.yaml
locations/peru-39/probe-results/
locations/peru-39/inventory-results/
```

From repository root:

```bash
source locations/peru-39/.env
```

The `.env` should provide:

```text
SSH_USER
SSH_PASSWORD
ROUTER_USER
ROUTER_PASSWORD
```

and the router host/port values used by Stage 0.

Never print, log, commit or persist password values.

---

## Required prior evidence

Read the latest successful Perú Stage 0 evidence under:

```text
locations/peru-39/probe-results/
```

Use the latest router DHCP/ARP observations as the initial candidate list.

If Stage 0 has not been completed successfully for Perú, complete `locations/peru-39/stage-0.md` first.

Do not reuse Colibrí addresses, MACs, firmware assumptions or reservation syntax.

---

## Declared inventory status

At the start of this stage:

```text
locations/peru-39/inventory.yaml
```

may contain an empty `infrastructure` list.

That is valid.

Stage 1 must discover and identify hosts before proposing declared-state entries.

Do not silently add devices to `inventory.yaml` during this stage.

---

## Operator-known hardware hints

The following are discovery hints from the homelab plan, not authoritative network identities:

- an HP EliteDesk used as an infrastructure/management node;
- the Perú NAS, based on an Intel 8th-generation i5 platform and expected to include an Intel Arc A310;
- one Minisforum 790S7 with 64 GB RAM;
- two Raspberry Pi 4B 8 GB systems, each associated with a 1 TB SATA SSD over USB;
- two Raspberry Pi 5B 8 GB systems, each associated with a 480 GB SATA SSD.

These hints may be stale or incomplete.

Do not assign an observed IP/MAC to one of these systems solely because the hardware appears plausible. Confirm identity using host-level evidence after SSH access.

Do not assume all expected devices are currently powered on or connected.

---

# Stage 1A — Discovery and SSH access bootstrap

## 1A.1 Prepare management key

From repository root verify:

```bash
scripts/homelab keygen
```

This must preserve an existing `~/.ssh/homelabing` key unless an explicit replacement was requested by the operator.

Use:

```text
~/.ssh/homelabing
~/.ssh/homelabing.pub
```

as the management identity for Linux hosts.

Do not copy the private key anywhere.

---

## 1A.2 Build a candidate host list

Start from the latest Perú Stage 0 DHCP/ARP evidence.

Prioritize candidates with:

- SSH/22 reachable;
- permanent DHCP binding;
- hostname suggesting Linux/server/NAS/Raspberry Pi/Minisforum/HP;
- an address that remains stable across DHCP and ARP observations.

A targeted TCP/22 check against plausible candidates is allowed.

Do not perform broad port scans.

Do not attempt SSH against obviously unrelated guest/client devices.

Create:

```text
locations/peru-39/inventory-results/discovery-<timestamp>.md
```

with a candidate table:

```markdown
| Candidate | IPv4 | Router-observed MAC | SSH/22 | Initial confidence | Reason |
|---|---|---|---|---|---|
```

---

## 1A.3 Identify before declaring

For each candidate with SSH available, try key authentication first using `~/.ssh/homelabing`.

If key authentication succeeds, collect a minimal identity probe before any other action:

```text
hostname
hostnamectl when available
/etc/os-release
primary/default-route interface
all interface names and MAC addresses
current IPv4 addresses
DMI vendor/model when available
CPU model
RAM total
block-device model/size summary
PCI GPU/network/storage identifiers when available
```

Use this evidence to determine whether the candidate corresponds to one of the expected Perú infrastructure systems.

If identity is uncertain, classify the candidate `UNRESOLVED` and do not install a key merely to force classification unless the operator-provided SSH account clearly belongs to that managed host.

---

## 1A.4 Bootstrap `homelabing`

For a positively identified managed Linux host:

1. try `~/.ssh/homelabing` first;
2. if not authorized, use `SSH_USER` and `SSH_PASSWORD` from `.env` through stdin;
3. install `homelabing.pub` idempotently with the repository bootstrap helper;
4. verify subsequent key-only login;
5. do not modify `sshd_config` or authentication policy.

Preferred pattern:

```bash
printf '%s\n' "$SSH_PASSWORD" |
  scripts/homelab bootstrap \
    --password-stdin \
    --target "$SSH_USER@$HOST"
```

If the host uses a non-default SSH port discovered from operator/site configuration, specify it explicitly.

The only intended remote mutation in Stage 1 is adding the existing public key to the target user's `~/.ssh/authorized_keys`.

---

## 1A.5 Record access status

For each identified infrastructure host record:

```text
observed hostname
current IPv4
primary MAC
all physical NIC MACs when available
SSH key status: PREEXISTING / INSTALLED / FAILED
identity confidence: HIGH / MEDIUM / LOW
identity evidence
```

Do not treat the router's observed MAC as the only source of host identity. Multi-NIC systems may expose multiple valid MAC addresses.

---

# Stage 1B — Detailed inventory

## 1B.1 Collect one detailed inventory per host

Once key-only access is verified, use the repository collector:

```bash
scripts/homelab inventory \
  --host "$HOST" \
  --user "$SSH_USER" \
  --identity "$HOME/.ssh/homelabing" \
  --output "$OUTPUT"
```

Write results under:

```text
locations/peru-39/inventory-results/
```

Use a stable descriptive filename when the host is positively identified, for example:

```text
<role-or-hostname>-<timestamp>.md
```

If the host is still unresolved, use an evidence filename based on observed hostname/IP without assigning an invented role.

---

## 1B.2 Required identity/network evidence

For every inventoried host ensure the resulting evidence contains, when available:

- hostname/FQDN;
- OS and kernel;
- hardware vendor/model;
- CPU;
- RAM total;
- all network interfaces;
- all physical NIC MAC addresses;
- primary/default-route interface;
- current management IPv4;
- link speed;
- routes and resolver state.

The primary management MAC/IP must be derived from the host's current default-route/interface state, not merely copied from DHCP.

---

## 1B.3 Required storage evidence

Collect, when available:

- disks and transports;
- model/serial/capacity;
- partitions;
- filesystems/UUIDs;
- mount points;
- mdadm RAID;
- LVM;
- Btrfs;
- ZFS;
- network mounts;
- NFS exports;
- mergerfs;
- SMART summary only when readable with existing passwordless sudo.

Do not repartition, mount/unmount, repair, scrub or modify storage.

Pay special attention to identifying the storage topology of:

- the Perú NAS;
- both RPi4B systems and their expected 1 TB USB/SATA SSDs;
- both RPi5B systems and their expected 480 GB SSDs.

Treat capacities as identification hints, not mandatory truth.

---

## 1B.4 Required compute/PCI evidence

Collect, when available:

- CPU model/core/thread information;
- memory total;
- PCI devices relevant to GPU/network/storage;
- USB devices;
- NVIDIA/AMD GPU tooling if already installed.

For the Perú NAS specifically, look for host-level evidence of an Intel Arc A310 or other actual GPU present. Do not assume it exists if the host evidence disagrees.

For the Minisforum candidate, confirm model/CPU/RAM from the host itself before assigning the `790S7` identity.

---

## 1B.5 Services and workloads

Collect existing read-only state for:

- Docker/Compose or Podman;
- containers/images/networks/volumes;
- systemd running/enabled services;
- systemd timers;
- listening ports;
- Tailscale when installed;
- NFS/mergerfs/storage services;
- Jellyfin/ffmpeg and other notable software when present.

Do not start, stop, enable, disable or restart services or containers.

---

## 1B.6 Produce proposed inventory reconciliation

After all reachable hosts have been inventoried, create:

```text
locations/peru-39/inventory-results/stage-1-summary-<timestamp>.md
```

Include:

```markdown
# Perú 39 Stage 1 Summary

## Access bootstrap

| Host identity | Current IP | Primary MAC | Key status | Evidence |
|---|---|---|---|---|

## Identified infrastructure

| Proposed name | Observed hostname | Hardware identity | Current IP | Primary MAC | Confidence |
|---|---|---|---|---|---|

## Expected-hardware reconciliation

| Expected hint | Result | Observed host | Evidence |
|---|---|---|---|

## Unresolved candidates

| Observed hostname/IP | MAC | SSH status | Reason unresolved |
|---|---|---|---|

## Proposed `inventory.yaml` entries

Provide YAML snippets supported by the collected evidence, but DO NOT apply them automatically.

## Missing/offline expected systems

List expected hardware hints that could not be positively identified.

## Evidence files

List every generated inventory/discovery file.
```

Suggested canonical names may be proposed only after positive identification. Keep names role-oriented and stable rather than deriving them solely from transient IP addresses.

---

## Safety constraints

During Perú Stage 1 do not:

- change router configuration;
- create/remove DHCP reservations;
- change DNS;
- change host IP/network configuration;
- edit `sshd_config`;
- change firewall rules;
- install/remove packages;
- update the OS;
- alter storage/filesystems/RAID;
- start/stop/restart services or containers;
- modify `inventory.yaml` automatically.

The only intended remote state change is idempotently adding `homelabing.pub` to the managed user's `authorized_keys` where necessary.

---

## Completion

Stage 1 for Perú is complete when:

1. plausible infrastructure candidates from Stage 0 have been evaluated;
2. every positively identified reachable Linux infrastructure host has key-only `homelabing` access verified or a documented failure;
3. a detailed Markdown inventory exists for each accessible identified host;
4. current primary IP/MAC and all important NIC identities are recorded;
5. expected Perú hardware hints are reconciled as identified, missing/offline or unresolved;
6. proposed versioned `inventory.yaml` entries are included in the summary but not applied;
7. no credentials/private keys are present in committed artifacts.

Do not proceed to router reservation/DNS changes or later service migration stages.
