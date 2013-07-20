---
layout: page
title: Software for a personal cloud
header: Software

group: nav
navtitle: Software
navlink: software
navweight: 2
---
{% include JB/setup %}

There are two areas we need to work on to allow us to regain the freedoms 
we've lost.  The first of these is to create the appropriate 
[infrastructure](#infrastructure) that incorporates good security and is 
distributed in nature.  These tools will form the bedrock on which we can 
then build robust and scalable [applications](#applications), that provide 
all the great things we are used to but without requiring us to be subject 
to the whims of the Internet Barons.

<!-- siren servers and our faustian bargain -->

## Infrastructure

The underlying building blocks are a crucial piece of the puzzle.  We need 
robust and open-source tools that allow us to create distributed systems 
that anyone can build on.  These tools are the bedrock on which we will 
create the next generation of products.  They deal with the issues of 
[connectivity](#signpost), [synchronisation](#irminsule), and 
[deployment](#mirage).

### Signpost

<img style="float:right;" src="/images/networked-devices-thumb.png">
The cloud is a (mostly) always available service that can be seen by
all devices. Without this, it is difficult for individual devices to
find each other.  **Signpost** is "personal cloud" infrastructure to
let your devices all see each other without requiring complex 
configuration or needing a third-party.  
*([more about signpost](./signpost/)*)

### Irminsule

<img style="float:right;"  src="/images/tree_of_digital_life-thumb.png">
Having multiple devices has made the engineering effort around data 
persistence and sync more complex.  We have to concern ourselves about how 
data obtained for one device is made available and useful to others, without 
losing history.  **Irminsule** is a new kind of library database, based on 
the principles of Git (the version control system), meaning that all history 
can be kept and moved between devices with ease.  
*([more about irminsule](./irminsule/)*)

### Mirage

<img style="float:right;" src="/images/gear-cloud-thumb.png">
Most applications that run in the cloud aren't optimised to do so.  They 
inherently carry assumptions about the underlying operating system with 
them, including vulnerabilities and bloat.  **Mirage** represents an 
approach where only the necessary components for an application are included 
and the operating system can be discarded.  This allows for highly-efficient 
and extremely lean 'appliances' which can undergo whole-system optimisation. 
Such appliances are perfect for deploying in environments ranging from 
Amazon's EC2 to the Raspberry Pi. 
*([more about mirage](./mirage/)*)

## Applications

With the new infrastructure, we are able to build robust applications that 
will push towards a more decentralised web and empower knew kinds of 
innovation and exploration.  Building on the right foundations, means the 
core aspects of connectivity and syncing between devices will already be 
accounted for so the focus can be on the functionality and extensibility.

### Email server

One of the most fundamental and ubiquitous tools we have is email.  In order 
to completely own your digital presence, we must first be able to easily 
manage and control our own email communications.  There are many email 
clients in the world today but innovation in the sense of email servers has 
stagnated.  At the moment, it's simply too difficult for an individual to 
control their own email but there's no reason it can't be simplified.  With 
email servers that work for small groups, like families or friends, we can 
begin to see routes to new email innovation, where developers can write 
software that interacts directly with the server to enhance email in ways we 
cannot right now.
