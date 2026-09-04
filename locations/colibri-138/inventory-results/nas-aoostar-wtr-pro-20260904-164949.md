# Homelab Inventory: 192.168.0.11

- **Requested target:** `192.168.0.11:22`
- **SSH user:** `root`
- **Collector:** `homelab-inventory.sh 1.0.0`
- **Collected at:** `2026-09-04T16:49:50-06:00`

---

# Host Inventory

- **Audit timestamp:** 2026-09-04T16:49:49-06:00
- **Audit user:** root
- **Hostname:** nas
- **FQDN:** nas.colibri

## Management identity


### Primary management interface

```text
primary_interface=enp3s0
primary_mac=c8:ff:bf:05:f4:46
primary_ipv4=192.168.0.11
```

## Identity and operating system


### hostnamectl

```text
 Static hostname: nas
       Icon name: computer-desktop
         Chassis: desktop 🖥️
      Machine ID: 18549f0f97424f49ad06731e8148754d
         Boot ID: defa33bb42224d0ba0052a751d4814e1
    Product UUID: 03000200-0400-0500-0006-000700080009
Operating System: Debian GNU/Linux 13 (trixie)
          Kernel: Linux 6.12.95+deb13-amd64
    Architecture: x86-64
 Hardware Vendor: TianBei
  Hardware Model: WTR PRO
 Hardware Serial: Default string
Firmware Version: 0.33
   Firmware Date: Thu 2025-02-06
    Firmware Age: 1y 6month 4w
```

### Operating system

```text
PRETTY_NAME="Debian GNU/Linux 13 (trixie)"
NAME="Debian GNU/Linux"
VERSION_ID="13"
VERSION="13 (trixie)"
VERSION_CODENAME=trixie
DEBIAN_VERSION_FULL=13.3
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
```

### Kernel and architecture

```text
Linux nas 6.12.95+deb13-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.12.95-1 (2026-07-04) x86_64 GNU/Linux
```

### System manufacturer and model

```text
sys_vendor        : TianBei
product_name      : WTR PRO
product_version   : Default string
board_vendor      : TianBei
board_name        : WTR PRO
board_version     : Default string
bios_vendor       : American Megatrends International, LLC.
bios_version      : 0.33
bios_date         : 02/06/2025
```

## Compute


### CPU

```text
Architecture:                            x86_64
CPU op-mode(s):                          32-bit, 64-bit
Address sizes:                           48 bits physical, 48 bits virtual
Byte Order:                              Little Endian
CPU(s):                                  16
On-line CPU(s) list:                     0-15
Vendor ID:                               AuthenticAMD
Model name:                              AMD Ryzen 7 5825U with Radeon Graphics
CPU family:                              25
Model:                                   80
Thread(s) per core:                      2
Core(s) per socket:                      8
Socket(s):                               1
Stepping:                                0
Frequency boost:                         enabled
CPU(s) scaling MHz:                      48%
CPU max MHz:                             4546.0000
CPU min MHz:                             400.0000
BogoMIPS:                                3992.84
Flags:                                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb cat_l3 cdp_l3 hw_pstate ssbd mba ibrs ibpb stibp vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid cqm rdt_a rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local user_shstk clzero irperf xsaveerptr rdpru wbnoinvd cppc arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif v_spec_ctrl umip pku ospke vaes vpclmulqdq rdpid overflow_recov succor smca fsrm debug_swap
Virtualization:                          AMD-V
L1d cache:                               256 KiB (8 instances)
L1i cache:                               256 KiB (8 instances)
L2 cache:                                4 MiB (8 instances)
L3 cache:                                16 MiB (1 instance)
NUMA node(s):                            1
NUMA node0 CPU(s):                       0-15
Vulnerability Gather data sampling:      Not affected
Vulnerability Indirect target selection: Not affected
Vulnerability Itlb multihit:             Not affected
Vulnerability L1tf:                      Not affected
Vulnerability Mds:                       Not affected
Vulnerability Meltdown:                  Not affected
Vulnerability Mmio stale data:           Not affected
Vulnerability Reg file data sampling:    Not affected
Vulnerability Retbleed:                  Not affected
Vulnerability Spec rstack overflow:      Mitigation; Safe RET
Vulnerability Spec store bypass:         Mitigation; Speculative Store Bypass disabled via prctl
Vulnerability Spectre v1:                Mitigation; usercopy/swapgs barriers and __user pointer sanitization
Vulnerability Spectre v2:                Mitigation; Retpolines; IBPB conditional; IBRS_FW; STIBP always-on; RSB filling; PBRSB-eIBRS Not affected; BHI Not affected
Vulnerability Srbds:                     Not affected
Vulnerability Tsa:                       Vulnerable: Clear CPU buffers attempted, no microcode
Vulnerability Tsx async abort:           Not affected
Vulnerability Vmscape:                   Mitigation; IBPB before exit to userspace
```

### Memory

```text
               total        used        free      shared  buff/cache   available
Mem:            62Gi       1.3Gi        59Gi       3.5Mi       2.4Gi        60Gi
Swap:           12Gi          0B        12Gi

MemTotal:       65248764 kB
MemAvailable:   63891556 kB
SwapTotal:      12898300 kB
SwapFree:       12898300 kB
HugePages_Total:       0
Hugepagesize:       2048 kB
```

### Swap devices

```text
NAME           TYPE       SIZE USED PRIO
/dev/nvme1n1p3 partition 12.3G   0B   -2
```

### PCI devices relevant to GPU, network and storage

```text
01:00.0 Non-Volatile memory controller [0108]: MAXIO Technology (Hangzhou) Ltd. NVMe SSD Controller MAP1202 (DRAM-less) [1e4b:1202] (rev 01)
	Subsystem: MAXIO Technology (Hangzhou) Ltd. NVMe SSD Controller MAP1202 (DRAM-less) [1e4b:1202]
	Kernel driver in use: nvme
	Kernel modules: nvme
02:00.0 Ethernet controller [0200]: Intel Corporation Ethernet Controller I226-V [8086:125c] (rev 04)
	DeviceName: Onboard LAN Brodcom
	Subsystem: Intel Corporation Device [8086:0000]
	Kernel driver in use: igc
	Kernel modules: igc
03:00.0 Ethernet controller [0200]: Intel Corporation Ethernet Controller I226-V [8086:125c] (rev 04)
	Subsystem: Intel Corporation Device [8086:0000]
	Kernel driver in use: igc
	Kernel modules: igc
04:00.0 Non-Volatile memory controller [0108]: KIOXIA Corporation NVMe SSD Controller BG5 (DRAM-less) [1e0f:000c]
	Subsystem: KIOXIA Corporation Device [1e0f:0001]
	Kernel driver in use: nvme
	Kernel modules: nvme
05:00.0 Non-Volatile memory controller [0108]: Phison Electronics Corporation PS5027-E27T PCIe4 NVMe Controller (DRAM-less) [1987:5027] (rev 01)
	Subsystem: Phison Electronics Corporation PS5027-E27T PCIe4 NVMe Controller (DRAM-less) [1987:5027]
	Kernel driver in use: nvme
	Kernel modules: nvme
06:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Barcelo [1002:15e7] (rev c1)
	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Device [1002:0123]
	Kernel driver in use: amdgpu
	Kernel modules: amdgpu
06:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Renoir Radeon High Definition Audio Controller [1002:1637]
--
06:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne USB 3.1 [1022:1639]
	Subsystem: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne USB 3.1 [1022:1639]
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci
06:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne USB 3.1 [1022:1639]
	Subsystem: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne USB 3.1 [1022:1639]
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci
06:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD] Audio Coprocessor [1022:15e2] (rev 01)
--
07:00.0 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] [1022:7904] (rev 81)
	Subsystem: Advanced Micro Devices, Inc. [AMD] Device [1022:7901]
	Kernel driver in use: ahci
	Kernel modules: ahci
07:00.1 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] [1022:7904] (rev 81)
	Subsystem: Advanced Micro Devices, Inc. [AMD] Device [1022:7901]
	Kernel driver in use: ahci
	Kernel modules: ahci
```

