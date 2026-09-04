# Homelab Inventory: 192.168.0.227

- **Requested target:** `192.168.0.227:22`
- **SSH user:** `jrenewhite`
- **Collector:** `homelab-inventory.sh 1.0.0`
- **Collected at:** `2026-09-04T16:59:36-06:00`

---

# Host Inventory

- **Audit timestamp:** 2026-09-04T22:59:35+00:00
- **Audit user:** jrenewhite
- **Hostname:** management-plane
- **FQDN:** management-plane

## Management identity


### Primary management interface

```text
primary_interface=eno1
primary_mac=84:a9:3e:12:a6:9b
primary_ipv4=192.168.0.227
```

## Identity and operating system


### hostnamectl

```text
 Static hostname: management-plane
       Icon name: computer-desktop
         Chassis: desktop 🖥️
      Machine ID: d5f516b81fb5428f8dc7a6d730f06add
         Boot ID: 07ca8dc591324de285f170dfaafada40
Operating System: Ubuntu 26.04.1 LTS
          Kernel: Linux 7.0.0-30-generic
    Architecture: x86-64
 Hardware Vendor: HP
  Hardware Model: HP EliteDesk 800 G4 DM 35W
    Hardware SKU: 5LR64US#ABA
Hardware Version: SBKPF
Firmware Version: Q21 Ver. 02.31.00
   Firmware Date: Tue 2025-07-08
    Firmware Age: 1y 1month 4w
```

### Operating system

```text
PRETTY_NAME="Ubuntu 26.04.1 LTS"
NAME="Ubuntu"
VERSION_ID="26.04"
VERSION="26.04.1 LTS (Resolute Raccoon)"
VERSION_CODENAME=resolute
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=resolute
LOGO=ubuntu-logo
```

### Kernel and architecture

```text
Linux management-plane 7.0.0-30-generic #30-Ubuntu SMP PREEMPT_DYNAMIC Fri Jul 31 18:22:54 UTC 2026 x86_64 GNU/Linux
```

### System manufacturer and model

```text
sys_vendor        : HP
product_name      : HP EliteDesk 800 G4 DM 35W
product_version   : SBKPF
board_vendor      : HP
board_name        : 83E2
board_version     : KBC Version 07.D5.00
bios_vendor       : HP
bios_version      : Q21 Ver. 02.31.00
bios_date         : 07/08/2025
```

## Compute


### CPU

```text
Architecture:                            x86_64
CPU op-mode(s):                          32-bit, 64-bit
Address sizes:                           39 bits physical, 48 bits virtual
Byte Order:                              Little Endian
CPU(s):                                  6
On-line CPU(s) list:                     0-5
Vendor ID:                               GenuineIntel
Model name:                              Intel(R) Core(TM) i5-8600T CPU @ 2.30GHz
CPU family:                              6
Model:                                   158
Thread(s) per core:                      1
Core(s) per socket:                      6
Socket(s):                               1
Stepping:                                10
CPU(s) scaling MHz:                      77%
CPU max MHz:                             3700.0000
CPU min MHz:                             800.0000
BogoMIPS:                                4599.93
Flags:                                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb pti ssbd ibrs ibpb stibp tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
Virtualization:                          VT-x
L1d cache:                               192 KiB (6 instances)
L1i cache:                               192 KiB (6 instances)
L2 cache:                                1.5 MiB (6 instances)
L3 cache:                                9 MiB (1 instance)
NUMA node(s):                            1
NUMA node0 CPU(s):                       0-5
Vulnerability Gather data sampling:      Vulnerable
Vulnerability Ghostwrite:                Not affected
Vulnerability Indirect target selection: Not affected
Vulnerability Itlb multihit:             KVM: Mitigation: Split huge pages
Vulnerability L1tf:                      Mitigation; PTE Inversion; VMX conditional cache flushes, SMT disabled
Vulnerability Mds:                       Mitigation; Clear CPU buffers; SMT disabled
Vulnerability Meltdown:                  Mitigation; PTI
Vulnerability Mmio stale data:           Mitigation; Clear CPU buffers; SMT disabled
Vulnerability Old microcode:             Not affected
Vulnerability Reg file data sampling:    Not affected
Vulnerability Retbleed:                  Mitigation; IBRS
Vulnerability Spec rstack overflow:      Not affected
Vulnerability Spec store bypass:         Mitigation; Speculative Store Bypass disabled via prctl
Vulnerability Spectre v1:                Mitigation; usercopy/swapgs barriers and __user pointer sanitization
Vulnerability Spectre v2:                Mitigation; IBRS; IBPB conditional; STIBP disabled; RSB filling; PBRSB-eIBRS Not affected; BHI Not affected
Vulnerability Srbds:                     Mitigation; Microcode
Vulnerability Tsa:                       Not affected
Vulnerability Tsx async abort:           Mitigation; TSX disabled
Vulnerability Vmscape:                   Mitigation; IBPB before exit to userspace
```

