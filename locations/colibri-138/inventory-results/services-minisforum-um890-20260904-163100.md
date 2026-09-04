# Homelab Inventory: 192.168.0.12

- **Requested target:** `192.168.0.12:22`
- **SSH user:** `jrenewhite`
- **Collector:** `homelab-inventory.sh 1.0.0`
- **Collected at:** `2026-09-04T16:31:00-06:00`

---

# Host Inventory

- **Audit timestamp:** 2026-09-04T22:31:00+00:00
- **Audit user:** jrenewhite
- **Hostname:** services
- **FQDN:** services

## Management identity


### Primary management interface

```text
primary_interface=enp2s0
primary_mac=58:47:ca:79:08:69
primary_ipv4=192.168.0.12
```

## Identity and operating system


### hostnamectl

```text
 Static hostname: services
       Icon name: computer-desktop
         Chassis: desktop 🖥️
      Machine ID: 81b7bf5df18647a89fa88f9dcd86ed33
         Boot ID: d0cb60b04fba47f193f1d2ac3ba0a1d9
Operating System: Ubuntu 26.04 LTS
          Kernel: Linux 7.0.0-27-generic
    Architecture: x86-64
 Hardware Vendor: Micro Computer _HK_ Tech Limited
  Hardware Model: EliteMini Series
Hardware Version: 1.0
Firmware Version: 1.02
   Firmware Date: Thu 2024-03-28
    Firmware Age: 2y 5month 1w 1d
```

### Operating system

```text
PRETTY_NAME="Ubuntu 26.04 LTS"
NAME="Ubuntu"
VERSION_ID="26.04"
VERSION="26.04 (Resolute Raccoon)"
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
Linux services 7.0.0-27-generic #27-Ubuntu SMP PREEMPT_DYNAMIC Thu Jun 18 19:13:49 UTC 2026 x86_64 GNU/Linux
```

### System manufacturer and model

```text
sys_vendor        : Micro Computer (HK) Tech Limited
product_name      : EliteMini Series
product_version   : 1.0
board_vendor      : Shenzhen Meigao Electronic Equipment Co.,Ltd
board_name        : HPBSD
board_version     : 1.0
bios_vendor       : American Megatrends International, LLC.
bios_version      : 1.02
bios_date         : 03/28/2024
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
Model name:                              AMD Ryzen 9 8945HS w/ Radeon 780M Graphics
CPU family:                              25
Model:                                   117
Thread(s) per core:                      2
Core(s) per socket:                      8
Socket(s):                               1
Stepping:                                2
Frequency boost:                         enabled
CPU(s) scaling MHz:                      39%
CPU max MHz:                             5263.0610
CPU min MHz:                             402.7860
BogoMIPS:                                7985.53
Flags:                                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good amd_lbr_v2 nopl xtopology nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpuid_fault cpb cat_l3 cdp_l3 hw_pstate ssbd mba perfmon_v2 ibrs ibpb stibp ibrs_enhanced vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid cqm rdt_a avx512f avx512dq rdseed adx smap avx512ifma clflushopt clwb avx512cd sha_ni avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local user_shstk avx512_bf16 clzero irperf xsaveerptr rdpru wbnoinvd cppc arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold vgif x2avic v_spec_ctrl vnmi avx512vbmi umip pku ospke avx512_vbmi2 gfni vaes vpclmulqdq avx512_vnni avx512_bitalg avx512_vpopcntdq rdpid overflow_recov succor smca fsrm flush_l1d
Virtualization:                          AMD-V
L1d cache:                               256 KiB (8 instances)
L1i cache:                               256 KiB (8 instances)
L2 cache:                                8 MiB (8 instances)
L3 cache:                                16 MiB (1 instance)
NUMA node(s):                            1
NUMA node0 CPU(s):                       0-15
Vulnerability Gather data sampling:      Not affected
Vulnerability Ghostwrite:                Not affected
Vulnerability Indirect target selection: Not affected
Vulnerability Itlb multihit:             Not affected
Vulnerability L1tf:                      Not affected
Vulnerability Mds:                       Not affected
Vulnerability Meltdown:                  Not affected
Vulnerability Mmio stale data:           Not affected
Vulnerability Old microcode:             Not affected
Vulnerability Reg file data sampling:    Not affected
Vulnerability Retbleed:                  Not affected
Vulnerability Spec rstack overflow:      Mitigation; Safe RET
Vulnerability Spec store bypass:         Mitigation; Speculative Store Bypass disabled via prctl
Vulnerability Spectre v1:                Mitigation; usercopy/swapgs barriers and __user pointer sanitization
Vulnerability Spectre v2:                Mitigation; Enhanced / Automatic IBRS; IBPB conditional; STIBP always-on; PBRSB-eIBRS Not affected; BHI Not affected
Vulnerability Srbds:                     Not affected
Vulnerability Tsa:                       Mitigation; Clear CPU buffers
Vulnerability Tsx async abort:           Not affected
Vulnerability Vmscape:                   Mitigation; IBPB before exit to userspace
```

### Memory

```text
               total        used        free      shared  buff/cache   available
Mem:            45Gi       1.4Gi        41Gi       2.1Mi       3.4Gi        44Gi
Swap:          8.0Gi          0B       8.0Gi

MemTotal:       48049156 kB
MemAvailable:   46534036 kB
SwapTotal:       8388604 kB
SwapFree:        8388604 kB
HugePages_Total:       0
Hugepagesize:       2048 kB
```

