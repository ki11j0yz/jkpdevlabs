---
title: "Unscheduled Downtime: Surviving My First Outage, First Updates/Upgrades"
description: "An unscheduled outage begets one's first updates and upgrades."
pubDate: "2026-06-12"
heroImage: "/images/blog/blog_photo1.png"
tags: ["SysAdmin", "Mikrotik", "Hypervisor"]
---

### Silence In The Server Room

There's a specific kind of silence that hits you when the power goes out on something you built yourself.
It's not the silence of inconvenience — the kind you feel when the TV cuts off or the WiFi drops. It's something heavier. It's the sound of cooling fans spinning down in sequence, the soft click of drives parking their heads, the lights going dark on a rack that was alive a second ago. If you've never built something from scratch and watched it go offline, you won't understand what that silence feels like. It’s a silence that is deafening.
At about 10:45 PM, I realized my 3-node Proxmox cluster—Constantine, Lobo and Swamp Thing—were offline. For a second, I wondered who should I call? Then I remembered I own this heap. I built it from recycled parts, gave it a MikroTik brain, and the heart of a Ferrari. It was on me to get this back up and running - so I went to check the degree of damage present and get down to brass tacks. 

Phase 1: The Physical Layer Recovery   
You don’t just "flip a switch" on a high-availability cluster. You have to respect the Quorum. If the nodes don't wake up in the right order, they don't trust each other, and the system stays locked - or that’s my understanding.   
I initiated a staggered boot sequence. I started with Constantine, giving it a full two minutes to initialize its NVMe data core. Then came Lobo and Swamp Thing. While I was at the rack with my hands on the hardware, I made a decision: touch it once, fix everything worth fixing.
I went into the BIOS on all four nodes — Constantine, Lobo, Swamp Thing, and Deathstroke — and set Restore on AC Power Loss to Power On across the board.  
That single setting changed everything. The cluster is now self-healing. If the lights flicker at 3am while I'm asleep, or at noon while I'm at work, the nodes will wake themselves up, find each other, establish quorum, and restore operations without a single command from me. Talk about infrastructure.

Phase 2: Chasing Ghosts in the Hypervisor   
Once the metal was humming, I checked the TrendNet switch,the lights were on, I checked the MikroTik - the bridge was active. Then I hit the Proxmox GUI. Walked straight into a classic desync — the dashboard said the portfolio container was stopped, but the server knew it was already alive. Neither one was wrong exactly, which is what makes this particular failure mode so disorienting. The error was clean: CT 100 already running (500). In sysadmin terms, this is a handshake hangover — the control plane lost the thread during the outage and came back confused about what it had already started. So basically, patience was key here. 
A hard browser refresh and a quick pct status 100 in the shell cleared the ghosts. The network bridge held firm, and suddenly, the green triangles were back signaling uptime. 

Phase 3: Patch Tuesday and Other Updates  
With the foundation stable, I decided it was time for my own Patch Tuesday and I updated everything.  
I pushed the fleet through a major maintenance window, moving from Proxmox 8 to the brand-new Proxmox VE 9.1.1. I managed the node-by-node migration, sliding my production environment over to Lobo while Constantine underwent its upgrade. 
I rotated through the cluster until every node was running the same version and the quorum was clean on the other side.
The fleet is now running the Linux 6.17 kernel.  
Cool, right? My first unscheduled downtime and I think it was maybe about ~20 minutes. Not bad for a noob?

Phase 4: Stability over Hype   
One question remained at the end of the maintenance window: chase the newest Docker release, or hold the line?
I looked at the terminal. Docker version 20.10.24+dfsg1. I learned that the +dfsg1 suffix is the Debian Free Software Guidelines seal — it means the package has been audited, hardened, and blessed by one of the most rigorous open-source maintainer communities in existence. It isn't the newest but it is the most battle-tested.
The decision took about four seconds. Stability wins.
My site needs to stay up. My code needs to be seen. A shiny Docker version number means nothing if it introduces a regression that takes the portfolio offline at the wrong moment. Right?
