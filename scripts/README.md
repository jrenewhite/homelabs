# Homelab Bash Toolkit

Reusable management toolkit intended to run from Linux or WSL.

No Python runtime is required.

## Dependencies

On Ubuntu/Debian/WSL:

```bash
sudo apt update
sudo apt install openssh-client sshpass expect
```

Check them:

```bash
./check-deps.sh
```

## Unified command

Most operations can be called through:

```bash
./homelab ...
```

### Generate this management machine's key

```bash
./homelab keygen
```

Creates:

```text
~/.ssh/homelabing
~/.ssh/homelabing.pub
```

Existing keys are preserved unless `homelab-keygen.sh --force` is explicitly
used.

### Add the key to one SSH account

Interactive hidden password:

```bash
./homelab authorize \
  --host 192.168.0.20 \
  --user jrenewhite
```

Password from stdin:

```bash
printf '%s\n' 'PASSWORD' | \
  ./homelab authorize \
    --host 192.168.0.20 \
    --user jrenewhite \
    --password-stdin
```

The public key is appended idempotently to the remote account's
`~/.ssh/authorized_keys`; existing keys are preserved.

### Bootstrap several machines

```bash
./homelab bootstrap \
  --target jrenewhite@192.168.0.20 \
  --target jrenewhite@192.168.0.30 \
  --target jrenewhite@192.168.0.40
```

Behavior:

1. ensure `~/.ssh/homelabing` exists;
2. try the key first;
3. if necessary, ask for a password;
4. install and verify the public key;
5. reuse that successful password for subsequent targets;
6. if the password is rejected on a later target, ask for another one;
7. allow at most 3 password attempts for that target.

For Codex/automation, retry passwords can be supplied as separate lines:

```bash
printf '%s\n' \
  'password-1' \
  'password-2-if-needed' \
  'password-3-if-needed' |
./homelab bootstrap \
  --password-stdin \
  --target user@192.168.0.20 \
  --target user@192.168.0.30
```

### Inventory

```bash
./homelab inventory \
  --host 192.168.0.20 \
  --user jrenewhite \
  --output nas.md
```

When present, `~/.ssh/homelabing` is automatically preferred.

The inventory includes a `Management identity` section with the host's primary:

- interface
- MAC
- IPv4

That MAC can then be fed into the Omada helpers.

## Omada standalone gateways

The helpers target the interactive standalone SSH CLI used by TP-Link Omada
gateways such as ER707-M2 and ER605/TL-R605 v2.

They use `expect` because this CLI is an interactive terminal rather than a
normal Unix shell.

Passwords are never accepted as a command-line argument. They are entered
silently or consumed one line at a time with `--password-stdin`.

Authentication gets up to 3 attempts.

### Probe router / firmware

Run this once for each router/firmware:

```bash
./homelab omada probe \
  --host 192.168.0.1 \
  --user admin
```

It collects:

- system-info
- CLI help
- DHCP pools
- DHCP clients
- ARP table

### Find a device by MAC

```bash
./homelab omada find-mac \
  --host 192.168.0.1 \
  --user admin \
  --mac c4:65:16:ac:ab:37
```

### DNS

Example: Pi-hole + Cloudflare fallback.

```bash
./homelab omada dns \
  --host 192.168.0.1 \
  --user admin \
  --pool LAN \
  --primary 192.168.0.51 \
  --secondary 1.1.1.1
```

If `--secondary` is omitted, `1.1.1.1` is used automatically (or `8.8.8.8`
when primary already is `1.1.1.1`).

The final pair must contain at least one of:

- `1.1.1.1`, `1.0.0.1` — Cloudflare
- `8.8.8.8`, `8.8.4.4` — Google
- `9.9.9.9`, `149.112.112.112` — Quad9

The script writes DNS1 and then DNS2 and never deliberately clears all DNS
entries first.

### Reboot

```bash
./homelab omada reboot \
  --host 192.168.0.1 \
  --user admin
```

Requires typing `REBOOT`.

For explicit non-interactive use:

```bash
./homelab omada reboot \
  --host 192.168.0.1 \
  --user admin \
  --yes
```

### DHCP Address Reservation

```bash
./homelab omada reserve-ip \
  --host 192.168.0.1 \
  --user admin \
  --mac c4:65:16:ac:ab:37 \
  --ip 192.168.0.10
```

This command currently performs a safe probe only.

TP-Link documents Address Reservation in Standalone mode, but the published
standalone CLI guide documents DHCP querying/configuration without documenting
a command that creates an Address Reservation entry.

Therefore the helper:

- validates the requested MAC and IP;
- reads DHCP clients and ARP;
- reads DHCP pool state;
- requests firmware CLI help;
- deliberately does not guess an undocumented write command.

If the firmware-specific help reveals a reservation/binding command, preserve
the output and a safe writer can be added for that exact firmware.