### Swap devices

```text
NAME      TYPE SIZE USED PRIO
/swap.img file   8G   0B   -1
```

### PCI devices relevant to GPU, network and storage

```text
pcilib: Error reading /sys/bus/pci/devices/0000:00:08.3/label: Operation not permitted
01:00.0 Non-Volatile memory controller [0108]: Kingston Technology Company, Inc. KC3000/FURY Renegade NVMe SSD [E18] [2646:5013] (rev 01)
	Subsystem: Kingston Technology Company, Inc. KC3000/FURY Renegade NVMe SSD [E18] [2646:5013]
	Kernel driver in use: nvme
	Kernel modules: nvme
02:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8125 2.5GbE Controller [10ec:8125] (rev 05)
	Subsystem: Device [1f4c:b016]
	Kernel driver in use: r8169
	Kernel modules: r8169
03:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8125 2.5GbE Controller [10ec:8125] (rev 05)
	Subsystem: Device [1f4c:b016]
	Kernel driver in use: r8169
	Kernel modules: r8169
04:00.0 Network controller [0280]: Intel Corporation Wi-Fi 6E(802.11ax) AX210/AX1675* 2x2 [Typhoon Peak] [8086:2725] (rev 1a)
	Subsystem: Rivet Networks Killer Wi-Fi 6E AX1675x 160MHz [1a56:1674]
	Kernel driver in use: iwlwifi
	Kernel modules: iwlwifi
05:00.0 Non-Volatile memory controller [0108]: Micron Technology Inc 2550 NVMe SSD (DRAM-less) [1344:5416] (rev 01)
	Subsystem: Micron Technology Inc Device [1344:1100]
	Kernel driver in use: nvme
	Kernel modules: nvme
c6:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] HawkPoint1 [1002:1900] (rev c4)
	Subsystem: Device [1f4c:b016]
	Kernel driver in use: amdgpu
	Kernel modules: amdgpu
c6:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Radeon High Definition Audio Controller [1002:1640]
--
c6:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device [1022:15b9]
	Subsystem: Device [1f4c:b016]
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci
c6:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device [1022:15ba]
	Subsystem: Device [1f4c:b016]
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci
c6:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD] Audio Coprocessor [1022:15e2] (rev 63)
--
c8:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device [1022:15c0]
	Subsystem: Device [1f4c:b016]
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci
c8:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device [1022:15c1]
	Subsystem: Device [1f4c:b016]
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci
c8:00.5 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Pink Sardine USB4/Thunderbolt NHI controller #1 [1022:1668]
	Subsystem: Device [1f4c:b016]
	Kernel driver in use: thunderbolt
	Kernel modules: thunderbolt
c8:00.6 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Pink Sardine USB4/Thunderbolt NHI controller #2 [1022:1669]
	Subsystem: Device [1f4c:b016]
	Kernel driver in use: thunderbolt
	Kernel modules: thunderbolt
```

### USB devices

```text
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 2109:2822 VIA Labs, Inc. USB2.0 Hub             
Bus 001 Device 003: ID 2109:2822 VIA Labs, Inc. USB2.0 Hub             
Bus 001 Device 004: ID 8087:0032 Intel Corp. AX210 Bluetooth
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 002: ID 2109:0822 VIA Labs, Inc. USB3.1 Hub             
Bus 002 Device 003: ID 2109:0822 VIA Labs, Inc. USB3.1 Hub             
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
```

## Networking


### Interfaces and addresses

```text
lo               UNKNOWN        127.0.0.1/8 ::1/128 
enp2s0           UP             192.168.0.12/24 metric 100 fe80::5a47:caff:fe79:869/64 
enp3s0           DOWN           
wlp4s0           DOWN           
docker0          DOWN           172.17.0.1/16 
br-77f8d757459c  UP             172.19.0.1/16 fe80::b871:c1ff:fe70:1d09/64 
br-bc9ce27da8fb  UP             172.18.0.1/16 fe80::80fa:c6ff:fed1:e03a/64 
veth48e5f57@if2  UP             fe80::709c:26ff:fe55:3418/64 
vethec63f68@if2  UP             fe80::b806:abff:fe28:3b91/64 
tailscale0       UNKNOWN        100.112.33.91/32 fd7a:115c:a1e0::1c32:215b/128 fe80::3ceb:2872:a592:7e26/64 
```

### Link-layer details

```text
lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP> 
enp2s0           UP             58:47:ca:79:08:69 <BROADCAST,MULTICAST,UP,LOWER_UP> 
enp3s0           DOWN           58:47:ca:79:08:68 <NO-CARRIER,BROADCAST,MULTICAST,UP> 
wlp4s0           DOWN           10:91:d1:e8:ed:74 <NO-CARRIER,BROADCAST,MULTICAST,UP> 
docker0          DOWN           f6:2f:e9:2a:2d:cc <NO-CARRIER,BROADCAST,MULTICAST,UP> 
br-77f8d757459c  UP             ba:71:c1:70:1d:09 <BROADCAST,MULTICAST,UP,LOWER_UP> 
br-bc9ce27da8fb  UP             82:fa:c6:d1:e0:3a <BROADCAST,MULTICAST,UP,LOWER_UP> 
veth48e5f57@if2  UP             72:9c:26:55:34:18 <BROADCAST,MULTICAST,UP,LOWER_UP> 
vethec63f68@if2  UP             ba:06:ab:28:3b:91 <BROADCAST,MULTICAST,UP,LOWER_UP> 
tailscale0       UNKNOWN        <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> 
```

