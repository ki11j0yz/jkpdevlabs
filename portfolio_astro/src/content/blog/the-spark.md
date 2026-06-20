---
title: "The Spark: From The Fifth Estate to the Stack"
description: "How a cinematic reveal of information warfare launched a journey into the vertical stack."
pubDate: "2026-06-19"
heroImage: "/images/blog/blog_photo1.png"
tags: ["origin", "philosophy", "security"]
---

### The Spark (in a nut[shell]): A Cinematic Awakening Becomes a Homelab

My obsession didn't start with a "Hello World" program. It started with a movie.
Not a tutorial. Not a bootcamp. Not a mentor pulling me aside and pointing me toward a career. A movie about information warfare.

Watching The Fifth Estate, I wasn't just captivated by the story. My captivation was the shadow world living underneath the Internet itself. A world where power isn't measured in dollars or titles — it's measured in access and data. In the quiet, the invisible flow of data moves through systems that most people never think about and fewer still understand. Something shifted in me during that film, an obsession grew.

I wanted to learn how to read and manipulate systems. How to move through networks. How to build things that were airtight and, more importantly, understand exactly why they weren't.
The problem was I didn't know what any of that was called, or where to start - by day I’m just a Medical Assistant. 

So I did what any self-respecting person does when they want to learn something the internet wasn't designed to teach them easily — I started digging. A cheap, used Lenovo laptop. A tool called aircrack-ng. A handful of online forums where people asked questions that made you feel like you'd stumbled into a back room you weren't supposed to find. I learned how to scan networks. How to read what came back. How to pop a shell and understand what I was actually looking at when I did.

Then came ***Python***. And that's when something clicked that I didn't expect.

I fell in love — not just with hacking, but with the act of writing code itself. The logic of it. The way a well-structured script feels like an argument that can't be refuted. Python led me to HTML, CSS, and JavaScript — not because someone told me to learn them, but because I had a theory: that understanding how the web was built would make me better at understanding how it breaks. I was right, but I got more than I bargained for.

What I found in web development was a different kind of puzzle — one where you don't just solve the problem, you have to get creative and build the pieces first. You have to imagine the shape of the solution before any of the components exist. Then the best part, your work comes to life on the screen before you, interactive, shiny and new. It felt electric. 
That feeling — that specific, electric feeling of a thing working that you made from nothing — hasn't gotten old. Not to mention I also realized how beneficial this would be to adapt to network security, possibly writing my own scripts to deploy.

The Descent: Hardware Scavenging
Most modern web developers start in the cloud. I started in a pile of e-waste.
There's a philosophy behind that — not poverty, not necessity, but principle. I believe if you truly want to understand how something works, you don't start at the surface. You start at the foundation. If you're building for the web, sometimes the most fundamental question isn't what you're building — it's where it lives. How do platforms like WordPress, Wix, or SquareSpace serve millions of requests a day? Not with magic. With iron. Physical machines humming in climate-controlled rooms, stacked floor to ceiling in data centers you'll never see the inside of. The vertical, as they say.

**I decided I wanted to see the inside.**

Luckily, I was able to acquire a small fleet of HP EliteDesk units — G1s and G2s — hardware the corporate world had quietly retired and written off. It was surplus, scrap. To me they were raw material, malleable for functionality. I added an old TRENDnet 16-port fast ethernet switch, a spool of cabling, miscellaneous brackets and rails and adapters, and started assembling something that had no name yet but felt like it was becoming something real. A small rack. A private infrastructure. A machine room in miniature.

A friend of mine was cleaning out his storage closet and he had all these computers just gathering dust. He was gracious enough to part ways with them for free so I scored in every sense of the word in my opinion - I don’t need much to run a website, so I started researching how to host on bare metal.
But first, I had to build it.

