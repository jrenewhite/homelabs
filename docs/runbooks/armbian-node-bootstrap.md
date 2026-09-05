# Armbian ARM node bootstrap

Use this runbook for newly imaged Armbian infrastructure nodes. It configures
the local management account and prepares Tailscale without storing passwords,
private keys, or Tailscale auth keys in the repository.

## Preconditions

- The node has completed its first boot and has an address reachable from the
  management machine.
- The initial administrator account is available over SSH.
- The management public key exists at `~/.ssh/homelabing.pub` on the WSL/Linux
  management machine.
- Select the hostname before running the procedure.

Do not put an initial or temporary password in a script, shell history, `.env`,
or a Git commit. Supply it only through standard input when a toolkit command
requests it.

## Base configuration

Connect as the initial administrator and make the requested changes. The
following example is intentionally placeholder-only:

```bash
ssh initial-admin@NODE_IP
```

On the node, as root (or with `sudo`), create the management account and set
the hostname, English locale, Mexico City time zone, and Spanish keyboard:

```bash
id -u jrenewhite >/dev/null 2>&1 || \
  useradd -m -s /bin/bash -G sudo jrenewhite
hostnamectl set-hostname NODE_HOSTNAME
timedatectl set-timezone America/Mexico_City
localectl set-locale LANG=en_US.UTF-8
sed -i 's/^XKBLAYOUT=.*/XKBLAYOUT="es"/' /etc/default/keyboard
```

`XKBLAYOUT="es"` persists the console/X keyboard selection. Some minimal
Armbian images do not include the console keymap files, so applying it to the
current console may require packages not present in the image; do not install
unrequested packages or reboot solely for this setting.

Set the requested temporary password for `jrenewhite` through a protected
interactive prompt, then install the management key from WSL/Linux:

```bash
printf '%s\n' "$BOOTSTRAP_PASSWORD" | \
  scripts/homelab bootstrap --password-stdin \
  --key ~/.ssh/homelabing \
  --target jrenewhite@NODE_IP:22
```

Verify that subsequent access does not ask for a password:

```bash
ssh -i ~/.ssh/homelabing -o BatchMode=yes jrenewhite@NODE_IP hostnamectl --static
```

## Tailscale

Install the stable client using the current official Tailscale method:

```bash
curl -fsSL https://tailscale.com/install.sh | sh
systemctl enable --now tailscaled
tailscale up
```

`tailscale up` displays a temporary authorization URL. Authorize that URL in
the intended tailnet; do not save the URL or an auth key in this repository.
Then verify membership:

```bash
tailscale status
tailscale ip
```

## Perú 39 planned nodes

The following already-prepared nodes are allocated for Perú 39. Their final
LAN addresses and any DHCP reservations must be determined at that site rather
than copied from Colibrí 138.

| Planned hostname | Hardware | MAC address | Status |
| --- | --- | --- | --- |
| `opi-zero-3-infra-a` | Orange Pi Zero 3 | `02-00-72-21-D8-D1` | Base configuration complete; Tailscale awaiting tailnet authorization. |
| `opi-zero-3-infra-b` | Orange Pi Zero 3 | `02-00-48-2E-01-41` | Base configuration complete; Tailscale awaiting tailnet authorization. |
| TBD | Orange Pi 5 | TBD | Awaiting reachable SSH or console access for configuration. |

When the nodes arrive, perform Perú 39 Stage 0 before creating DHCP
reservations or changing router settings. Update `locations/peru-39/inventory.yaml`
only with verified MAC/IP details.