### USB devices

```text
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 002: ID 0d8c:0014 C-Media Electronics, Inc. Audio Adapter (Unitek Y-247A)
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
```

## Networking


### Interfaces and addresses

```text
lo               UNKNOWN        127.0.0.1/8 ::1/128 
eno1             DOWN           
enp3s0           UP             192.168.0.11/24 
tailscale0       UNKNOWN        100.101.105.1/32 fd7a:115c:a1e0::da32:6902/128 fe80::e1c9:d77:1e57:4514/64 
```

### Link-layer details

```text
lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP> 
eno1             DOWN           c8:ff:bf:05:f4:46 <BROADCAST,MULTICAST> 
enp3s0           UP             c8:ff:bf:05:f4:46 <BROADCAST,MULTICAST,UP,LOWER_UP> 
tailscale0       UNKNOWN        <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> 
```

### Routing table

```text
default via 192.168.0.1 dev enp3s0 proto static 
192.168.0.0/24 dev enp3s0 proto kernel scope link src 192.168.0.11 
```

### Neighbour table

```text
192.168.0.203 dev enp3s0 lladdr c0:e5:da:7c:b2:2a STALE 
192.168.0.36 dev enp3s0 lladdr 98:25:4a:4f:2b:1c STALE 
192.168.0.37 dev enp3s0 lladdr 98:25:4a:4f:2b:f0 STALE 
192.168.0.38 dev enp3s0 lladdr 98:25:4a:4e:ee:50 STALE 
192.168.0.206 dev enp3s0 lladdr 40:1a:58:4a:d3:68 DELAY 
192.168.0.1 dev enp3s0 lladdr cc:ba:bd:d2:21:98 DELAY 
192.168.0.10 dev enp3s0 FAILED 
192.168.0.12 dev enp3s0 lladdr 58:47:ca:79:08:69 STALE 
```

### Interface link speeds

```text
### eno1
	Speed: Unknown!
	Duplex: Unknown! (255)
	Port: Twisted Pair
	Link detected: no

### enp3s0
	Speed: 2500Mb/s
	Duplex: Full
	Port: Twisted Pair
	Link detected: yes

### tailscale0
	Speed: Unknown!
	Duplex: Full
	Port: Twisted Pair
	Link detected: yes

```

### DNS resolver

```text
Global
         Protocols: +LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
  resolv.conf mode: stub

Link 2 (eno1)
    Current Scopes: none
         Protocols: -DefaultRoute +LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
     Default Route: no

Link 3 (enp3s0)
    Current Scopes: DNS LLMNR/IPv4
         Protocols: +DefaultRoute +LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
Current DNS Server: 192.168.0.1
       DNS Servers: 192.168.0.1
     Default Route: yes

Link 4 (tailscale0)
    Current Scopes: DNS
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
Current DNS Server: 100.100.100.100
       DNS Servers: 100.100.100.100
        DNS Domain: tail7b096.ts.net ~0.e.1.a.c.5.1.1.a.7.d.f.ip6.arpa
                    ~100.100.in-addr.arpa ~101.100.in-addr.arpa
                    ~102.100.in-addr.arpa ~103.100.in-addr.arpa
                    ~104.100.in-addr.arpa ~105.100.in-addr.arpa
                    ~106.100.in-addr.arpa ~107.100.in-addr.arpa
                    ~108.100.in-addr.arpa ~109.100.in-addr.arpa
                    ~110.100.in-addr.arpa ~111.100.in-addr.arpa
                    ~112.100.in-addr.arpa ~113.100.in-addr.arpa
                    ~114.100.in-addr.arpa ~115.100.in-addr.arpa
                    ~116.100.in-addr.arpa ~117.100.in-addr.arpa
                    ~118.100.in-addr.arpa ~119.100.in-addr.arpa
                    ~120.100.in-addr.arpa ~121.100.in-addr.arpa
                    ~122.100.in-addr.arpa ~123.100.in-addr.arpa
                    ~124.100.in-addr.arpa ~125.100.in-addr.arpa
                    ~126.100.in-addr.arpa ~127.100.in-addr.arpa
                    ~64.100.in-addr.arpa ~65.100.in-addr.arpa
                    ~66.100.in-addr.arpa ~67.100.in-addr.arpa
                    ~68.100.in-addr.arpa ~69.100.in-addr.arpa
                    ~70.100.in-addr.arpa ~71.100.in-addr.arpa
                    ~72.100.in-addr.arpa ~73.100.in-addr.arpa
                    ~74.100.in-addr.arpa ~75.100.in-addr.arpa
                    ~76.100.in-addr.arpa ~77.100.in-addr.arpa
                    ~78.100.in-addr.arpa ~79.100.in-addr.arpa
                    ~80.100.in-addr.arpa ~81.100.in-addr.arpa
                    ~82.100.in-addr.arpa ~83.100.in-addr.arpa
                    ~84.100.in-addr.arpa ~85.100.in-addr.arpa
                    ~86.100.in-addr.arpa ~87.100.in-addr.arpa
                    ~88.100.in-addr.arpa ~89.100.in-addr.arpa
                    ~90.100.in-addr.arpa ~91.100.in-addr.arpa
                    ~92.100.in-addr.arpa ~93.100.in-addr.arpa
                    ~94.100.in-addr.arpa ~95.100.in-addr.arpa
                    ~96.100.in-addr.arpa ~97.100.in-addr.arpa
                    ~98.100.in-addr.arpa ~99.100.in-addr.arpa ~ts.net
     Default Route: no
```

### Tailscale

