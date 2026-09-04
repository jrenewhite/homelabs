# Colibrí 138 — Stage 0

This location uses the generic workflow in:

```text
docs/stages/omada-stage-0.md
```

## Location inputs

Local connection settings and credentials:

```text
locations/colibri-138/.env
```

Declared/versioned infrastructure state:

```text
locations/colibri-138/inventory.yaml
```

The `.env` file is intentionally ignored by Git. Do not copy credentials into this Markdown file or into probe artifacts.

## Declared router

The current declared inventory identifies:

```text
Model: ER707-M2
Mode:  standalone
LAN:   192.168.0.0/24
GW:    192.168.0.1
```

Treat those values as declared state until the probe verifies them.

## Declared infrastructure baseline

Do not duplicate or maintain a second device table here.

The source of truth for the declared Colibrí infrastructure list is:

```text
./inventory.yaml
```

Stage 0 must verify every enabled infrastructure entry with a declared MAC address against router observations.

At the time this Stage 0 file was created, `inventory.yaml` contains eight declared infrastructure nodes with reserved addresses from `192.168.0.10` through `192.168.0.17`.

If the router differs from `inventory.yaml`, report the difference. Do not repair it during Stage 0 and do not silently edit `inventory.yaml`.

## Running Stage 0

Run from repository root:

```bash
source locations/colibri-138/.env
```

Then follow:

```text
docs/stages/omada-stage-0.md
```

The generic workflow should use:

```bash
SITE_DIR="locations/colibri-138"
```

and write evidence under:

```text
locations/colibri-138/probe-results/
```

unless `PROBE_RESULTS_DIR` in `.env` explicitly overrides that location.

## Colibrí-specific verification

For every enabled entry in `inventory.yaml`, capture:

| Field | Source |
|---|---|
| Name | `inventory.yaml` |
| Declared MAC | `inventory.yaml` |
| Declared reserved IP | `inventory.yaml` |
| Router reservation | router, if exposed |
| DHCP observation | router DHCP client list |
| ARP observation | router ARP table |
| Result | comparison |

Use the generic Stage 0 statuses:

```text
MATCH
RESERVED_NOT_ACTIVE
ACTIVE_DIFFERENT_IP
MAC_MISMATCH
RESERVATION_MISSING
DUPLICATE
UNKNOWN
```

## Completion

Do not proceed to reservation writes, reservation removals, DNS changes or router reboot until the Stage 0 summary has established the exact capabilities of the installed ER707-M2 firmware.