### Routing table

```text
default via 192.168.0.1 dev enp2s0 proto dhcp src 192.168.0.12 metric 100 
1.1.1.1 via 192.168.0.1 dev enp2s0 proto dhcp src 192.168.0.12 metric 100 
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown 
172.18.0.0/16 dev br-bc9ce27da8fb proto kernel scope link src 172.18.0.1 
172.19.0.0/16 dev br-77f8d757459c proto kernel scope link src 172.19.0.1 
192.168.0.0/24 dev enp2s0 proto kernel scope link src 192.168.0.12 metric 100 
192.168.0.1 dev enp2s0 proto dhcp scope link src 192.168.0.12 metric 100 
192.168.0.14 dev enp2s0 proto dhcp scope link src 192.168.0.12 metric 100 
```

### Neighbour table

```text
172.19.0.2 dev br-77f8d757459c lladdr 8e:f6:e7:d7:3d:7c REACHABLE 
192.168.0.37 dev enp2s0 lladdr 98:25:4a:4f:2b:f0 STALE 
172.18.0.2 dev br-bc9ce27da8fb lladdr e2:fc:13:27:1b:2b STALE 
192.168.0.14 dev enp2s0 lladdr c0:74:2b:fc:59:86 STALE 
192.168.0.38 dev enp2s0 lladdr 98:25:4a:4e:ee:50 STALE 
192.168.0.10 dev enp2s0 INCOMPLETE 
192.168.0.1 dev enp2s0 lladdr cc:ba:bd:d2:21:98 DELAY 
192.168.0.206 dev enp2s0 lladdr 40:1a:58:4a:d3:68 DELAY 
192.168.0.11 dev enp2s0 lladdr c8:ff:bf:05:f4:46 STALE 
192.168.0.36 dev enp2s0 lladdr 98:25:4a:4f:2b:1c STALE 
192.168.0.203 dev enp2s0 lladdr c0:e5:da:7c:b2:2a STALE 
```

### Interface link speeds

```text
### enp2s0
	Speed: 2500Mb/s
	Duplex: Full
	Port: Twisted Pair
	Link detected: yes

### enp3s0
	Speed: Unknown!
	Duplex: Unknown! (255)
	Port: Twisted Pair
	Link detected: no

### wlp4s0
	Link detected: no

### docker0
	Speed: Unknown!
	Duplex: Unknown! (255)
	Port: Other
	Link detected: no

### br-77f8d757459c
	Speed: 10000Mb/s
	Duplex: Unknown! (255)
	Port: Other
	Link detected: yes

### br-bc9ce27da8fb
	Speed: 10000Mb/s
	Duplex: Unknown! (255)
	Port: Other
	Link detected: yes

### veth48e5f57
	Speed: 10000Mb/s
	Duplex: Full
	Port: Twisted Pair
	Link detected: yes

### vethec63f68
	Speed: 10000Mb/s
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
         Protocols: -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
  resolv.conf mode: stub

Link 2 (enp2s0)
    Current Scopes: DNS
         Protocols: +DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
Current DNS Server: 1.1.1.1
       DNS Servers: 192.168.0.14 1.1.1.1
     Default Route: yes

Link 3 (enp3s0)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
     Default Route: no

Link 4 (wlp4s0)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
     Default Route: no

Link 6 (docker0)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
     Default Route: no

Link 7 (br-77f8d757459c)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
     Default Route: no

Link 8 (br-bc9ce27da8fb)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
     Default Route: no

Link 9 (veth48e5f57)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
     Default Route: no

Link 10 (vethec63f68)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
     Default Route: no

Link 11 (tailscale0)
    Current Scopes: DNS
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
Current DNS Server: 100.100.100.100
       DNS Servers: 100.100.100.100 fd7a:115c:a1e0::53
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
100.112.33.91    services                          jrenewhite@  linux    -                            
100.112.160.103  ai-gpu                            jrenewhite@  linux    -                            
100.118.34.123   ai-igpu-mty.tail1fbcd5.ts.net     alvalo96@    linux    offline, last seen 14d ago   
100.107.33.127   bd795m                            jrenewhite@  linux    offline, last seen 4d ago    
100.90.73.117    gl-a1300                          jrenewhite@  linux    offline, last seen 1d ago    
100.83.102.8     google-pixel-8-pro                jrenewhite@  android  offline, last seen 285d ago  
100.103.54.72    hp-envy-x360                      jrenewhite@  linux    offline, last seen 2d ago    
100.90.244.77    macbook-air-m4                    jrenewhite@  macOS    offline, last seen 11m ago   
100.122.233.19   management-mty.tail1fbcd5.ts.net  alvalo96@    linux    offline, last seen 14d ago   
100.70.182.44    management                        jrenewhite@  linux    offline, last seen 44d ago   
100.86.226.70    nas-mty.tail1fbcd5.ts.net         alvalo96@    linux    offline, last seen 14d ago   
100.101.105.1    nas                               jrenewhite@  linux    -                            
100.121.197.90   orangepi5-a                       jrenewhite@  linux    -                            
100.103.15.69    orangepi5-b                       jrenewhite@  linux    -                            
100.93.82.30     orangepi5-max                     jrenewhite@  linux    -                            
100.94.193.53    orangepi5-ultra                   jrenewhite@  linux    -                            
100.104.123.103  peru-ai-gpu                       jrenewhite@  linux    -                            
100.81.168.75    peru-nas                          jrenewhite@  linux    -                            
100.68.148.26    peru-rpi4-a                       jrenewhite@  linux    -                            
100.121.97.111   peru-rpi4-b                       jrenewhite@  linux    -                            
100.68.9.59      peru-rpi5-a                       jrenewhite@  linux    -                            
100.74.71.106    peru-rpi5-b                       jrenewhite@  linux    offline, last seen 48d ago   
100.78.74.100    peru-services                     jrenewhite@  linux    -                            
```