```text
100.101.105.1   nas                  jrenewhite@  linux   -
100.112.160.103 ai-gpu               jrenewhite@  linux   -
100.118.34.123  ai-igpu-mty.tail1fbcd5.ts.net alvalo96@    linux   offline
100.107.33.127  bd795m               jrenewhite@  linux   offline
100.90.73.117   gl-a1300             jrenewhite@  linux   offline
100.83.102.8    google-pixel-8-pro   jrenewhite@  android offline
100.103.54.72   hp-envy-x360         jrenewhite@  linux   offline
100.90.244.77   macbook-air-m4       jrenewhite@  macOS   offline
100.122.233.19  management-mty.tail1fbcd5.ts.net alvalo96@    linux   offline
100.70.182.44   management           jrenewhite@  linux   offline
100.86.226.70   nas-mty.tail1fbcd5.ts.net alvalo96@    linux   offline
100.121.197.90  orangepi5-a          jrenewhite@  linux   -
100.103.15.69   orangepi5-b          jrenewhite@  linux   -
100.93.82.30    orangepi5-max        jrenewhite@  linux   -
100.94.193.53   orangepi5-ultra      jrenewhite@  linux   -
100.104.123.103 peru-ai-gpu          jrenewhite@  linux   -
100.81.168.75   peru-nas             jrenewhite@  linux   -
100.68.148.26   peru-rpi4-a          jrenewhite@  linux   -
100.121.97.111  peru-rpi4-b          jrenewhite@  linux   -
100.68.9.59     peru-rpi5-a          jrenewhite@  linux   -
100.74.71.106   peru-rpi5-b          jrenewhite@  linux   offline
100.78.74.100   peru-services        jrenewhite@  linux   -
100.112.33.91   services             jrenewhite@  linux   -
```

### Tailscale addresses

```text
100.101.105.1
fd7a:115c:a1e0::da32:6902
```

## Storage


### Block devices

```text
NAME        PATH           TYPE    SIZE MODEL                  SERIAL               TRAN   ROTA FSTYPE            FSVER LABEL      UUID                                 MOUNTPOINTS     FSAVAIL FSUSE%
sda         /dev/sda       disk   10.9T ST12000NE0008-2PK103   ZLW01NZQ             sata      1 linux_raid_member 1.2   nas:0      72f417f7-ed71-787d-5a4d-3f79f1859847                         
└─md0       /dev/md0       raid1  10.9T                                                       1 xfs                     media-cold 51f347f0-7b1f-4337-918c-8eb8b5fa00be /srv/media-cold   10.7T     2%
sdb         /dev/sdb       disk   10.9T ST12000NE0008-2PK103   ZLW04JHH             sata      1 linux_raid_member 1.2   nas:0      72f417f7-ed71-787d-5a4d-3f79f1859847                         
└─md0       /dev/md0       raid1  10.9T                                                       1 xfs                     media-cold 51f347f0-7b1f-4337-918c-8eb8b5fa00be /srv/media-cold   10.7T     2%
sdc         /dev/sdc       disk    3.6T ST4000VN006-3CW104     ZW63NQRB             sata      1 linux_raid_member 1.2   nas:1      ba62fbef-3794-a5bf-8d2e-e1fb9d5b91b8                         
└─md1       /dev/md1       raid1   3.6T                                                       1 ext4              1.0   docs-cold  c112211a-68e2-4f45-80ab-8c92904f6fcb /srv/docs-cold     3.4T     0%
sdd         /dev/sdd       disk    3.6T ST4000VN006-3CW104     ZW63TA9X             sata      1 linux_raid_member 1.2   nas:1      ba62fbef-3794-a5bf-8d2e-e1fb9d5b91b8                         
└─md1       /dev/md1       raid1   3.6T                                                       1 ext4              1.0   docs-cold  c112211a-68e2-4f45-80ab-8c92904f6fcb /srv/docs-cold     3.4T     0%
nvme1n1     /dev/nvme1n1   disk  238.5G KBG50ZNT256G LS KIOXIA X3DC91XGEWUU         nvme      0                                                                                                 
├─nvme1n1p1 /dev/nvme1n1p1 part    976M                                             nvme      0 vfat              FAT32            8E12-DAC7                            /boot/efi        973.8M     0%
├─nvme1n1p2 /dev/nvme1n1p2 part  225.2G                                             nvme      0 ext4              1.0              5a57c461-7144-4740-8119-7df6f3113445 /                206.1G     1%
└─nvme1n1p3 /dev/nvme1n1p3 part   12.3G                                             nvme      0 swap              1                efc9a020-40bc-467b-b81a-c2b9c8c771ea [SWAP]                  
nvme0n1     /dev/nvme0n1   disk  119.2G ORICO                  87AE8US5Z3SFGYS1E5OK nvme      0 btrfs                   docs-warm  d705e588-4652-4b1c-b427-e23371bbcb92 /srv/docs-warm   117.2G     0%
nvme2n1     /dev/nvme2n1   disk  476.9G T-FORCE TM8FFQ512G     TPBF2312010050102193 nvme      0 btrfs                   media-warm 5ceeef7e-a64f-4a24-8c3c-a17704980ff5 /srv/media-warm  474.9G     0%
```

### Filesystem identifiers

```text
/dev/nvme0n1: LABEL="docs-warm" UUID="d705e588-4652-4b1c-b427-e23371bbcb92" UUID_SUB="82724c2f-a584-4166-8082-ffb49f027a94" BLOCK_SIZE="4096" TYPE="btrfs"
/dev/sdd: UUID="ba62fbef-3794-a5bf-8d2e-e1fb9d5b91b8" UUID_SUB="6cedd24e-cb1b-13a8-1fcf-f070c373f738" LABEL="nas:1" TYPE="linux_raid_member"
/dev/sdb: UUID="72f417f7-ed71-787d-5a4d-3f79f1859847" UUID_SUB="2f9d1b14-76dc-5bd2-b5bd-e24e53ddb0b4" LABEL="nas:0" TYPE="linux_raid_member"
/dev/md0: LABEL="media-cold" UUID="51f347f0-7b1f-4337-918c-8eb8b5fa00be" BLOCK_SIZE="4096" TYPE="xfs"
/dev/nvme2n1: LABEL="media-warm" UUID="5ceeef7e-a64f-4a24-8c3c-a17704980ff5" UUID_SUB="a06a7244-5517-4054-a6d6-04c58c7d090d" BLOCK_SIZE="4096" TYPE="btrfs"
/dev/sdc: UUID="ba62fbef-3794-a5bf-8d2e-e1fb9d5b91b8" UUID_SUB="9a76629e-8000-879e-ca27-0d39b17b9435" LABEL="nas:1" TYPE="linux_raid_member"
/dev/nvme1n1p2: UUID="5a57c461-7144-4740-8119-7df6f3113445" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="6dd7f0a6-66a9-43ab-a034-f09783d26fef"
/dev/nvme1n1p3: UUID="efc9a020-40bc-467b-b81a-c2b9c8c771ea" TYPE="swap" PARTUUID="2f9008b4-61db-46f6-a426-6ac87bba09e7"
/dev/nvme1n1p1: UUID="8E12-DAC7" BLOCK_SIZE="512" TYPE="vfat" PARTUUID="f586d722-da27-4c41-97e9-8ef4bca712f5"
/dev/sda: UUID="72f417f7-ed71-787d-5a4d-3f79f1859847" UUID_SUB="e9ab4cef-a2b4-5d0b-c7c0-ba092e4a610d" LABEL="nas:0" TYPE="linux_raid_member"
/dev/md1: LABEL="docs-cold" UUID="c112211a-68e2-4f45-80ab-8c92904f6fcb" BLOCK_SIZE="4096" TYPE="ext4"
```