The Harvesting Phase: The Nuts and Bolts
Before anything could be placed, it had to be audited.
I went unit by unit — pulling specs, cross-referencing generations, benchmarking what was worth keeping and what was worth cannibalizing for parts. A few hours of focused looting later, the numbers came into focus: 44GB of DDR3 RAM consolidated across the fleet, 3.6TB of storage spanning multiple drive technologies and form factors — spinning rust, solid state, the whole spectrum.

I knew I wanted a 3-node cluster with a back-up server. I would need storage, RAM, wires, and power cords. I would also need to utilize 4 cases as well. Once these towers were built, they’d need to be referred to as something more than their IP addresses - which is what I have them labeled as physically. They would need… codenames. Something you understand when I refer to a specific machine. I thought about all subjects that interest me, one of which is DC Comics. I like their heroes and villains better than Marvel and I like their stories more than Marvel.

<br>

**The Crown Jewel: Codename - <span style="color:#fb4934;">Constantine</span>**

The flagship of the cluster would be Constantine. 
I took this legacy SFF machine and installed a 1.0TB Intel 670p NVMe via a PCIe adapter — a modification that had no business working as well as it did. A 2015-era computer, suddenly capable of 900-1000 MB/s disk speeds (I know, it’s not what that NVMe is capable of, but it was free hardware) - just imagine putting a Ferrari engine in a 1992 Toyota Corolla. Not competitive. Not adequate. Recycled (until I upgrade). I had three generations of storage technology to choose from when configuring the node, and I chose deliberately — the NVMe wasn't just the fastest option, it was the only option that matched the ambition of what I was building. Near-zero latency at the storage layer accelerates everything above it. A conservative estimate would put it at 5x to 10x faster than the SATA SSDs sitting in the rest of the rack.

<br>

**The Failover: Codename - <span style="color:#fabd2f;">Lobo</span>**

If Constantine is the one who runs the show, Lobo is the one who makes sure the show never stops.
Lobo isn't the flashiest node in the cluster. No NVMe core, no PCIe modifications pulling performance out of thin air. What it has is something more valuable in a production environment — it's always there. A ZFS mirror running underneath, two 500GB drives reflecting each other in real time, absorbing the workload before you've finished reading the alert.

High-availability failover isn't a glamorous role. It's a disciplined one. Armed patience until the moment it isn't optional anymore.

In the DC universe, nobody wants to fight Lobo. Not because he's the most powerful — he isn't. Because no matter what you throw at him, he comes back. Every single time, without complaint and without hesitation.
The cluster doesn't go down because Lobo won't let it.

<br>

**The Lean Compute: Codename - <span style="color:#b8bb26;">Swamp Thing</span>**

Swamp Thing doesn't announce itself. It doesn't need to.
Swamp Thing runs lean by design, not limitation. No excess, no redundant storage tiers, no performance modifications. Just a clean boot drive, maximum airflow, and an unwavering commitment to one job — holding the cluster together when the other nodes disagree about reality. In a three-node quorum, the deciding vote is everything. The wrong answer at the wrong moment and the whole system locks.
Swamp Thing never gets that wrong.

In the DC universe, Swamp Thing's power isn't brute force — it's being so deeply woven into the fabric of the environment that the ecosystem simply cannot function without it. Pull it out and everything collapses. Leave it in place and everything holds.
Swamp Thing understood the assignment.

<br>

**The Vault: Codename - <span style="color:#fe8019;">Deathstroke</span>**

Everything gets backed up. Nothing gets lost. That's not a goal — that's a contract.
Deathstroke runs as a dedicated Proxmox Backup Server, ZFS mirroring and deduplication running around the clock against every VM, every container, every line of code in the cluster. It doesn't host. It doesn't serve. It doesn't compute for anyone else. It protects. Every file I've written, every configuration I've built, held in the vault with a grip that doesn't loosen.

In the DC universe, Deathstroke doesn't miss. Not once. Not ever.
Neither does the backup server.

Here is the breakdown of the assets currently active in the field: 

<i data-lucide="server" style="display:inline; width:18px; height:18px; color:#8ec07c; vertical-align:middle;"></i> **ASSET: Constantine**