### Tailscale addresses

```text
100.112.33.91
fd7a:115c:a1e0::1c32:215b
```

## Storage


### Block devices

```text
NAME        PATH           TYPE   SIZE MODEL                  SERIAL           TRAN   ROTA FSTYPE FSVER LABEL UUID                                 MOUNTPOINTS FSAVAIL FSUSE%
nvme0n1     /dev/nvme0n1   disk 953.9G KINGSTON SKC3000S1024G 50026B7686F1D723 nvme      0                                                                             
└─nvme0n1p1 /dev/nvme0n1p1 part 953.9G                                         nvme      0 ext4   1.0         a37bc810-f656-47c1-97e5-97d3d0aabdb6 /storage     885.7G     0%
nvme1n1     /dev/nvme1n1   disk 465.8G CT500P3SSD8            24444C33A266     nvme      0                                                                             
├─nvme1n1p1 /dev/nvme1n1p1 part     1G                                         nvme      0 vfat   FAT32       4BB7-BC71                            /boot/efi        1G     1%
└─nvme1n1p2 /dev/nvme1n1p2 part 464.7G                                         nvme      0 ext4   1.0         a9eec9c8-856f-4749-9570-ed0a9193d052 /            420.2G     3%
```

### Filesystem identifiers

```text
/dev/nvme1n1p2: UUID="a9eec9c8-856f-4749-9570-ed0a9193d052" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="124a6998-9ef0-44c8-8fb4-7e4e6942b9ab"
/dev/nvme1n1p1: UUID="4BB7-BC71" BLOCK_SIZE="512" TYPE="vfat" PARTUUID="c708e174-1275-4efb-80ee-1eed211e77c3"
```

### Mounted filesystems