### Mounted filesystems

```text
TARGET                                        SOURCE         FSTYPE        OPTIONS
/                                             /dev/nvme1n1p2 ext4          rw,relatime,errors=remount-ro
├─/sys                                        sysfs          sysfs         rw,nosuid,nodev,noexec,relatime
│ ├─/sys/firmware/efi/efivars                 efivarfs       efivarfs      rw,nosuid,nodev,noexec,relatime
│ ├─/sys/kernel/security                      securityfs     securityfs    rw,nosuid,nodev,noexec,relatime
│ ├─/sys/fs/cgroup                            cgroup2        cgroup2       rw,nosuid,nodev,noexec,relatime,nsdelegate,memory_recursiveprot
│ ├─/sys/fs/pstore                            pstore         pstore        rw,nosuid,nodev,noexec,relatime
│ ├─/sys/fs/bpf                               bpf            bpf           rw,nosuid,nodev,noexec,relatime,mode=700
│ ├─/sys/kernel/debug                         debugfs        debugfs       rw,nosuid,nodev,noexec,relatime
│ ├─/sys/kernel/tracing                       tracefs        tracefs       rw,nosuid,nodev,noexec,relatime
│ ├─/sys/fs/fuse/connections                  fusectl        fusectl       rw,nosuid,nodev,noexec,relatime
│ └─/sys/kernel/config                        configfs       configfs      rw,nosuid,nodev,noexec,relatime
├─/proc                                       proc           proc          rw,nosuid,nodev,noexec,relatime
│ ├─/proc/sys/fs/binfmt_misc                  systemd-1      autofs        rw,relatime,fd=42,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=7962
│ │ └─/proc/sys/fs/binfmt_misc                binfmt_misc    binfmt_misc   rw,nosuid,nodev,noexec,relatime
│ └─/proc/fs/nfsd                             nfsd           nfsd          rw,relatime
├─/dev                                        udev           devtmpfs      rw,nosuid,relatime,size=32576104k,nr_inodes=8144026,mode=755,inode64
│ ├─/dev/pts                                  devpts         devpts        rw,nosuid,noexec,relatime,gid=5,mode=600,ptmxmode=000
│ ├─/dev/shm                                  tmpfs          tmpfs         rw,nosuid,nodev,inode64
│ ├─/dev/mqueue                               mqueue         mqueue        rw,nosuid,nodev,noexec,relatime
│ └─/dev/hugepages                            hugetlbfs      hugetlbfs     rw,nosuid,nodev,relatime,pagesize=2M
├─/run                                        tmpfs          tmpfs         rw,nosuid,nodev,noexec,relatime,size=6524880k,mode=755,inode64
│ ├─/run/lock                                 tmpfs          tmpfs         rw,nosuid,nodev,noexec,relatime,size=5120k,inode64
│ ├─/run/credentials/systemd-journald.service tmpfs          tmpfs         ro,nosuid,nodev,noexec,relatime,nosymfollow,size=1024k,nr_inodes=1024,mode=700,inode64,noswap
│ ├─/run/credentials/systemd-resolved.service tmpfs          tmpfs         ro,nosuid,nodev,noexec,relatime,nosymfollow,size=1024k,nr_inodes=1024,mode=700,inode64,noswap
│ ├─/run/credentials/systemd-networkd.service tmpfs          tmpfs         ro,nosuid,nodev,noexec,relatime,nosymfollow,size=1024k,nr_inodes=1024,mode=700,inode64,noswap
│ ├─/run/rpc_pipefs                           sunrpc         rpc_pipefs    rw,relatime
│ └─/run/credentials/getty@tty1.service       tmpfs          tmpfs         ro,nosuid,nodev,noexec,relatime,nosymfollow,size=1024k,nr_inodes=1024,mode=700,inode64,noswap
├─/tmp                                        tmpfs          tmpfs         rw,relatime,inode64
├─/srv/media-warm                             /dev/nvme2n1   btrfs         rw,noatime,compress=zstd:3,ssd,discard=async,space_cache=v2,subvolid=5,subvol=/
├─/srv/docs                                   docs           fuse.mergerfs rw,relatime,user_id=0,group_id=0,default_permissions,allow_other
├─/srv/media                                  media          fuse.mergerfs rw,relatime,user_id=0,group_id=0,default_permissions,allow_other
├─/srv/docs-warm                              /dev/nvme0n1   btrfs         rw,noatime,compress=zstd:3,ssd,discard=async,space_cache=v2,subvolid=5,subvol=/
├─/boot/efi                                   /dev/nvme1n1p1 vfat          rw,relatime,fmask=0077,dmask=0077,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro
├─/srv/media-cold                             /dev/md0       xfs           rw,noatime,attr2,inode64,logbufs=8,logbsize=32k,noquota
└─/srv/docs-cold                              /dev/md1       ext4          rw,noatime
```

### Filesystem usage

```text
Filesystem     Type           Size  Used Avail Use% Mounted on
udev           devtmpfs        32G     0   32G   0% /dev
tmpfs          tmpfs          6.3G  1.1M  6.3G   1% /run
efivarfs       efivarfs       128K   39K   85K  32% /sys/firmware/efi/efivars
/dev/nvme1n1p2 ext4           221G  3.3G  207G   2% /
tmpfs          tmpfs           32G     0   32G   0% /dev/shm
tmpfs          tmpfs          5.0M     0  5.0M   0% /run/lock
tmpfs          tmpfs          1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
tmpfs          tmpfs          1.0M     0  1.0M   0% /run/credentials/systemd-resolved.service
tmpfs          tmpfs          1.0M     0  1.0M   0% /run/credentials/systemd-networkd.service
tmpfs          tmpfs           32G     0   32G   0% /tmp
/dev/nvme2n1   btrfs          477G  5.8M  475G   1% /srv/media-warm
docs           fuse.mergerfs  3.7T  7.9M  3.6T   1% /srv/docs
media          fuse.mergerfs   12T  214G   12T   2% /srv/media
/dev/nvme0n1   btrfs          120G  5.8M  118G   1% /srv/docs-warm
/dev/nvme1n1p1 vfat           975M  304K  974M   1% /boot/efi
/dev/md0       xfs             11T  214G   11T   2% /srv/media-cold
/dev/md1       ext4           3.6T  2.1M  3.4T   1% /srv/docs-cold
tmpfs          tmpfs          1.0M     0  1.0M   0% /run/credentials/getty@tty1.service
```

### Linux MD RAID

