---
layout: page
title: Signpost
tagline: "Connectivity between all your devices"
next: "Work on an end-to-end prototype"
last: "Present at FOCI 2013, Washington DC"
---
{% include JB/setup %}


## Your own personal network

<img style="float:right;" src="/images/networked-devices.png">
The cloud is a (mostly) always available service that can be seen by
all devices. Without this, it is difficult for individual devices to
find each other.  **Signpost** is building "personal cloud" infrastructure 
to let your devices all see and reach each other without requiring 
any complex configuration.

Peer-to-peer services are notoriously hard to use due to the
prevalence of firewalls and NAT middleboxes that prevent all of our
devices from seeing each other. Consider how difficult it is to access
a display from work into your home PC, or vice versa.  Many cloud
services have sprung up to assist with this, but they all require you to give
access to your personal infrastructure to an external third-party. For 
example, [Dropbox](https://www.dropbox.com) or 
[GoToMyPC](http://gotomypc.com). Why is it so difficult for our devices to 
be networked without these services?

**Signpost** addresses the problem by probing connectivity and
using DNS updates to provide a constant "pointer" to your devices. In
addition, it also understands the *internal* structure of networks
(e.g. the home) and can directly redirect devices that are on the same
network to each other without going via the Internet. 


{% include software/signpost-table.html %}


