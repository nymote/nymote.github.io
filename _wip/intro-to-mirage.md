---
layout: post
title: "Intro to Mirage"
author: Amir Chaudhry and David Scott
date: 2013-10-01 12:00:00
tags: [mirage, software]
---
{% include JB/setup %}

# What is Mirage and why is it important? 

Most applications that run in the cloud aren't optimised to do so.  They 
inherently carry assumptions about the underlying operating system with 
them, including vulnerabilities and bloat.  
Compartmentalisation of large servers into smaller 'virtual machines' has 
enabled many new businesses to get started and achieve scale.  This has been 
great for new services but many of those virtual machines are single-purpose 
and yet they contain largely complete operating systems which themselves run 
applications like web-servers.  This means a large part of the footprint is 
unused and unnecessary, which is both costly and a security risk (due to the 
larger attack surface).

Mirage represents a new approach where only the necessary components of the 
OS are included and compiled along with the application into a 'microkernel'.
This results in highly efficient and extremely lean 'appliances', with a 
much smaller attack surface.  These appliances can be deployed directly to 
the cloud and embedded devices, with the benefits of reduced costs and 
increased security and scalability.

# How is it being done and/or how will it work?

Mirage is a microkernel for constructing secure, high-performance network 
applications across a variety of cloud computing and mobile platforms. It 
works by treating the Xen hypervisor as a stable hardware platform, allowing 
us to focus on high-performance protocol implementations without worrying 
about having to support the thousands of device drivers found in a 
traditional OS.

Code can be developed in a high-level functional programming language (OCaml)
on a desktop OS such as Linux or Mac OSX, and is then compiled into a 
fully-standalone, specialised microkernel. These microkernels run directly 
on Xen Project hypervisor APIs. Since the Xen Project powers most public 
clouds such as Amazon EC2, Rackspace Cloud, and many others, Mirage lets 
your servers run more cheaply, securely and faster in any Xen Project based 
cloud or hosting service.

Mirage is based around the OCaml language, with syntax extensions and 40+ 
libraries which map directly to operating system constructs when being 
compiled for production deployment. As such, Mirage includes clean-slate 
functional implementations of protocols ranging from TCP/IP, DNS, SSH, 
Openflow (switch/controller), HTTP, XMPP and Xen Project inter-VM transports.

Some of the new applications we are building using Mirage include the 
next-generation Xen Cloud Platform (a widely deployed open-source Xen 
distribution), dubbed Project Windsor.

# Mirage use-cases

An example of a current Mirage appliance can be seen at openmirage.org, 
which is a self-hosted site deployed on the public cloud (in this case, on 
Amazon EC2). Such appliances could be auto-configured and deployed directly 
to the public cloud (e.g. Rackspace or Amazon EC2). There is also 
[http://decks.openmirage.org](http://decks.openmirage.org), where separate 
Mirage microkernels are being used to present slides for conferences.

## Other Use-cases

1. Small footprint web-server for cheaper and quicker scaling. Since the VMs 
are small they are cheap to run. Since they boot fast you can be more 
elastic, shutting down excess capacity to save money, knowing that you can 
restore it quickly.
2. A toolkit of user-space networking and storage libraries to help use fast 
NICs and storage adapters. To maximise performance you want to (i) exploit 
the hardware by e.g. asking your Network Interface Controller (NIC) to 
demultiplex streams into separate queues; and (ii) minimise context switches 
by letting your userspace application control the NIC directly (possibly an 
SR-IOV VF acting as a 'virtual NIC'). So you would link your app against the 
mirage libraries and something like Intel's DPDK and run it under Linux.
3. A small OpenFlow-capable virtual switch. Since the VMs are small a cloud 
provider could give one to each tenant so they can control more of their own 
virtual networking. It's difficult to let the tenants talk to the real 
switches: the isolation is important for security.
4. A toolkit of libraries to help make applications small enough to run on 
ARM devices such as the raspberry pi.

# Who is involved in Mirage?

The Technical Lead for Mirage is Dr Anil Madhavapeddy, in the Systems 
Research Group in the University of Cambridge.  As a Library OS, all 
contributors to the 40+ libraries are also contributors to Mirage OS as a 
whole.  Mirage is primarily supported by Horizon Digital Economy Research - 
RCUK, and is also an 
[Incubated Project](http://www.xenproject.org/developers/teams/mirage-os.html) 
under the umberella of the [Xen Project](http://www.xenproject.org)