```text
Personalities : [raid1] [raid0] [raid6] [raid5] [raid4] [raid10] 
md1 : active raid1 sdd[0] sdc[1]
      3906886464 blocks super 1.2 [2/2] [UU]
      bitmap: 0/30 pages [0KB], 65536KB chunk

md0 : active raid1 sdb[0] sda[1]
      11718753280 blocks super 1.2 [2/2] [UU]
      bitmap: 0/88 pages [0KB], 65536KB chunk

unused devices: <none>
```

### MD RAID details

```text
### /dev/md0
/dev/md0:
           Version : 1.2
     Creation Time : Sun May 24 18:15:54 2026
        Raid Level : raid1
        Array Size : 11718753280 (10.91 TiB 12.00 TB)
     Used Dev Size : 11718753280 (10.91 TiB 12.00 TB)
      Raid Devices : 2
     Total Devices : 2
       Persistence : Superblock is persistent

     Intent Bitmap : Internal

       Update Time : Wed Aug  5 10:33:00 2026
             State : clean 
    Active Devices : 2
   Working Devices : 2
    Failed Devices : 0
     Spare Devices : 0

Consistency Policy : bitmap

              Name : nas:0  (local to host nas)
              UUID : 72f417f7:ed71787d:5a4d3f79:f1859847
            Events : 13998

    Number   Major   Minor   RaidDevice State
       0       8       16        0      active sync   /dev/sdb
       1       8        0        1      active sync   /dev/sda

### /dev/md1
/dev/md1:
           Version : 1.2
     Creation Time : Sun May 24 18:16:36 2026
        Raid Level : raid1
        Array Size : 3906886464 (3.64 TiB 4.00 TB)
     Used Dev Size : 3906886464 (3.64 TiB 4.00 TB)
      Raid Devices : 2
     Total Devices : 2
       Persistence : Superblock is persistent

     Intent Bitmap : Internal

       Update Time : Mon Aug  3 05:20:25 2026
             State : clean 
    Active Devices : 2
   Working Devices : 2
    Failed Devices : 0
     Spare Devices : 0

Consistency Policy : bitmap

              Name : nas:1  (local to host nas)
              UUID : ba62fbef:3794a5bf:8d2ee1fb:9d5b91b8
            Events : 40557

    Number   Major   Minor   RaidDevice State
       0       8       48        0      active sync   /dev/sdd
       1       8       32        1      active sync   /dev/sdc

```

### LVM

```text


```

### Btrfs

```text
Label: 'media-warm'  uuid: 5ceeef7e-a64f-4a24-8c3c-a17704980ff5
	Total devices 1 FS bytes used 144.00KiB
	devid    1 size 476.94GiB used 2.07GiB path /dev/nvme2n1

Label: 'docs-warm'  uuid: d705e588-4652-4b1c-b427-e23371bbcb92
	Total devices 1 FS bytes used 144.00KiB
	devid    1 size 119.24GiB used 2.07GiB path /dev/nvme0n1

```

### Network filesystems

```text
```

### NFS exports

```text
/srv/media    	192.168.0.0/24(sync,wdelay,hide,no_subtree_check,fsid=101,sec=sys,rw,secure,root_squash,no_all_squash)
/srv/docs     	192.168.0.0/24(sync,wdelay,hide,no_subtree_check,fsid=102,sec=sys,rw,secure,root_squash,no_all_squash)
```

### MergerFS

```text
mergerfs vunknown

https://github.com/trapexit/mergerfs
https://github.com/trapexit/support

ISC License (ISC)

Copyright 2023, Antonio SJ Musumeci <trapexit@spawn.link>

Permission to use, copy, modify, and/or distribute this software for
any purpose with or without fee is hereby granted, provided that the
above copyright notice and this permission notice appear in all
copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.

TARGET     SOURCE FSTYPE        OPTIONS
/srv/docs  docs   fuse.mergerfs rw,relatime,user_id=0,group_id=0,default_permissions,allow_other
/srv/media media  fuse.mergerfs rw,relatime,user_id=0,group_id=0,default_permissions,allow_other
/etc/fstab:/srv/media-warm:/srv/media-cold /srv/media fuse.mergerfs defaults,allow_other,use_ino,category.create=ff,minfreespace=20G,moveonenospc=true,fsname=media 0 0
/etc/fstab:/srv/docs-warm:/srv/docs-cold /srv/docs fuse.mergerfs defaults,allow_other,use_ino,category.create=ff,minfreespace=10G,moveonenospc=true,fsname=docs 0 0
```

## Containers and virtualization


## Software and services


### Notable software

```text
tailscale          /usr/bin/tailscale                  1.38.4   tailscale commit: c439a3a9c82507b52714c869e5cc093054a706a6 
nginx              /usr/sbin/nginx                     
smbd               /usr/sbin/smbd                      Version 4.22.10-Debian-4.22.10+dfsg-0+deb13u2 
nmbd               /usr/sbin/nmbd                      Version 4.22.10-Debian-4.22.10+dfsg-0+deb13u2 
mount.nfs          /usr/sbin/mount.nfs                 mount.nfs: (linux nfs-utils 2.8.3) 
exportfs           /usr/sbin/exportfs                  
mergerfs           /usr/bin/mergerfs                   mergerfs vunknown  
smartctl           /usr/sbin/smartctl                  smartctl 7.4 2023-08-01 r5530 [x86_64-linux-6.12.95+deb13-amd64] (local build) Copyright (C) 2002-23, Bruce Allen, Christian Franke, www.smartmontools.org 
mdadm              /usr/sbin/mdadm                     
btrfs              /usr/bin/btrfs                      btrfs-progs v6.14 -EXPERIMENTAL -INJECT -STATIC +LZO +ZSTD +UDEV +FSVERITY +ZONED CRYPTO=builtin 
python3            /usr/bin/python3                    Python 3.13.5 
rsync              /usr/bin/rsync                      rsync  version 3.4.1  protocol version 32 Copyright (C) 1996-2025 by Andrew Tridgell, Wayne Davison, and others. 
upsc               /usr/bin/upsc                       Network UPS Tools upsc 2.8.1  
```

### Running systemd services

