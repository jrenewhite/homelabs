# Perú 39 — Current Infrastructure State

Last verified: 2026-09-05, America/Mexico_City.

This is an operational snapshot following the physical rearrangement. The
`observed_ip` values in `inventory.yaml` are current DHCP observations, not a
request to create reservations. Only the EliteDesk has a router-reported
permanent DHCP binding.

## LAN and router

- LAN: `192.168.0.0/24`
- Gateway: `192.168.0.1`
- Router: Omada ER605 v2.20, standalone

## Reachable infrastructure

| Host | LAN IP | Primary MAC | SSH access | Tailscale state |
|---|---:|---|---|---|
| `management-hp-elitedesk-800-g4` | `192.168.0.10` | `84:A9:3E:12:A6:9B` | password access verified | active, `100.69.125.83` |
| `peru-nas` | `192.168.0.11` | `0C:EF:15:96:0A:07` | alternative SSH account verified | active, `100.81.168.75` |
| `opi-zero-3-infra-a` | `192.168.0.119` | `02:00:72:21:D8:D1` | management key verified | active, `100.101.30.67` |
| `opi-zero-3-infra-b` | `192.168.0.118` | `02:00:48:2E:01:41` | management key verified | active, `100.71.236.124` |
| `orangepi5-b` | `192.168.0.120` | `C6:87:B3:C0:55:95` | management key verified | active, `100.103.15.69` |
| `orangepi5-max` | `192.168.0.126` | `C0:74:2B:FD:71:43` | management key verified | active, `100.93.82.30` |

## Notes

- The two Raspberry Pi 4 systems and the prior Perú Raspberry Pi 5 were
  removed from this LAN before this snapshot.
- The Orange Pi nodes currently use dynamic DHCP leases. Do not treat their
  observed addresses as DHCP reservations.
- Tailscale was installed and authorized on the EliteDesk and both Orange Pi
  Zero 3 nodes. The Orange Pi 5 and Orange Pi 5 Max were already active in
  the tailnet.
- No router DHCP, DNS, firewall, or network configuration was changed while
  recording this snapshot.
