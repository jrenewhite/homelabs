# Linux Host Stage 1 Follow-up Report

## Scope

- Site: Colibrí 138 (`colibri-138`)
- Audit timestamp: 2026-09-04 16:48–16:50 America/Mexico_City
- Purpose: re-check two newly connected EliteDesk candidates and resolve WTR Pro access/interface identity.

## WTR Pro

- Host identity: confirmed as hostname `nas`, manufacturer `TianBei`, model `WTR PRO`.
- SSH access: `root@192.168.0.11`; `homelabing` was newly installed and verified with key-only access.
- Primary/default-route path: `enp3s0` → `192.168.0.11`, MAC `c8:ff:bf:05:f4:46`.
- Link state: `enp3s0` is UP at 2500 Mb/s full duplex; default route is `via 192.168.0.1 dev enp3s0`.
- MAC ending `:46`: present on both `eno1` (DOWN) and `enp3s0` (UP).
- MAC ending `:47`: not observed anywhere in the host inventory.
- Conclusion: `:46` is the current management MAC. The collected host evidence does not support treating `:46` and `:47` as distinct Ethernet interfaces on this WTR Pro.

## EliteDesk candidates

The fresh router snapshot still maps these candidate ARP entries:

| Candidate IP | Router ARP MAC | TCP/22 from WSL | Host-level identity |
|---|---|---|---|
| 192.168.0.10 | C4-65-16-AC-AB-37 | No route to host | not available |
| 192.168.0.18 | 58-47-CA-7F-7A-72 | No route to host | not available |
| 192.168.0.19 | 92-17-9B-43-95-9A | No route to host | not available |

None of the candidates could be associated with `management-hp-elitedesk-800-g4`: no SSH or other host-level evidence was available. No SSH key was installed on any EliteDesk candidate.

## Proposed inventory.yaml reconciliation

| Host | Field | Declared | Observed | Recommendation | Evidence |
|---|---|---|---|---|---|
| nas-aoostar-wtr-pro | `mac` | C8-FF-BF-05-F4-47 | C8-FF-BF-05-F4-46 on active default-route interface `enp3s0`; `:47` absent | UPDATE_MAC | `nas-aoostar-wtr-pro-20260904-164949.md` |
| management-hp-elitedesk-800-g4 | MAC/IP identity | C4-65-16-AC-AB-37 / 192.168.0.10 | Candidates `.10`, `.18`, `.19` all unreachable on TCP/22 | REVIEW_HOST_IDENTITY | `router-discovery-20260904-164852.txt`; `elitedesk-arp-candidates-20260904-164925.txt` |

## Evidence

- Router discovery: `locations/colibri-138/inventory-results/router-discovery-20260904-164852.txt`
- EliteDesk candidate probe: `locations/colibri-138/inventory-results/elitedesk-arp-candidates-20260904-164925.txt`
- WTR key bootstrap: `locations/colibri-138/inventory-results/nas-aoostar-wtr-pro-20260904-164949-root-bootstrap.txt`
- WTR inventory: `locations/colibri-138/inventory-results/nas-aoostar-wtr-pro-20260904-164949.md`

## Safety confirmation

- The only managed-host mutation was the idempotent addition of `homelabing.pub` to `root`'s authorized keys on the confirmed WTR Pro.
- No router, DHCP, DNS, network, SSH daemon, firewall, service, package, container, or `inventory.yaml` configuration was modified.
- No credentials were written to the evidence.