```text
  avahi-daemon.service           loaded active running Avahi mDNS/DNS-SD Stack
  chrony.service                 loaded active running chrony, an NTP client/server
  collectd.service               loaded active running Statistics collection and monitoring daemon
  cron.service                   loaded active running Regular background program processing daemon
  dbus.service                   loaded active running D-Bus System Message Bus
  fsidd.service                  loaded active running NFS FSID Daemon
  getty@tty1.service             loaded active running Getty on tty1
  monit.service                  loaded active running Pro-active monitoring utility for unix systems
  nfs-blkmap.service             loaded active running pNFS block layout mapping daemon
  nfs-idmapd.service             loaded active running NFSv4 ID-name mapping service
  nfs-mountd.service             loaded active running NFS Mount Daemon
  nfsdcld.service                loaded active running NFSv4 Client Tracking Daemon
  nginx.service                  loaded active running A high performance web server and a reverse proxy server
  nut-monitor.service            loaded active running Network UPS Tools - power device monitor and shutdown controller
  openmediavault-engined.service loaded active running The OpenMediaVault engine daemon that processes the RPC request
  php8.4-fpm.service             loaded active running The PHP 8.4 FastCGI Process Manager
  rpc-statd.service              loaded active running NFS status monitor for NFSv2/3 locking.
  rpcbind.service                loaded active running RPC bind portmap service
  rrdcached.service              loaded active running LSB: start or stop rrdcached
  rsyslog.service                loaded active running System Logging Service
  ssh.service                    loaded active running OpenBSD Secure Shell server
  systemd-hostnamed.service      loaded active running Hostname Service
  systemd-journald.service       loaded active running Journal Service
  systemd-logind.service         loaded active running User Login Management
  systemd-networkd.service       loaded active running Network Configuration
  systemd-resolved.service       loaded active running Network Name Resolution
  systemd-udevd.service          loaded active running Rule-based Manager for Device Events and Files
  tailscaled.service             loaded active running Tailscale node agent
  unattended-upgrades.service    loaded active running Unattended Upgrades Shutdown
  wpa_supplicant.service         loaded active running WPA supplicant
```

### Enabled systemd services

```text
anacron.service                      enabled enabled
avahi-daemon.service                 enabled enabled
blk-availability.service             enabled enabled
chrony.service                       enabled enabled
collectd.service                     enabled enabled
console-setup.service                enabled enabled
cron.service                         enabled enabled
e2scrub_reap.service                 enabled enabled
fsidd.service                        enabled enabled
getty@.service                       enabled enabled
grub-common.service                  enabled enabled
keyboard-setup.service               enabled enabled
lvm2-monitor.service                 enabled enabled
monit.service                        enabled enabled
networking.service                   enabled enabled
nfs-blkmap.service                   enabled enabled
nfs-server.service                   enabled enabled
nginx.service                        enabled enabled
nut-monitor.service                  enabled enabled
openmediavault-beep-down.service     enabled enabled
openmediavault-beep-up.service       enabled enabled
openmediavault-cleanup-monit.service enabled enabled
openmediavault-cleanup-php.service   enabled enabled
openmediavault-engined.service       enabled enabled
openmediavault-issue.service         enabled enabled
php8.4-fpm.service                   enabled enabled
rpcbind.service                      enabled enabled
rsyslog.service                      enabled enabled
smartctl-hdparm.service              enabled enabled
ssh.service                          enabled enabled
sshd-keygen.service                  enabled enabled
systemd-network-generator.service    enabled enabled
systemd-networkd-wait-online.service enabled enabled
systemd-networkd.service             enabled enabled
systemd-pstore.service               enabled enabled
systemd-resolved.service             enabled enabled
tailscaled.service                   enabled enabled
unattended-upgrades.service          enabled enabled
wpa_supplicant.service               enabled enabled
```

### Systemd timers

```text
NEXT                             LEFT LAST                                    PASSED UNIT                         ACTIVATES
Fri 2026-09-04 17:09:00 CST     19min Fri 2026-09-04 16:39:01 CST          10min ago phpsessionclean.timer        phpsessionclean.service
Fri 2026-09-04 17:19:04 CST     29min Fri 2026-09-04 11:15:54 CST       5h 33min ago apt-daily.timer              apt-daily.service
Fri 2026-09-04 17:34:41 CST     44min Fri 2026-09-04 16:34:31 CST          15min ago anacron.timer                anacron.service
Fri 2026-09-04 18:06:58 CST  1h 17min Fri 2026-09-04 14:11:19 CST       2h 38min ago apt-daily-upgrade.timer      apt-daily-upgrade.service
Sat 2026-09-05 00:00:00 CST        7h Fri 2026-09-04 00:00:03 CST            16h ago dpkg-db-backup.timer         dpkg-db-backup.service
Sat 2026-09-05 00:32:50 CST        7h Fri 2026-09-04 00:51:22 CST            15h ago logrotate.timer              logrotate.service
Sat 2026-09-05 03:15:00 CST       10h Fri 2026-09-04 03:15:04 CST            13h ago tier-media-cold.timer        tier-media-cold.service
Sat 2026-09-05 03:45:00 CST       10h Fri 2026-09-04 03:45:04 CST            13h ago tier-docs-cold.timer         tier-docs-cold.service
Sat 2026-09-05 14:12:09 CST       21h Fri 2026-09-04 14:12:09 CST       2h 37min ago systemd-tmpfiles-clean.timer systemd-tmpfiles-clean.service
Sat 2026-09-05 21:43:47 CST  1 day 4h Fri 2026-09-04 05:06:54 CST            11h ago mdmonitor-oneshot.timer      mdmonitor-oneshot.service
Sun 2026-09-06 03:10:09 CST 1 day 10h Sun 2026-08-30 03:10:36 CST         5 days ago xfs_scrub_all.timer          xfs_scrub_all.service
Sun 2026-09-06 03:10:47 CST 1 day 10h Sun 2026-08-30 03:10:46 CST         5 days ago e2scrub_all.timer            e2scrub_all.service
Sun 2026-09-06 11:40:02 CST 1 day 18h Sun 2026-08-02 06:05:42 CST 1 month 3 days ago mdcheck_start.timer          mdcheck_start.service
Mon 2026-09-07 00:43:14 CST    2 days Mon 2026-08-31 00:13:06 CST         4 days ago fstrim.timer                 fstrim.service
-                                   - Wed 2026-08-05 09:43:38 CST 4 weeks 2 days ago mdcheck_continue.timer       mdcheck_continue.service

15 timers listed.
```

### Failed systemd units

```text
  UNIT                      LOAD   ACTIVE SUB    DESCRIPTION
● mdmonitor-oneshot.service loaded failed failed Reminder for degraded MD arrays
● mdmonitor.service         loaded failed failed MD array monitor

Legend: LOAD   → Reflects whether the unit definition was properly loaded.
        ACTIVE → The high-level unit activation state, i.e. generalization of SUB.
        SUB    → The low-level unit activation state, values depend on unit type.

2 loaded units listed.
```

### Listening TCP/UDP ports