### Memory

```text
               total        used        free      shared  buff/cache   available
Mem:            10Gi       548Mi        10Gi       1.6Mi       362Mi        10Gi
Swap:          4.0Gi          0B       4.0Gi

MemTotal:       11489024 kB
MemAvailable:   10927460 kB
SwapTotal:       4194300 kB
SwapFree:        4194300 kB
HugePages_Total:       0
Hugepagesize:       2048 kB
```

### Swap devices

```text
NAME      TYPE SIZE USED PRIO
/swap.img file   4G   0B   -1
```

### PCI devices relevant to GPU, network and storage

```text
00:02.0 VGA compatible controller [0300]: Intel Corporation CoffeeLake-S GT2 [UHD Graphics 630] [8086:3e92]
	DeviceName: Onboard IGD
	Subsystem: Hewlett-Packard Company Device [103c:83e2]
	Kernel driver in use: i915
	Kernel modules: i915
--
00:14.0 USB controller [0c03]: Intel Corporation Cannon Lake PCH USB 3.1 xHCI Host Controller [8086:a36d] (rev 10)
	Subsystem: Hewlett-Packard Company Device [103c:83e2]
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci
00:14.2 RAM memory [0500]: Intel Corporation Cannon Lake PCH Shared SRAM [8086:a36f] (rev 10)
--
00:17.0 SATA controller [0106]: Intel Corporation Cannon Lake PCH SATA AHCI Controller [8086:a352] (rev 10)
	Subsystem: Hewlett-Packard Company Device [103c:83e2]
	Kernel driver in use: ahci
	Kernel modules: ahci
00:1b.0 PCI bridge [0604]: Intel Corporation Cannon Lake PCH PCI Express Root Port #17 [8086:a340] (rev f0)
--
00:1f.6 Ethernet controller [0200]: Intel Corporation Ethernet Connection (7) I219-LM [8086:15bb] (rev 10)
	DeviceName: Onboard Lan
	Subsystem: Hewlett-Packard Company Device [103c:83e2]
	Kernel driver in use: e1000e
	Kernel modules: e1000e
01:00.0 Non-Volatile memory controller [0108]: Sandisk Corp WD PC SN810 / Black SN850 NVMe SSD [15b7:5011] (rev 01)
	Subsystem: Sandisk Corp WD PC SN810 / Black SN850 NVMe SSD [15b7:5011]
	Kernel driver in use: nvme
	Kernel modules: nvme
```

### USB devices

```text
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
```

## Networking


### Interfaces and addresses

```text
lo               UNKNOWN        127.0.0.1/8 ::1/128 
eno1             UP             192.168.0.227/24 metric 100 fe80::86a9:3eff:fe12:a69b/64 
```

### Link-layer details

```text
lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP> 
eno1             UP             84:a9:3e:12:a6:9b <BROADCAST,MULTICAST,UP,LOWER_UP> 
```

### Routing table

