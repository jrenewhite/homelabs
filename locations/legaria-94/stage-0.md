# Legaria 94 — Stage 0

This location uses the generic Omada workflow only if/when its router is declared as a compatible Omada standalone gateway.

Generic workflow:

```text
docs/stages/omada-stage-0.md
```

## Location inputs

Local connection settings and credentials:

```text
locations/legaria-94/.env
```

Declared/versioned infrastructure state:

```text
locations/legaria-94/inventory.yaml
```

The `.env` file is intentionally ignored by Git. Do not copy credentials into this Markdown file or into probe artifacts.

## Current declared state

The current `inventory.yaml` does not yet declare:

- LAN CIDR
- gateway
- router model
- router mode
- infrastructure nodes

Do not invent those values.

## Omada Stage 0 applicability

Before running the generic Omada Stage 0, first update `inventory.yaml` from operator-provided or separately verified information.

The Omada-specific Stage 0 is applicable only when the site's declared router is an Omada gateway running a supported standalone SSH CLI.

If the site uses another router/platform, create a platform-specific discovery stage instead of forcing the Omada workflow.

## Future execution

When applicable, run from repository root:

```bash
source locations/legaria-94/.env
```

Then follow:

```text
docs/stages/omada-stage-0.md
```

Use:

```bash
SITE_DIR="locations/legaria-94"
```

and store evidence under:

```text
locations/legaria-94/probe-results/
```

unless `.env` explicitly overrides the results path.
