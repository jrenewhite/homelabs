## Colibrí — Declared Initial Infrastructure Address Baseline

For the `colibri` site, use the following table as the operator-declared initial infrastructure baseline.

This table represents the addresses that are currently expected/reserved for the main homelab nodes.

Do NOT silently modify this table.

During discovery, verify each entry against:

1. router DHCP reservations
2. DHCP client list
3. ARP table
4. observed MAC address
5. host inventory, when reachable

If reality differs from this baseline, report the discrepancy explicitly.

| ID | MAC Address | Reserved IP | Description | Expected status |
|---:|---|---|---|---|
| 2 | `C8-FF-BF-05-F4-47` | `192.168.0.11` | `nas-aoostar-wtr-pro` | Enabled |
| 3 | `58-47-CA-79-08-69` | `192.168.0.12` | `services-minisforum-um890` | Enabled |
| 4 | `58-47-CA-7F-84-B5` | `192.168.0.13` | `ai-gpu-minisforum-790S7` | Enabled |
| 5 | `C0-74-2B-FC-59-86` | `192.168.0.14` | `orangepi5-ultra` | Enabled |
| 6 | `C0-74-2B-FD-71-43` | `192.168.0.15` | `orangepi5-max` | Enabled |
| 7 | `C6-CC-84-3D-E2-67` | `192.168.0.16` | `orangepi5-a` | Enabled |
| 8 | `C6-87-B3-C0-55-95` | `192.168.0.17` | `orangepi5-b` | Enabled |

### Normalized MAC representation

When comparing MAC addresses programmatically, normalize separators and case.

For example:

```text
C4-65-16-AC-AB-37
c4:65:16:ac:ab:37
C46516ACAB37
```

must all be treated as the same MAC address.

### Stage 0 verification output

Add the following table to the Colibrí Stage 0 summary:

| Description | Declared MAC | Declared IP | Router reservation | DHCP observation | ARP observation | Status |
|---|---|---|---|---|---|---|
| nas-aoostar-wtr-pro | `C8-FF-BF-05-F4-47` | `192.168.0.11` | | | | |
| services-minisforum-um890 | `58-47-CA-79-08-69` | `192.168.0.12` | | | | |
| ai-gpu-minisforum-790S7 | `58-47-CA-7F-84-B5` | `192.168.0.13` | | | | |
| orangepi5-ultra | `C0-74-2B-FC-59-86` | `192.168.0.14` | | | | |
| orangepi5-max | `C0-74-2B-FD-71-43` | `192.168.0.15` | | | | |
| orangepi5-a | `C6-CC-84-3D-E2-67` | `192.168.0.16` | | | | |
| orangepi5-b | `C6-87-B3-C0-55-95` | `192.168.0.17` | | | | |

Use these statuses:

- `MATCH` — declared reservation and observed device agree
- `RESERVED_NOT_ACTIVE` — reservation exists but device is not currently observed
- `ACTIVE_DIFFERENT_IP` — MAC is active on another IP
- `MAC_MISMATCH` — declared IP points to another MAC
- `RESERVATION_MISSING` — expected reservation is absent
- `DUPLICATE` — duplicate reservation/IP/MAC relationship detected
- `UNKNOWN` — insufficient evidence

Do not repair any discrepancy during Stage 0.