```text
default via 192.168.0.1 dev eno1 proto dhcp src 192.168.0.227 metric 100 
1.1.1.1 via 192.168.0.1 dev eno1 proto dhcp src 192.168.0.227 metric 100 
192.168.0.0/24 dev eno1 proto kernel scope link src 192.168.0.227 metric 100 
192.168.0.1 dev eno1 proto dhcp scope link src 192.168.0.227 metric 100 
192.168.0.14 dev eno1 proto dhcp scope link src 192.168.0.227 metric 100 
```

### Neighbour table

```text
192.168.0.36 dev eno1 lladdr 98:25:4a:4f:2b:1c STALE 
192.168.0.206 dev eno1 lladdr 40:1a:58:4a:d3:68 DELAY 
192.168.0.37 dev eno1 lladdr 98:25:4a:4f:2b:f0 STALE 
192.168.0.38 dev eno1 lladdr 98:25:4a:4e:ee:50 STALE 
192.168.0.230 dev eno1 lladdr 6e:b6:c5:a2:41:9d REACHABLE 
192.168.0.1 dev eno1 lladdr cc:ba:bd:d2:21:98 STALE 
192.168.0.14 dev eno1 lladdr c0:74:2b:fc:59:86 STALE 
```

### Interface link speeds

```text
### eno1
	Speed: 1000Mb/s
	Duplex: Full
	Port: Twisted Pair
	Link detected: yes

```

### DNS resolver

```text
Global
         Protocols: -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
  resolv.conf mode: stub

Link 2 (eno1)
    Current Scopes: DNS
         Protocols: +DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
Current DNS Server: 192.168.0.14
       DNS Servers: 192.168.0.14 1.1.1.1
     Default Route: yes
```

## Storage


### Block devices

```text
NAME        PATH           TYPE   SIZE MODEL                         SERIAL       TRAN   ROTA FSTYPE FSVER LABEL UUID                                 MOUNTPOINTS FSAVAIL FSUSE%
nvme0n1     /dev/nvme0n1   disk 238.5G WD PC SN810 SDCPNRY-256G-1006 231304807516 nvme      0                                                                             
├─nvme0n1p1 /dev/nvme0n1p1 part     1G                                            nvme      0 vfat   FAT32       9528-EA1C                            /boot/efi        1G     1%
└─nvme0n1p2 /dev/nvme0n1p2 part 237.4G                                            nvme      0 ext4   1.0         c7390e74-3b25-4b09-9f11-26e00ad5f557 /            212.6G     3%
```

### Filesystem identifiers

```text
```

### Mounted filesystems

