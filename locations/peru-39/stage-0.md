# Perú 39 — Stage 0

This location uses the generic workflow in:

```text
docs/stages/omada-stage-0.md
```

## Location inputs

Local connection settings and credentials:

```text
locations/peru-39/.env
```

Declared/versioned infrastructure state:

```text
locations/peru-39/inventory.yaml
```

The `.env` file is intentionally ignored by Git. Do not copy credentials into this Markdown file or into probe artifacts.

## Declared router

The current declared inventory identifies:

```text
Model: TL-R605-v2
Mode:  standalone
```

Network values are not yet fully declared in `inventory.yaml` and must not be invented.

## Declared infrastructure baseline

`inventory.yaml` is the only declared-state source for infrastructure entries at this site.

The infrastructure list is currently empty. Populate it only from operator-provided or separately verified information; Stage 0 itself must not invent devices.

## Running Stage 0

Once `.env` contains the required router connection variables, run from repository root:

```bash
source locations/peru-39/.env
```

Then follow:

```text
docs/stages/omada-stage-0.md
```

Use:

```bash
SITE_DIR="locations/peru-39"
```

and write evidence under:

```text
locations/peru-39/probe-results/
```

unless `PROBE_RESULTS_DIR` in `.env` explicitly overrides it.

## Perú-specific goal

The installed TL-R605 v2 firmware must be probed independently from Colibrí's ER707-M2. Do not assume both gateways expose identical CLI syntax for reservation creation/removal, DNS, DHCP inspection or reboot.

## Completion

Do not proceed to router write operations until this site's own Stage 0 evidence establishes the firmware-specific capabilities.