```text
TARGET                                                                                              SOURCE                  FSTYPE      OPTIONS
/                                                                                                   /dev/nvme1n1p2          ext4        rw,relatime
├─/run                                                                                              tmpfs                   tmpfs       rw,nosuid,nodev,size=9609832k,nr_inodes=819200,mode=755,inode64
│ ├─/run/credentials/systemd-resolved.service                                                       none                    tmpfs       ro,nosuid,nodev,noexec,relatime,nosymfollow,size=1024k,nr_inodes=1024,mode=700,inode64,noswap
│ ├─/run/user/1000                                                                                  tmpfs                   tmpfs       rw,nosuid,nodev,relatime,size=4804912k,nr_inodes=1201228,mode=700,uid=1000,gid=1000,inode64
│ ├─/run/rpc_pipefs                                                                                 sunrpc                  rpc_pipefs  rw,relatime
│ ├─/run/credentials/systemd-networkd.service                                                       none                    tmpfs       ro,nosuid,nodev,noexec,relatime,nosymfollow,size=1024k,nr_inodes=1024,mode=700,inode64,noswap
│ ├─/run/credentials/getty@tty1.service                                                             none                    tmpfs       ro,nosuid,nodev,noexec,relatime,nosymfollow,size=1024k,nr_inodes=1024,mode=700,inode64,noswap
│ ├─/run/docker/netns/default                                                                       nsfs[net:[4026531833]]  nsfs        rw
│ ├─/run/docker/netns/3327c53390e3                                                                  nsfs[net:[4026533084]]  nsfs        rw
│ ├─/run/docker/netns/6bcd51ed5de2                                                                  nsfs[net:[4026533231]]  nsfs        rw
│ └─/run/credentials/systemd-journald.service                                                       none                    tmpfs       ro,nosuid,nodev,noexec,relatime,nosymfollow,size=1024k,nr_inodes=1024,mode=700,inode64,noswap
├─/dev                                                                                              devtmpfs                devtmpfs    rw,nosuid,size=23916852k,nr_inodes=5979213,mode=755,inode64
│ ├─/dev/hugepages                                                                                  hugetlbfs               hugetlbfs   rw,nosuid,nodev,relatime,pagesize=2M
│ ├─/dev/mqueue                                                                                     mqueue                  mqueue      rw,nosuid,nodev,noexec,relatime
│ ├─/dev/shm                                                                                        tmpfs                   tmpfs       rw,nosuid,nodev,inode64,usrquota
│ └─/dev/pts                                                                                        devpts                  devpts      rw,nosuid,noexec,relatime,gid=5,mode=600,ptmxmode=000
├─/sys                                                                                              sysfs                   sysfs       rw,nosuid,nodev,noexec,relatime
│ ├─/sys/kernel/debug                                                                               debugfs                 debugfs     rw,nosuid,nodev,noexec,relatime
│ ├─/sys/kernel/tracing                                                                             tracefs                 tracefs     rw,nosuid,nodev,noexec,relatime
│ ├─/sys/fs/fuse/connections                                                                        fusectl                 fusectl     rw,nosuid,nodev,noexec,relatime
│ ├─/sys/kernel/security                                                                            securityfs              securityfs  rw,nosuid,nodev,noexec,relatime
│ ├─/sys/fs/cgroup                                                                                  cgroup2                 cgroup2     rw,nosuid,nodev,noexec,relatime,nsdelegate,memory_recursiveprot,memory_hugetlb_accounting
│ ├─/sys/fs/pstore                                                                                  none                    pstore      rw,nosuid,nodev,noexec,relatime
│ ├─/sys/firmware/efi/efivars                                                                       efivarfs                efivarfs    rw,nosuid,nodev,noexec,relatime
│ ├─/sys/fs/bpf                                                                                     bpf                     bpf         rw,nosuid,nodev,noexec,relatime,mode=700
│ └─/sys/kernel/config                                                                              configfs                configfs    rw,nosuid,nodev,noexec,relatime
├─/tmp                                                                                              tmpfs                   tmpfs       rw,nosuid,nodev,size=24024580k,nr_inodes=1048576,inode64,usrquota
├─/proc                                                                                             proc                    proc        rw,nosuid,nodev,noexec,relatime
│ └─/proc/sys/fs/binfmt_misc                                                                        systemd-1               autofs      rw,relatime,fd=34,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=8058
│   └─/proc/sys/fs/binfmt_misc                                                                      binfmt_misc             binfmt_misc rw,nosuid,nodev,noexec,relatime
├─/storage                                                                                          /dev/nvme0n1p1          ext4        rw,relatime
├─/boot/efi                                                                                         /dev/nvme1n1p1          vfat        rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro
├─/srv/media                                                                                        192.168.0.11:/srv/media nfs4        rw,relatime,vers=4.2,rsize=1048576,wsize=1048576,namlen=255,hard,fatal_neterrors=none,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=192.168.0.12,local_lock=none,addr=192.168.0.11
├─/srv/docs                                                                                         192.168.0.11:/srv/docs  nfs4        rw,relatime,vers=4.2,rsize=1048576,wsize=1048576,namlen=255,hard,fatal_neterrors=none,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=192.168.0.12,local_lock=none,addr=192.168.0.11
├─/var/lib/docker/rootfs/overlayfs/5c409506ee6c4d5285257bb6aa97088d70b4516c8f2e787a977ce70d0463d513 overlay                 overlay     rw,relatime,lowerdir=/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/18/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/17/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/16/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/15/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/14/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/13/fs,upperdir=/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/19/fs,workdir=/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/19/work,nouserxattr
├─/var/lib/docker/rootfs/overlayfs/c380fa7142343a63a85bdbc9494f8a2eaacb25a80abe1bd435af9a334d1040d2 overlay                 overlay     rw,relatime,lowerdir=/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/38/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/37/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/36/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/35/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/34/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/33/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/32/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/31/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/30/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/29/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/28/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/27/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/26/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/25/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/24/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/23/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/22/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/21/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/20/fs,upperdir=/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/39/fs,workdir=/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/39/work,nouserxattr
└─/var/lib/docker/rootfs/overlayfs/dbc4a61f829c6cb635d1db37a5aa592ff3cfe09738409883f05b56c28bb6dfb7 overlay                 overlay     rw,relatime,lowerdir=/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/11/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/10/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/9/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/8/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/7/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/6/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/5/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/4/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/3/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/2/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/1/fs,upperdir=/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/12/fs,workdir=/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/12/work,nouserxattr
```

### Filesystem usage

```text
Filesystem              Type      Size  Used Avail Use% Mounted on
tmpfs                   tmpfs     9.2G  2.1M  9.2G   1% /run
/dev/nvme1n1p2          ext4      457G   13G  421G   3% /
tmpfs                   tmpfs      23G     0   23G   0% /dev/shm
efivarfs                efivarfs  128K   45K   79K  37% /sys/firmware/efi/efivars
tmpfs                   tmpfs      23G     0   23G   0% /tmp
/dev/nvme0n1p1          ext4      938G  4.5G  886G   1% /storage
/dev/nvme1n1p1          vfat      1.1G  6.4M  1.1G   1% /boot/efi
192.168.0.11:/srv/media nfs4       12T  214G   12T   2% /srv/media
192.168.0.11:/srv/docs  nfs4      3.7T  8.0M  3.6T   1% /srv/docs
none                    tmpfs     1.0M     0  1.0M   0% /run/credentials/getty@tty1.service
none                    tmpfs     1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
none                    tmpfs     1.0M     0  1.0M   0% /run/credentials/systemd-resolved.service
none                    tmpfs     1.0M     0  1.0M   0% /run/credentials/systemd-networkd.service
tmpfs                   tmpfs     4.6G  8.0K  4.6G   1% /run/user/1000
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
TARGET     SOURCE                  FSTYPE OPTIONS
/srv/media 192.168.0.11:/srv/media nfs4   rw,relatime,vers=4.2,rsize=1048576,wsize=1048576,namlen=255,hard,fatal_neterrors=none,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=192.168.0.12,local_lock=none,addr=192.168.0.11
/srv/docs  192.168.0.11:/srv/docs  nfs4   rw,relatime,vers=4.2,rsize=1048576,wsize=1048576,namlen=255,hard,fatal_neterrors=none,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=192.168.0.12,local_lock=none,addr=192.168.0.11
```