```text
TARGET                                        SOURCE         FSTYPE      OPTIONS
/                                             /dev/nvme0n1p2 ext4        rw,relatime
├─/run                                        tmpfs          tmpfs       rw,nosuid,nodev,size=2297808k,nr_inodes=819200,mode=755,inode64
│ ├─/run/credentials/systemd-journald.service none           tmpfs       ro,nosuid,nodev,noexec,relatime,nosymfollow,size=1024k,nr_inodes=1024,mode=700,inode64,noswap
│ ├─/run/credentials/systemd-resolved.service none           tmpfs       ro,nosuid,nodev,noexec,relatime,nosymfollow,size=1024k,nr_inodes=1024,mode=700,inode64,noswap
│ ├─/run/credentials/systemd-networkd.service none           tmpfs       ro,nosuid,nodev,noexec,relatime,nosymfollow,size=1024k,nr_inodes=1024,mode=700,inode64,noswap
│ ├─/run/user/1000                            tmpfs          tmpfs       rw,nosuid,nodev,relatime,size=1148900k,nr_inodes=287225,mode=700,uid=1000,gid=1000,inode64
│ ├─/run/credentials/getty@tty6.service       none           tmpfs       ro,nosuid,nodev,noexec,relatime,nosymfollow,size=1024k,nr_inodes=1024,mode=700,inode64,noswap
│ └─/run/credentials/getty@tty1.service       none           tmpfs       ro,nosuid,nodev,noexec,relatime,nosymfollow,size=1024k,nr_inodes=1024,mode=700,inode64,noswap
├─/tmp                                        tmpfs          tmpfs       rw,nosuid,nodev,nr_inodes=1048576,inode64,usrquota
├─/boot/efi                                   /dev/nvme0n1p1 vfat        rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro
├─/dev                                        devtmpfs       devtmpfs    rw,nosuid,size=4326748k,nr_inodes=1081687,mode=755,inode64
│ ├─/dev/hugepages                            hugetlbfs      hugetlbfs   rw,nosuid,nodev,relatime,pagesize=2M
│ ├─/dev/mqueue                               mqueue         mqueue      rw,nosuid,nodev,noexec,relatime
│ ├─/dev/shm                                  tmpfs          tmpfs       rw,nosuid,nodev,inode64,usrquota
│ └─/dev/pts                                  devpts         devpts      rw,nosuid,noexec,relatime,gid=5,mode=600,ptmxmode=000
├─/sys                                        sysfs          sysfs       rw,nosuid,nodev,noexec,relatime
│ ├─/sys/kernel/tracing                       tracefs        tracefs     rw,nosuid,nodev,noexec,relatime
│ ├─/sys/kernel/debug                         debugfs        debugfs     rw,nosuid,nodev,noexec,relatime
│ ├─/sys/fs/fuse/connections                  fusectl        fusectl     rw,nosuid,nodev,noexec,relatime
│ ├─/sys/kernel/security                      securityfs     securityfs  rw,nosuid,nodev,noexec,relatime
│ ├─/sys/fs/cgroup                            cgroup2        cgroup2     rw,nosuid,nodev,noexec,relatime,nsdelegate,memory_recursiveprot,memory_hugetlb_accounting
│ ├─/sys/fs/pstore                            none           pstore      rw,nosuid,nodev,noexec,relatime
│ ├─/sys/firmware/efi/efivars                 efivarfs       efivarfs    rw,nosuid,nodev,noexec,relatime
│ ├─/sys/fs/bpf                               bpf            bpf         rw,nosuid,nodev,noexec,relatime,mode=700
│ └─/sys/kernel/config                        configfs       configfs    rw,nosuid,nodev,noexec,relatime
└─/proc                                       proc           proc        rw,nosuid,nodev,noexec,relatime
  └─/proc/sys/fs/binfmt_misc                  systemd-1      autofs      rw,relatime,fd=33,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=7167
    └─/proc/sys/fs/binfmt_misc                binfmt_misc    binfmt_misc rw,nosuid,nodev,noexec,relatime
```

### Filesystem usage

```text
Filesystem     Type      Size  Used Avail Use% Mounted on
tmpfs          tmpfs     2.2G  1.4M  2.2G   1% /run
/dev/nvme0n1p2 ext4      233G  8.2G  213G   4% /
tmpfs          tmpfs     5.5G     0  5.5G   0% /dev/shm
efivarfs       efivarfs  150K   89K   57K  62% /sys/firmware/efi/efivars
none           tmpfs     1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
tmpfs          tmpfs     5.5G     0  5.5G   0% /tmp
none           tmpfs     1.0M     0  1.0M   0% /run/credentials/systemd-resolved.service
/dev/nvme0n1p1 vfat      1.1G  6.4M  1.1G   1% /boot/efi
none           tmpfs     1.0M     0  1.0M   0% /run/credentials/systemd-networkd.service
none           tmpfs     1.0M     0  1.0M   0% /run/credentials/getty@tty6.service
none           tmpfs     1.0M     0  1.0M   0% /run/credentials/getty@tty1.service
tmpfs          tmpfs     1.1G  8.0K  1.1G   1% /run/user/1000
```

### Linux MD RAID

```text
Personalities : 
unused devices: <none>
```

### MD RAID details

```text
```

### LVM

```text


```

### Btrfs

```text

```

### Network filesystems

```text
```

### NFS exports

```text
No readable NFS export configuration detected
```

### MergerFS

```text
```

## Containers and virtualization


### LXC containers