If the cluster  has a heartbeat, it beats here. Constantine carries the heaviest operational load in the cluster — hosting the jkpdevlabs.com frontend while the rest of the nodes organize around it. The NVMe tier alone puts this unit in a different performance class than anything else in the rack, and the AMD silicon underneath has proven it has no interest in being retired twice.

- **Chassis** - HP EliteDesk 705 G2 SFF
- **Primary Logic** - AMD A6-8500 CPU
- **Memory Core** - 12GB DDR3 (High-Speed Synchronized)
- **Storage Tier 0** - 1.0TB Intel 670p NVMe — "The Muscle"
- **Storage Tier 1** - 120GB SATA SSD (Boot/OS)
- **Operational Role** - Flagship Node. Hosts the jkpdevlabs.com frontend.

<i data-lucide="server" style="display:inline; width:18px; height:18px; color:#8ec07c; vertical-align:middle;"></i> **ASSET: Lobo** 

Every flagship needs a shadow. Lobo is the quiet one — the node that doesn't announce itself until Constantine can't. Built for high-availability failover, Lobo sits in a constant state of readiness, mirroring critical data across a ZFS redundancy tier. When something goes wrong — and in infrastructure, something eventually goes wrong — Lobo is already there.

- **Chassis** - HP EliteDesk 705 G2 SFF
- **Primary Logic** - AMD A6-8500 CPU
- **Memory Core** - 12GB DDR3
- **Storage Tier 1** - 240GB SATA SSD (Boot/OS)
- **Redundancy Tier** - 2× 500GB HDD (ZFS Mirror)
- **Operational Role** - High-Availability Failover & Redundant Storage.

<i data-lucide="server" style="display:inline; width:18px; height:18px; color:#8ec07c; vertical-align:middle;"></i> **ASSET: Swamp Thing**

Lean by design, not limitation. Swamp Thing was purpose-built for one thing — staying stable when everything else is under pressure. It handles quorum support and light compute, optimized for airflow and cluster coherence rather than raw throughput. In a distributed system, the node that holds things together quietly is often the most important one in the room. 

- **Chassis** - HP EliteDesk 705 G2 SFF
- **Primary Logic** - AMD A6-8500 CPU
- **Memory Core** - 12GB DDR3
- **Storage Tier 1** - 120GB SATA SSD (Boot/OS)
- **Operational Role** - Lean Compute & Quorum Support. Optimized for maximum airflow and cluster stability.

<i data-lucide="shield" style="display:inline; width:18px; height:18px; color:#fabd2f; vertical-align:middle;"></i> **ASSET: Deathstroke**

The Intel in a fleet of AMD. The guardian in a cluster of workers. Deathstroke doesn't host, doesn't serve, doesn't compute for anyone else — it protects. Running Proxmox Backup Server on the older but deeply reliable i3-4130 architecture, it sits at the edge of the cluster with one job: make sure nothing is ever truly lost. The ZFS mirror underneath holds the vault, and it doesn't give that up easily.

- **Chassis** - HP ProDesk 600 G1 SFF
- **Primary Logic** - Intel i3-4130 CPU
- **Memory Core** - 8GB DDR3 (The Remainder Pool)
- **Storage Tier 1** - 120GB SATA SSD (Boot/OS)
- **Vault Tier** - 2× 500GB HDD (ZFS Mirror)
- **Operational Role** - Dedicated Proxmox Backup Server (PBS).
 
The Nervous System: The MikroTik Rite of Passage
The hardware was alive, but blind.
Most home users never think about their router. It sits in a corner, blinks quietly, and they forget it exists. 