```text
Netid State  Recv-Q Send-Q               Local Address:Port  Peer Address:PortProcess                                                                                                                                                                                                                                                                                                                                                                                                                         
udp   UNCONN 0      0                          0.0.0.0:48651      0.0.0.0:*    users:(("rpc.statd",pid=1120,fd=8))                                                                                                                                                                                                                                                                                                                                                                                            
udp   UNCONN 0      0                          0.0.0.0:48676      0.0.0.0:*    users:(("rpc.mountd",pid=1115,fd=8))                                                                                                                                                                                                                                                                                                                                                                                           
udp   UNCONN 0      0                          0.0.0.0:57328      0.0.0.0:*    users:(("avahi-daemon",pid=996,fd=14))                                                                                                                                                                                                                                                                                                                                                                                         
udp   UNCONN 0      0                          0.0.0.0:60341      0.0.0.0:*                                                                                                                                                                                                                                                                                                                                                                                                                                   
udp   UNCONN 0      0                       127.0.0.54:53         0.0.0.0:*    users:(("systemd-resolve",pid=538,fd=20))                                                                                                                                                                                                                                                                                                                                                                                      
udp   UNCONN 0      0                    127.0.0.53%lo:53         0.0.0.0:*    users:(("systemd-resolve",pid=538,fd=18))                                                                                                                                                                                                                                                                                                                                                                                      
udp   UNCONN 0      0                          0.0.0.0:111        0.0.0.0:*    users:(("rpcbind",pid=993,fd=5),("systemd",pid=1,fd=125))                                                                                                                                                                                                                                                                                                                                                                      
udp   UNCONN 0      0                        127.0.0.1:323        0.0.0.0:*    users:(("chronyd",pid=1163,fd=5))                                                                                                                                                                                                                                                                                                                                                                                              
udp   UNCONN 0      0                          0.0.0.0:33567      0.0.0.0:*    users:(("rpc.mountd",pid=1115,fd=4))                                                                                                                                                                                                                                                                                                                                                                                           
udp   UNCONN 0      0                        127.0.0.1:872        0.0.0.0:*    users:(("rpc.statd",pid=1120,fd=5))                                                                                                                                                                                                                                                                                                                                                                                            
udp   UNCONN 0      0                          0.0.0.0:37730      0.0.0.0:*    users:(("rpc.mountd",pid=1115,fd=12))                                                                                                                                                                                                                                                                                                                                                                                          
udp   UNCONN 0      0                          0.0.0.0:5353       0.0.0.0:*    users:(("avahi-daemon",pid=996,fd=12))                                                                                                                                                                                                                                                                                                                                                                                         
udp   UNCONN 0      0                          0.0.0.0:5355       0.0.0.0:*    users:(("systemd-resolve",pid=538,fd=11))                                                                                                                                                                                                                                                                                                                                                                                      
udp   UNCONN 0      0                          0.0.0.0:41641      0.0.0.0:*    users:(("tailscaled",pid=1227,fd=18))                                                                                                                                                                                                                                                                                                                                                                                          
udp   UNCONN 0      0                             [::]:43379         [::]:*                                                                                                                                                                                                                                                                                                                                                                                                                                   
udp   UNCONN 0      0                             [::]:52493         [::]:*    users:(("avahi-daemon",pid=996,fd=15))                                                                                                                                                                                                                                                                                                                                                                                         
udp   UNCONN 0      0                             [::]:53281         [::]:*    users:(("rpc.mountd",pid=1115,fd=10))                                                                                                                                                                                                                                                                                                                                                                                          
udp   UNCONN 0      0                             [::]:32847         [::]:*    users:(("rpc.mountd",pid=1115,fd=6))                                                                                                                                                                                                                                                                                                                                                                                           
udp   UNCONN 0      0                             [::]:111           [::]:*    users:(("rpcbind",pid=993,fd=7),("systemd",pid=1,fd=130))                                                                                                                                                                                                                                                                                                                                                                      
udp   UNCONN 0      0                             [::]:32986         [::]:*    users:(("rpc.mountd",pid=1115,fd=14))                                                                                                                                                                                                                                                                                                                                                                                          
udp   UNCONN 0      0                            [::1]:323           [::]:*    users:(("chronyd",pid=1163,fd=6))                                                                                                                                                                                                                                                                                                                                                                                              
udp   UNCONN 0      0                             [::]:34657         [::]:*    users:(("rpc.statd",pid=1120,fd=10))                                                                                                                                                                                                                                                                                                                                                                                           
udp   UNCONN 0      0                             [::]:5353          [::]:*    users:(("avahi-daemon",pid=996,fd=13))                                                                                                                                                                                                                                                                                                                                                                                         
udp   UNCONN 0      0                             [::]:5355          [::]:*    users:(("systemd-resolve",pid=538,fd=13))                                                                                                                                                                                                                                                                                                                                                                                      
udp   UNCONN 0      0                             [::]:41641         [::]:*    users:(("tailscaled",pid=1227,fd=10))                                                                                                                                                                                                                                                                                                                                                                                          
tcp   LISTEN 0      4096                       0.0.0.0:58167      0.0.0.0:*    users:(("rpc.mountd",pid=1115,fd=5))                                                                                                                                                                                                                                                                                                                                                                                           
tcp   LISTEN 0      4096                 127.0.0.53%lo:53         0.0.0.0:*    users:(("systemd-resolve",pid=538,fd=19))                                                                                                                                                                                                                                                                                                                                                                                      
tcp   LISTEN 0      4096                       0.0.0.0:49197      0.0.0.0:*    users:(("rpc.mountd",pid=1115,fd=9))                                                                                                                                                                                                                                                                                                                                                                                           
tcp   LISTEN 0      4096                       0.0.0.0:43365      0.0.0.0:*    users:(("rpc.mountd",pid=1115,fd=13))                                                                                                                                                                                                                                                                                                                                                                                          
tcp   LISTEN 0      4096                       0.0.0.0:2049       0.0.0.0:*                                                                                                                                                                                                                                                                                                                                                                                                                                   
tcp   LISTEN 0      4096                 100.101.105.1:45217      0.0.0.0:*    users:(("tailscaled",pid=1227,fd=27))                                                                                                                                                                                                                                                                                                                                                                                          
tcp   LISTEN 0      4096                       0.0.0.0:111        0.0.0.0:*    users:(("rpcbind",pid=993,fd=4),("systemd",pid=1,fd=124))                                                                                                                                                                                                                                                                                                                                                                      
tcp   LISTEN 0      511                        0.0.0.0:80         0.0.0.0:*    users:(("nginx",pid=1151,fd=7),("nginx",pid=1150,fd=7),("nginx",pid=1149,fd=7),("nginx",pid=1148,fd=7),("nginx",pid=1147,fd=7),("nginx",pid=1146,fd=7),("nginx",pid=1145,fd=7),("nginx",pid=1144,fd=7),("nginx",pid=1142,fd=7),("nginx",pid=1141,fd=7),("nginx",pid=1140,fd=7),("nginx",pid=1139,fd=7),("nginx",pid=1138,fd=7),("nginx",pid=1137,fd=7),("nginx",pid=1136,fd=7),("nginx",pid=1134,fd=7),("nginx",pid=1133,fd=7))
tcp   LISTEN 0      128                        0.0.0.0:22         0.0.0.0:*    users:(("sshd",pid=1135,fd=6))                                                                                                                                                                                                                                                                                                                                                                                                 
tcp   LISTEN 0      4096                    127.0.0.54:53         0.0.0.0:*    users:(("systemd-resolve",pid=538,fd=21))                                                                                                                                                                                                                                                                                                                                                                                      
tcp   LISTEN 0      64                         0.0.0.0:40245      0.0.0.0:*                                                                                                                                                                                                                                                                                                                                                                                                                                   
tcp   LISTEN 0      4096                       0.0.0.0:37751      0.0.0.0:*    users:(("rpc.statd",pid=1120,fd=9))                                                                                                                                                                                                                                                                                                                                                                                            
tcp   LISTEN 0      4096                       0.0.0.0:5355       0.0.0.0:*    users:(("systemd-resolve",pid=538,fd=12))                                                                                                                                                                                                                                                                                                                                                                                      
tcp   LISTEN 0      4096   [fd7a:115c:a1e0::da32:6902]:55598         [::]:*    users:(("tailscaled",pid=1227,fd=29))                                                                                                                                                                                                                                                                                                                                                                                          
tcp   LISTEN 0      4096                          [::]:52515         [::]:*    users:(("rpc.mountd",pid=1115,fd=11))                                                                                                                                                                                                                                                                                                                                                                                          
tcp   LISTEN 0      4096                          [::]:55451         [::]:*    users:(("rpc.statd",pid=1120,fd=11))                                                                                                                                                                                                                                                                                                                                                                                           
tcp   LISTEN 0      64                            [::]:41757         [::]:*                                                                                                                                                                                                                                                                                                                                                                                                                                   
tcp   LISTEN 0      4096                          [::]:2049          [::]:*                                                                                                                                                                                                                                                                                                                                                                                                                                   
tcp   LISTEN 0      4096                          [::]:111           [::]:*    users:(("rpcbind",pid=993,fd=6),("systemd",pid=1,fd=129))                                                                                                                                                                                                                                                                                                                                                                      
tcp   LISTEN 0      511                           [::]:80            [::]:*    users:(("nginx",pid=1151,fd=8),("nginx",pid=1150,fd=8),("nginx",pid=1149,fd=8),("nginx",pid=1148,fd=8),("nginx",pid=1147,fd=8),("nginx",pid=1146,fd=8),("nginx",pid=1145,fd=8),("nginx",pid=1144,fd=8),("nginx",pid=1142,fd=8),("nginx",pid=1141,fd=8),("nginx",pid=1140,fd=8),("nginx",pid=1139,fd=8),("nginx",pid=1138,fd=8),("nginx",pid=1137,fd=8),("nginx",pid=1136,fd=8),("nginx",pid=1134,fd=8),("nginx",pid=1133,fd=8))
tcp   LISTEN 0      128                           [::]:22            [::]:*    users:(("sshd",pid=1135,fd=7))                                                                                                                                                                                                                                                                                                                                                                                                 
tcp   LISTEN 0      4096                          [::]:39331         [::]:*    users:(("rpc.mountd",pid=1115,fd=15))                                                                                                                                                                                                                                                                                                                                                                                          
tcp   LISTEN 0      4096                          [::]:37345         [::]:*    users:(("rpc.mountd",pid=1115,fd=7))                                                                                                                                                                                                                                                                                                                                                                                           
tcp   LISTEN 0      4096                          [::]:5355          [::]:*    users:(("systemd-resolve",pid=538,fd=14))                                                                                                                                                                                                                                                                                                                                                                                      
```