```text
Installing LXD snap, please be patient.
If this is your first time running LXD on this machine, you should also run: lxd init
To start your first container, try: lxc launch ubuntu:24.04
Or for a virtual machine: lxc launch ubuntu:24.04 --vm

+------+-------+------+------+------+-----------+
| NAME | STATE | IPV4 | IPV6 | TYPE | SNAPSHOTS |
+------+-------+------+------+------+-----------+
```

## Software and services


### Notable software

```text
mdadm              /usr/sbin/mdadm                     
btrfs              /usr/bin/btrfs                      btrfs-progs v6.17.1 -EXPERIMENTAL -INJECT -STATIC +LZO +ZSTD +UDEV +FSVERITY +ZONED CRYPTO=builtin 
python3            /usr/bin/python3                    Python 3.14.4 
git                /usr/bin/git                        git version 2.53.0 
rsync              /usr/bin/rsync                      rsync  version 3.4.1  protocol version 32 Copyright (C) 1996-2025 by Andrew Tridgell, Wayne Davison, and others. 
```

### Running systemd services

```text
  chrony.service              loaded active running chrony, an NTP client/server
  cron.service                loaded active running Regular background program processing daemon
  dbus.service                loaded active running D-Bus System Message Bus
  getty@tty1.service          loaded active running Getty on tty1
  getty@tty6.service          loaded active running Getty on tty6
  ModemManager.service        loaded active running Modem Manager
  multipathd.service          loaded active running Device-Mapper Multipath Device Controller
  networkd-dispatcher.service loaded active running Dispatcher daemon for systemd-networkd
  polkit.service              loaded active running Authorization Manager
  rsyslog.service             loaded active running System Logging Service
  snap.lxd.daemon.service     loaded active running Service for snap application lxd.daemon
  snapd.service               loaded active running Snap Daemon
  ssh.service                 loaded active running OpenBSD Secure Shell server
  systemd-journald.service    loaded active running Journal Service
  systemd-logind.service      loaded active running User Login Management
  systemd-networkd.service    loaded active running Network Management
  systemd-resolved.service    loaded active running Network Name Resolution
  systemd-udevd.service       loaded active running Rule-based Manager for Device Events and Files
  thermald.service            loaded active running Thermal Daemon Service
  udisks2.service             loaded active running Disk Manager
  unattended-upgrades.service loaded active running Unattended Upgrades Shutdown
  user@1000.service           loaded active running User Manager for UID 1000
```

### Enabled systemd services

```text
apparmor.service                       enabled enabled
apport.service                         enabled enabled
blk-availability.service               enabled enabled
chrony.service                         enabled enabled
cloud-config.service                   enabled enabled
cloud-final.service                    enabled enabled
cloud-init-local.service               enabled enabled
cloud-init-main.service                enabled enabled
cloud-init-network.service             enabled enabled
console-setup.service                  enabled enabled
cron.service                           enabled enabled
dmesg.service                          enabled enabled
e2scrub_reap.service                   enabled enabled
finalrd.service                        enabled enabled
getty@.service                         enabled enabled
gpu-manager.service                    enabled enabled
grub-initrd-fallback.service           enabled enabled
grub2-common.service                   enabled enabled
kdump-tools.service                    enabled enabled
keyboard-setup.service                 enabled enabled
lvm2-monitor.service                   enabled enabled
ModemManager.service                   enabled enabled
multipathd.service                     enabled enabled
netplan-configure.service              enabled enabled
networkd-dispatcher.service            enabled enabled
open-iscsi.service                     enabled enabled
open-vm-tools.service                  enabled enabled
pollinate.service                      enabled enabled
rsyslog.service                        enabled enabled
secureboot-db.service                  enabled enabled
setvtrgb.service                       enabled enabled
snap.lxd.activate.service              enabled enabled
snapd.apparmor.service                 enabled enabled
snapd.autoimport.service               enabled enabled
snapd.core-fixup.service               enabled enabled
snapd.recovery-chooser-trigger.service enabled enabled
snapd.seeded.service                   enabled enabled
snapd.service                          enabled enabled
snapd.system-shutdown.service          enabled enabled
sshd-keygen.service                    enabled enabled
sysstat.service                        enabled enabled
systemd-networkd-wait-online.service   enabled enabled
systemd-networkd.service               enabled enabled
systemd-pstore.service                 enabled enabled
systemd-resolved.service               enabled enabled
thermald.service                       enabled enabled
ua-reboot-cmds.service                 enabled enabled
ubuntu-advantage.service               enabled enabled
udisks2.service                        enabled enabled
ufw.service                            enabled enabled
unattended-upgrades.service            enabled enabled
vgauth.service                         enabled enabled
```