When I first started learning how to subnet, I also took the time to research most of the major brands of routers, layer 2 and layer 3 routing, and what had the easiest -> hardest learning curve. 
I did not choose Cisco because they lock their best features behind paid licensing keys — a reasonable ask for a Fortune 500, a dealbreaker for a homelab running on recycled parts, and I chose to stay away from things that were plug-and-play because, how do you learn anything like that? I landed on MikroTik - which definitely had that learning curve I was looking for. I bought an RB5009, mainly because I didn’t need a wifi router and I wanted another step downstream from the ONT jack that was a solid ethernet router with at least 8 ports. Success I’d say. 

I learned quickly that the MikroTik doesn't hold your hand. It doesn't assume. It waits for you to tell it exactly what to do, and if you don't know what you're doing, it will teach you the hard way.
Well… It taught me a lot.
Layer 2 Orchestration — Configuring bridges and port isolation to carve out a secure, air-gapped environment, a sandbox. A network within the network.

Stateful Inspection — Writing firewall rules from scratch, line by line, until the nodes were invisible to the outside world and visible only to each other.

The DNS Gap — Troubleshooting why the sisters couldn't resolve the internet, and forcing that RB5009 to step up as the authoritative DNS brain for the entire cluster.

Bandwidth Awareness — Using the TRENDnet 10/100 switch as a deliberate physical bottleneck to understand how network latency propagates upward into high-availability heartbeats. You learn more from a constraint than you ever do from abundance, in my opinion anyway.

The Cluster: Proxmox and the Power of Three
Virtualization was the next layer — and the one that turned a collection of reclaimed desktops into something that behaves like infrastructure.

I deployed Proxmox VE across the fleet, eventually updating to version 9.1.1. From there I engineered a three-node High-Availability Cluster: Constantine, Lobo and Swamp Thing — three machines that now act and compute as one.

This wasn't architecture for the sake of aesthetics. I needed to understand Quorum — the logic that determines whether a distributed system stays online or collapses when a physical node goes dark. In a quorum-based cluster, the majority rules. Lose one node, the other two vote to keep the lights on. My server  doesn't go down because one machine does.

Anchoring the entire operation is Deathstroke — running as a dedicated Proxmox Backup Server on the older Intel i3-4130 architecture. ZFS mirroring. Deduplication. Every line of code I've written, every configuration I've built, every VM I've deployed — all of it reflected in storage and held there with a grip that doesn't loosen. Deathstroke doesn't compute. It doesn't serve. It remembers.

The Pipeline: From VS Code to GitHub to the NVMe Core
Once the infrastructure was solid, I built the workflow to match it.
Manual file uploads were never going to cut it — not for a production environment, not for someone who believes the deployment process is as much a part of the craft as the code itself. I engineered my own pipeline: a clean, professional DevOps chain that moves code from my desktop to a live Dockerized environment in a single motion.

Studio — Code is written in VS Code, previewed instantly via Live Server. The feedback loop is tight and immediate.

Transport — ED25519 SSH key handshakes link my desktop to GitHub and directly to Constantine. No passwords. No friction. Cryptographic trust, established once, relied on indefinitely.

Deploy — A single push.bat on Windows. A single deploy command on Constantine. The rest is automatic.
Today, jkpdevlabs.com doesn't just sit on a disk somewhere. It lives inside a Dockerized Nginx-Alpine container, running on a near-zero latency NVMe core, protected by a three-node cluster and a dedicated vault that has never lost a file. That's not a hosting plan. That's architecture. In my humble opinion of course - I understand all this is old tech, but how else should I learn? In a classroom? HA!

The Philosophy: Owning the Vertical
From the physical layer — the discarded EliteDesks, the salvaged RAM, the reclaimed drives — all the way up to the containerized application sitting behind a hardened reverse proxy, I built every layer myself. I understand why each one exists, what it costs when it fails, and what it takes to keep it running. That's not something you learn in a course. That's something you learn at 2am when a quorum vote goes wrong and you have to figure out why before morning.

My portfolio at jkpdevlabs.com is not a resume. It is a proof of work — built by a self-taught craftsman who started with a cheap laptop and a curiosity that hasn't quieted down since. 
My server is operational. My pipeline flows.
