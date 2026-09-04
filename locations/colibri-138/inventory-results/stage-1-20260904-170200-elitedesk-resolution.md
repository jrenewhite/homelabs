# Stage 1 EliteDesk Resolution

## Confirmed declared management host

`management-hp-elitedesk-800-g4` is positively identified at `192.168.0.10`.

| Field | Declared | Observed |
|---|---|---|
| Hostname | management-hp-elitedesk-800-g4 | management-plane |
| Manufacturer | not declared | HP |
| Model | HP EliteDesk 800 G4 | HP EliteDesk 800 G4 DM 35W (TAA) |
| Primary interface | not declared | eno1 |
| Primary MAC | C4-65-16-AC-AB-37 | c4:65:16:ac:ab:37 |
| Primary IPv4 | 192.168.0.10 | 192.168.0.10 |
| SSH key state | not declared | ACCESS_BOOTSTRAPPED; key-only access verified |

The declared identity, MAC and reserved IP all match the confirmed host. Recommendation: `NO_CHANGE`.

## Other connected EliteDesk

`192.168.0.227` is also an HP EliteDesk 800 G4 and has hostname `management-plane`, but its current management identity differs:

| Field | Observed |
|---|---|
| Model | HP EliteDesk 800 G4 DM 35W |
| CPU | Intel Core i5-8600T |
| Primary interface | eno1 |
| Primary MAC | 84:a9:3e:12:a6:9b |
| Primary IPv4 | 192.168.0.227 |
| SSH key state | not installed; intentionally left unchanged |

It is not associated with the declared `management-hp-elitedesk-800-g4` entry because the declared MAC/IP identify `.10`. No `authorized_keys` mutation was made on `.227`.

## Evidence

- Read-only candidate inventory, `.10`: `locations/colibri-138/inventory-results/elitedesk-candidate-10-20260904-165813.md`
- Read-only candidate inventory, `.227`: `locations/colibri-138/inventory-results/elitedesk-candidate-227-20260904-165813.md`
- Key bootstrap, confirmed management host: `locations/colibri-138/inventory-results/management-hp-elitedesk-800-g4-20260904-170200-bootstrap.txt`
- Key-only final inventory, confirmed management host: `locations/colibri-138/inventory-results/management-hp-elitedesk-800-g4-20260904-170200.md`

## Safety confirmation

- `homelabing.pub` was idempotently added only to the confirmed management host at `.10`.
- No router, DHCP, DNS, network, SSH daemon, firewall, package, service, container, or `inventory.yaml` configuration was changed.
- No credentials or private keys were written to evidence.