## Packages


### Package-manager summary

```text
Package manager: dpkg
Installed packages: 523
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
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

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
total 28
drwxr-xr-x  2 root root 4096 May 28 02:28 .
drwxr-xr-x 96 root root 4096 Aug 31 06:20 ..
-rw-r--r--  1 root root  102 Jun 13  2025 .placeholder
-rw-r--r--  1 root root  290 May 19  2025 anacron
-rw-r--r--  1 root root  188 Jan  2  2026 e2scrub_all
-rw-r--r--  1 root root  126 May 28 02:28 openmediavault-mkrrdgraph
-rw-r--r--  1 root root  712 Dec  4  2024 php

### /etc/cron.daily
total 60
drwxr-xr-x  2 root root 4096 May 24 16:21 .
drwxr-xr-x 96 root root 4096 Aug 31 06:20 ..
-rw-r--r--  1 root root  102 Jun 13  2025 .placeholder
-rwxr-xr-x  1 root root  311 Apr 23  2025 0anacron
-rwxr-xr-x  1 root root 1478 Jun 24  2025 apt-compat
-rwxr-xr-x  1 root root  123 May 27  2025 dpkg
-rwxr-xr-x  1 root root  377 Jul 14  2024 logrotate
-rwxr-xr-x  1 root root  229 Jan 22  2026 openmediavault-apticron
-rwxr-xr-x  1 root root 2327 Jan  4  2026 openmediavault-check_btrfs_errors
-rwxr-xr-x  1 root root 2337 Jan  4  2026 openmediavault-check_locked_users
-rwxr-xr-x  1 root root 2609 Jan  4  2026 openmediavault-check_ssl_cert_expiry
-rwxr-xr-x  1 root root 1475 Jan  4  2026 openmediavault-flush-mailq
-rwxr-xr-x  1 root root 1477 Jan  4  2026 openmediavault-pending_config_changes
-rwxr-xr-x  1 root root 1317 Jan  4  2026 openmediavault-reboot_required
-rwxr-xr-x  1 root root  349 Aug  4  2023 quota

### /etc/cron.hourly
total 20
drwxr-xr-x  2 root root 4096 May 24 16:21 .
drwxr-xr-x 96 root root 4096 Aug 31 06:20 ..
-rw-r--r--  1 root root  102 Jun 13  2025 .placeholder
-rwxr-xr-x  1 root root 1005 Jan  4  2026 openmediavault-cleanup_sf_snapshots
-rwxr-x---  1 root root  249 Jan 22  2026 openmediavault-flushmailq

### /etc/cron.weekly
total 24
drwxr-xr-x  2 root root 4096 May 24 16:21 .
drwxr-xr-x 96 root root 4096 Aug 31 06:20 ..
-rw-r--r--  1 root root  102 Jun 13  2025 .placeholder
-rwxr-xr-x  1 root root  312 Apr 23  2025 0anacron
-rwxr-xr-x  1 root root 1609 Jan  4  2026 openmediavault-scrub_btrfs
-rwxr-xr-x  1 root root 1693 Jan  4  2026 openmediavault-update-smart-drivedb

### /etc/cron.monthly
total 20
drwxr-xr-x  2 root root 4096 May 24 16:21 .
drwxr-xr-x 96 root root 4096 Aug 31 06:20 ..
-rw-r--r--  1 root root  102 Jun 13  2025 .placeholder
-rwxr-xr-x  1 root root  313 Apr 23  2025 0anacron
-rwxr-xr-x  1 root root 1611 Jan  4  2026 openmediavault-scrub_btrfs

```

## Security-safe SSH summary


### SSH daemon presence and listening state

```text
OpenSSH_10.0p2 Debian-7+deb13u2, OpenSSL 3.5.7 9 Jun 2026
LISTEN 0      128                        0.0.0.0:22         0.0.0.0:*   
LISTEN 0      128                           [::]:22            [::]:*   
```

## Inventory notes

- No environment variables, passwords, tokens, private keys, or container secrets were intentionally collected.
- Commands that were unavailable or denied were skipped.
- The audit is read-only by design.