### NFS exports

```text
No readable NFS export configuration detected
```

### MergerFS

```text
```

## Containers and virtualization


### Docker version

```text
Client:
 Version:           29.1.3
 API version:       1.52
 Go version:        go1.24.13
 Git commit:        29.1.3-0ubuntu4.1
 Built:             Wed Apr 29 16:40:20 2026
 OS/Arch:           linux/amd64
 Context:           default

Server:
 Engine:
  Version:          29.1.3
  API version:      1.52 (minimum version 1.44)
  Go version:       go1.24.13
  Git commit:       29.1.3-0ubuntu4.1
  Built:            Wed Apr 29 16:40:20 2026
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          2.2.2
  GitCommit:        
 runc:
  Version:          1.4.0-0ubuntu1
  GitCommit:        
 docker-init:
  Version:          0.19.0
  GitCommit:        
```

### Docker containers

```text
NAMES         IMAGE                                 STATUS                 PORTS
cloudflared   cloudflare/cloudflared:latest         Up 6 weeks             
caddy         caddy:2-alpine                        Up 6 weeks             
homepage      ghcr.io/gethomepage/homepage:latest   Up 6 weeks (healthy)   127.0.0.1:8080->3000/tcp
```

### Docker container mounts

```text
### cloudflared
bind: /opt/stacks/cloudflared/config -> /etc/cloudflared (rw=false)
bind: /opt/colibri-secrets/cloudflared -> /opt/colibri-secrets/cloudflared (rw=false)


### caddy
bind: /opt/stacks/caddy/config -> /config (rw=true)
bind: /opt/stacks/caddy/data -> /data (rw=true)
bind: /opt/stacks/caddy/Caddyfile -> /etc/caddy/Caddyfile (rw=false)
bind: /opt/stacks/caddy/sites -> /etc/caddy/sites (rw=false)
bind: /opt/stacks/caddy/snippets -> /etc/caddy/snippets (rw=false)


### homepage
bind: /opt/stacks/homepage/config -> /app/config (rw=true)


```

### Docker images

```text
WARNING: This output is designed for human readability. For machine-readable output, please use --format.
IMAGE                                 ID             DISK USAGE   CONTENT SIZE   EXTRA
caddy:2-alpine                        5f5c8640aae0       88.7MB         24.3MB   U    
cloudflare/cloudflared:latest         4f6655284ab3       96.1MB         28.5MB   U    
ghcr.io/gethomepage/homepage:latest   a0b71c8e7572        371MB         84.5MB   U    
```

### Docker networks

```text
NETWORK ID     NAME                          DRIVER    SCOPE
26215480b144   bridge                        bridge    local
77f8d757459c   colibri-cloudflared_default   bridge    local
bc9ce27da8fb   homepage_default              bridge    local
7389da4e1c26   host                          host      local
b25ae01b5360   none                          null      local
```

### Docker volumes

```text
DRIVER    VOLUME NAME
```

### Docker disk usage