### Systemd timers

```text
NEXT                             LEFT LAST                              PASSED UNIT                           ACTIVATES
Fri 2026-09-04 23:10:00 UTC      8min Fri 2026-09-04 23:00:06 UTC 1min 21s ago sysstat-collect.timer          sysstat-collect.service
Fri 2026-09-04 23:10:13 UTC      8min -                                      - systemd-tmpfiles-clean.timer   systemd-tmpfiles-clean.service
Fri 2026-09-04 23:26:27 UTC     24min Thu 2026-09-03 07:00:50 UTC            - fwupd-refresh.timer            fwupd-refresh.service
Fri 2026-09-04 23:53:50 UTC     52min Thu 2026-09-03 07:00:50 UTC            - apt-daily-upgrade.timer        apt-daily-upgrade.service
Sat 2026-09-05 00:00:00 UTC     58min Fri 2026-09-04 22:55:22 UTC     6min ago dpkg-db-backup.timer           dpkg-db-backup.service
Sat 2026-09-05 00:00:00 UTC     58min -                                      - sysstat-rotate.timer           sysstat-rotate.service
Sat 2026-09-05 00:07:00 UTC   1h 5min -                                      - sysstat-summary.timer          sysstat-summary.service
Sat 2026-09-05 00:48:26 UTC  1h 46min Fri 2026-09-04 23:01:14 UTC      13s ago logrotate.timer                logrotate.service
Sat 2026-09-05 02:22:33 UTC  3h 21min Thu 2026-09-03 07:00:50 UTC            - motd-news.timer                motd-news.service
Sat 2026-09-05 04:36:28 UTC  5h 35min Thu 2026-09-03 07:00:50 UTC            - man-db.timer                   man-db.service
Sat 2026-09-05 05:23:35 UTC        6h Thu 2026-09-03 07:00:50 UTC            - apt-daily.timer                apt-daily.service
Sat 2026-09-05 23:00:18 UTC       23h Fri 2026-09-04 23:00:18 UTC  1min 9s ago update-notifier-download.timer update-notifier-download.service
Sun 2026-09-06 03:10:49 UTC  1 day 4h Thu 2026-09-03 07:00:50 UTC            - xfs_scrub_all.timer            xfs_scrub_all.service
Sun 2026-09-06 03:10:55 UTC  1 day 4h Thu 2026-09-03 07:00:50 UTC            - e2scrub_all.timer              e2scrub_all.service
Sun 2026-09-06 17:12:00 UTC 1 day 18h Thu 2026-09-03 07:00:50 UTC            - update-notifier-motd.timer     update-notifier-motd.service
Mon 2026-09-07 00:51:27 UTC    2 days Thu 2026-09-03 07:00:50 UTC            - fstrim.timer                   fstrim.service
-                                   - -                                      - apport-autoreport.timer        apport-autoreport.service
-                                   - -                                      - snapd.snap-repair.timer        snapd.snap-repair.service
-                                   - -                                      - ua-timer.timer                 ua-timer.service

19 timers listed.
```

### Failed systemd units

```text
  UNIT LOAD ACTIVE SUB DESCRIPTION

0 loaded units listed.
```

### Listening TCP/UDP ports