```text
TYPE            TOTAL     ACTIVE    SIZE      RECLAIMABLE
Images          3         3         555.9MB   555.9MB (100%)
Containers      3         3         61.44kB   0B (0%)
Local Volumes   0         0         0B        0B
Build Cache     0         0         0B        0B
```

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
docker             /usr/bin/docker                     Docker version 29.1.3, build 29.1.3-0ubuntu4.1 
containerd         /usr/bin/containerd                 containerd github.com/containerd/containerd/v2 2.2.2  
ctr                /usr/bin/ctr                        ctr github.com/containerd/containerd/v2 2.2.2 
tailscale          /usr/bin/tailscale                  1.102.2   tailscale commit: 6cac918179d4d673bfebe2fc74f81183ddd73fea 
mount.nfs          /usr/sbin/mount.nfs                 mount.nfs: (linux nfs-utils 2.8.5) 
mdadm              /usr/sbin/mdadm                     
btrfs              /usr/bin/btrfs                      btrfs-progs v6.17.1 -EXPERIMENTAL -INJECT -STATIC +LZO +ZSTD +UDEV +FSVERITY +ZONED CRYPTO=builtin 
python3            /usr/bin/python3                    Python 3.14.4 
git                /usr/bin/git                        git version 2.53.0 
rsync              /usr/bin/rsync                      rsync  version 3.4.1  protocol version 32 Copyright (C) 1996-2025 by Andrew Tridgell, Wayne Davison, and others. 
upsc               /usr/bin/upsc                       Network UPS Tools upsc 2.8.4 release  
```

### Running systemd services

```text
  bolt.service                loaded active running Thunderbolt system service
  chrony.service              loaded active running chrony, an NTP client/server
  containerd.service          loaded active running containerd container runtime
  cron.service                loaded active running Regular background program processing daemon
  dbus.service                loaded active running D-Bus System Message Bus
  docker.service              loaded active running Docker Application Container Engine
  fwupd.service               loaded active running Firmware update daemon
  getty@tty1.service          loaded active running Getty on tty1
  ModemManager.service        loaded active running Modem Manager
  multipathd.service          loaded active running Device-Mapper Multipath Device Controller
  networkd-dispatcher.service loaded active running Dispatcher daemon for systemd-networkd
  nut-monitor.service         loaded active running Network UPS Tools - power device monitor and shutdown controller
  polkit.service              loaded active running Authorization Manager
  rpcbind.service             loaded active running RPC bind portmap service
  rsyslog.service             loaded active running System Logging Service
  snap.lxd.daemon.service     loaded active running Service for snap application lxd.daemon
  snapd.service               loaded active running Snap Daemon
  ssh.service                 loaded active running OpenBSD Secure Shell server
  systemd-journald.service    loaded active running Journal Service
  systemd-logind.service      loaded active running User Login Management
  systemd-networkd.service    loaded active running Network Management
  systemd-resolved.service    loaded active running Network Name Resolution
  systemd-udevd.service       loaded active running Rule-based Manager for Device Events and Files
  tailscaled.service          loaded active running Tailscale node agent
  udisks2.service             loaded active running Disk Manager
  unattended-upgrades.service loaded active running Unattended Upgrades Shutdown
  upower.service              loaded active running Daemon for power management
  user@1000.service           loaded active running User Manager for UID 1000
  wpa_supplicant.service      loaded active running WPA supplicant
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
containerd.service                     enabled enabled
cron.service                           enabled enabled
dmesg.service                          enabled enabled
docker.service                         enabled enabled
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
nut-monitor.service                    enabled enabled
open-iscsi.service                     enabled enabled
open-vm-tools.service                  enabled enabled
pollinate.service                      enabled enabled
rpcbind.service                        enabled enabled
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
tailscaled.service                     enabled enabled
thermald.service                       enabled enabled
ua-reboot-cmds.service                 enabled enabled
ubuntu-advantage.service               enabled enabled
ubuntu-fan.service                     enabled enabled
udisks2.service                        enabled enabled
ufw.service                            enabled enabled
unattended-upgrades.service            enabled enabled
vgauth.service                         enabled enabled
wpa_supplicant.service                 enabled enabled
```

### Systemd timers

```text
NEXT                            LEFT LAST                              PASSED UNIT                           ACTIVATES
Fri 2026-09-04 22:40:00 UTC     8min Fri 2026-09-04 22:30:03 UTC 1min 48s ago sysstat-collect.timer          sysstat-collect.service
Fri 2026-09-04 23:45:31 UTC 1h 13min Fri 2026-09-04 22:20:40 UTC    11min ago fwupd-refresh.timer            fwupd-refresh.service
Sat 2026-09-05 00:00:00 UTC 1h 28min Fri 2026-09-04 00:00:27 UTC      22h ago dpkg-db-backup.timer           dpkg-db-backup.service
Sat 2026-09-05 00:00:00 UTC 1h 28min Fri 2026-09-04 00:00:27 UTC      22h ago sysstat-rotate.timer           sysstat-rotate.service
Sat 2026-09-05 00:07:00 UTC 1h 35min Fri 2026-09-04 00:07:03 UTC      22h ago sysstat-summary.timer          sysstat-summary.service
Sat 2026-09-05 00:19:52 UTC 1h 48min Fri 2026-09-04 21:01:40 UTC 1h 30min ago motd-news.timer                motd-news.service
Sat 2026-09-05 00:44:37 UTC 2h 12min Fri 2026-09-04 00:40:39 UTC      21h ago logrotate.timer                logrotate.service
Sat 2026-09-05 00:47:12 UTC 2h 15min Fri 2026-09-04 06:11:14 UTC      16h ago man-db.timer                   man-db.service
Sat 2026-09-05 06:31:41 UTC       7h Fri 2026-09-04 06:10:36 UTC      16h ago apt-daily-upgrade.timer        apt-daily-upgrade.service
Sat 2026-09-05 20:06:52 UTC      21h Fri 2026-09-04 20:06:52 UTC 2h 24min ago update-notifier-download.timer update-notifier-download.service
Sat 2026-09-05 20:16:52 UTC      21h Fri 2026-09-04 20:16:52 UTC 2h 14min ago systemd-tmpfiles-clean.timer   systemd-tmpfiles-clean.service
Sun 2026-09-06 03:10:14 UTC 1 day 4h Sun 2026-08-30 03:10:40 UTC   5 days ago xfs_scrub_all.timer            xfs_scrub_all.service
Sun 2026-09-06 03:10:50 UTC 1 day 4h Sun 2026-08-30 03:10:17 UTC   5 days ago e2scrub_all.timer              e2scrub_all.service
Mon 2026-09-07 01:37:23 UTC   2 days Mon 2026-08-31 00:25:11 UTC   4 days ago fstrim.timer                   fstrim.service
Mon 2026-09-07 19:13:03 UTC   2 days Tue 2026-09-01 06:42:11 UTC   3 days ago update-notifier-motd.timer     update-notifier-motd.service
-                                  - -                                      - apport-autoreport.timer        apport-autoreport.service
-                                  - Fri 2026-09-04 22:31:41 UTC       9s ago apt-daily.timer                apt-daily.service
-                                  - -                                      - snapd.snap-repair.timer        snapd.snap-repair.service
-                                  - -                                      - ua-timer.timer                 ua-timer.service

19 timers listed.
```

### Failed systemd units

```text
  UNIT                                 LOAD   ACTIVE SUB    DESCRIPTION
● systemd-networkd-wait-online.service loaded failed failed Wait for Network to be Online

Legend: LOAD   → Reflects whether the unit definition was properly loaded.
        ACTIVE → The high-level unit activation state, i.e. generalization of SUB.
        SUB    → The low-level unit activation state, values depend on unit type.

1 loaded units listed.
```

### Listening TCP/UDP ports

```text
Netid State  Recv-Q Send-Q               Local Address:Port  Peer Address:PortProcess
udp   UNCONN 0      0                       127.0.0.54:53         0.0.0.0:*          
udp   UNCONN 0      0                    127.0.0.53%lo:53         0.0.0.0:*          
udp   UNCONN 0      0              192.168.0.12%enp2s0:68         0.0.0.0:*          
udp   UNCONN 0      0                          0.0.0.0:111        0.0.0.0:*          
udp   UNCONN 0      0                        127.0.0.1:323        0.0.0.0:*          
udp   UNCONN 0      0                          0.0.0.0:41641      0.0.0.0:*          
udp   UNCONN 0      0                             [::]:111           [::]:*          
udp   UNCONN 0      0                            [::1]:323           [::]:*          
udp   UNCONN 0      0                             [::]:41641         [::]:*          
tcp   LISTEN 0      4096                       0.0.0.0:22         0.0.0.0:*          
tcp   LISTEN 0      4096                       0.0.0.0:111        0.0.0.0:*          
tcp   LISTEN 0      4096                 127.0.0.53%lo:53         0.0.0.0:*          
tcp   LISTEN 0      4096                 100.112.33.91:44253      0.0.0.0:*          
tcp   LISTEN 0      4096                    127.0.0.54:53         0.0.0.0:*          
tcp   LISTEN 0      4096                     127.0.0.1:45471      0.0.0.0:*          
tcp   LISTEN 0      4096                     127.0.0.1:8080       0.0.0.0:*          
tcp   LISTEN 0      4096                          [::]:22            [::]:*          
tcp   LISTEN 0      4096                             *:80               *:*          
tcp   LISTEN 0      4096                          [::]:111           [::]:*          
tcp   LISTEN 0      4096   [fd7a:115c:a1e0::1c32:215b]:62835         [::]:*          
```

## Packages


### Package-manager summary

```text
Package manager: dpkg
Installed packages: 762
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
total 24
drwxr-xr-x   2 root root  4096 Apr 20 18:22 .
drwxr-xr-x 122 root root 12288 Sep  4 22:31 ..
-rw-r--r--   1 root root   102 Nov  5  2025 .placeholder
-rw-r--r--   1 root root   188 Feb 13  2026 e2scrub_all

### /etc/cron.daily
total 40
drwxr-xr-x   2 root root  4096 Apr 20 18:22 .
drwxr-xr-x 122 root root 12288 Sep  4 22:31 ..
-rw-r--r--   1 root root   102 Nov  5  2025 .placeholder
-rwxr-xr-x   1 root root   376 Apr 13 11:51 apport
-rwxr-xr-x   1 root root  1478 Apr  7 09:02 apt-compat
-rwxr-xr-x   1 root root   123 Dec 16  2025 dpkg
-rwxr-xr-x   1 root root   377 Dec  6  2025 logrotate
-rwxr-xr-x   1 root root  1395 May  2  2025 man-db

### /etc/cron.hourly
total 20
drwxr-xr-x   2 root root  4096 Apr 20 18:22 .
drwxr-xr-x 122 root root 12288 Sep  4 22:31 ..
-rw-r--r--   1 root root   102 Nov  5  2025 .placeholder

### /etc/cron.weekly
total 24
drwxr-xr-x   2 root root  4096 Apr 20 18:22 .
drwxr-xr-x 122 root root 12288 Sep  4 22:31 ..
-rw-r--r--   1 root root   102 Nov  5  2025 .placeholder
-rwxr-xr-x   1 root root  1055 May  2  2025 man-db

### /etc/cron.monthly
total 20
drwxr-xr-x   2 root root  4096 Apr 20 18:22 .
drwxr-xr-x 122 root root 12288 Sep  4 22:31 ..
-rw-r--r--   1 root root   102 Nov  5  2025 .placeholder

```

## Security-safe SSH summary


### SSH daemon presence and listening state

```text
OpenSSH_10.2p1 Ubuntu-2ubuntu3.6, OpenSSL 3.5.5 27 Jan 2026
LISTEN 0      4096                       0.0.0.0:22         0.0.0.0:*   
LISTEN 0      4096                          [::]:22            [::]:*   
```

## Inventory notes

- No environment variables, passwords, tokens, private keys, or container secrets were intentionally collected.
- Commands that were unavailable or denied were skipped.
- The audit is read-only by design.