```text
Netid State  Recv-Q Send-Q      Local Address:Port Peer Address:PortProcess
udp   UNCONN 0      0              127.0.0.54:53        0.0.0.0:*          
udp   UNCONN 0      0           127.0.0.53%lo:53        0.0.0.0:*          
udp   UNCONN 0      0      192.168.0.227%eno1:68        0.0.0.0:*          
udp   UNCONN 0      0               127.0.0.1:323       0.0.0.0:*          
udp   UNCONN 0      0                   [::1]:323          [::]:*          
tcp   LISTEN 0      4096           127.0.0.54:53        0.0.0.0:*          
tcp   LISTEN 0      4096              0.0.0.0:22        0.0.0.0:*          
tcp   LISTEN 0      4096        127.0.0.53%lo:53        0.0.0.0:*          
tcp   LISTEN 0      4096                 [::]:22           [::]:*          
```

## Packages


### Package-manager summary

```text
Package manager: dpkg
Installed packages: 727
```

_Full package list omitted. Run with `--full-packages` to include it._

## Scheduled jobs and boot configuration


### User crontab

```text
No readable user crontab
```

### System cron directories

```text
### /etc/crontab
# /etc/crontab: system-wide crontab
# Unlike any other crontab you don't have to run the `crontab'
# command to install the new version when you edit this file
# and files in /etc/cron.d. These files also have username fields,
# that none of the other crontabs do.

SHELL=/bin/sh
# You can also override PATH, but by default, newer versions inherit it from the environment
#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
17 *	* * *	root	cd / && run-parts --report /etc/cron.hourly
25 6	* * *	root	test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.daily; }
47 6	* * 7	root	test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.weekly; }
52 6	1 * *	root	test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.monthly; }
#

### /etc/cron.d
total 16
drwxr-xr-x   2 root root 4096 Apr 20 18:22 .
drwxr-xr-x 110 root root 4096 Sep  4 23:01 ..
-rw-r--r--   1 root root  102 Nov  5  2025 .placeholder
-rw-r--r--   1 root root  188 Feb 13  2026 e2scrub_all

### /etc/cron.daily
total 32
drwxr-xr-x   2 root root 4096 Sep  3 07:04 .
drwxr-xr-x 110 root root 4096 Sep  4 23:01 ..
-rw-r--r--   1 root root  102 Nov  5  2025 .placeholder
-rwxr-xr-x   1 root root  376 Apr 13 11:51 apport
-rwxr-xr-x   1 root root 1478 Apr  7 09:02 apt-compat
-rwxr-xr-x   1 root root  123 Dec 16  2025 dpkg
-rwxr-xr-x   1 root root  377 Dec  6  2025 logrotate
-rwxr-xr-x   1 root root 1395 May  2  2025 man-db

### /etc/cron.hourly
total 12
drwxr-xr-x   2 root root 4096 Apr 20 18:22 .
drwxr-xr-x 110 root root 4096 Sep  4 23:01 ..
-rw-r--r--   1 root root  102 Nov  5  2025 .placeholder

### /etc/cron.weekly
total 16
drwxr-xr-x   2 root root 4096 Apr 20 18:22 .
drwxr-xr-x 110 root root 4096 Sep  4 23:01 ..
-rw-r--r--   1 root root  102 Nov  5  2025 .placeholder
-rwxr-xr-x   1 root root 1055 May  2  2025 man-db

### /etc/cron.monthly
total 12
drwxr-xr-x   2 root root 4096 Apr 20 18:22 .
drwxr-xr-x 110 root root 4096 Sep  4 23:01 ..
-rw-r--r--   1 root root  102 Nov  5  2025 .placeholder

```

## Security-safe SSH summary


### SSH daemon presence and listening state

```text
OpenSSH_10.2p1 Ubuntu-2ubuntu3.5, OpenSSL 3.5.5 27 Jan 2026
LISTEN 0      4096         0.0.0.0:22        0.0.0.0:*   
LISTEN 0      4096            [::]:22           [::]:*   
```

## Inventory notes

- No environment variables, passwords, tokens, private keys, or container secrets were intentionally collected.
- Commands that were unavailable or denied were skipped.
- The audit is read-only by design.
