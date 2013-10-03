---
layout: post
title: "Overview of Mirage"
author: Amir Chaudhry
date: 2013-10-03 12:00:00
tags: [mirage, software]
---
{% include JB/setup %}

Mirage is one of the key components of the Nymote toolstack and this post 
introduces the principles behind it. If you're familiar with the using the 
command line, I'd encourage you to try out the 
[installation instructions][mirage-install] for yourself!

## What is Mirage and why is it important? 

<a href="http://www.berndnaut.nl/images/NimbusNP3web.jpg"><img style="float:right; margin-left: 15px;" width="500" src="/images/nimbus-np3-smilde.jpg"></a>
Most applications that run in the cloud aren't optimised to do so.  They 
inherently carry assumptions about the underlying operating system with 
them, including vulnerabilities and bloat. 
Compartmentalisation of large servers into smaller [virtual machines][] has 
enabled many new businesses to get started and achieve scale.  This has been 
great for new services but many of those virtual machines are single-purpose 
and yet they contain largely complete operating systems which themselves run 
applications like web-servers.  This means a large part of the footprint is 
unused and unnecessary, which is both costly and a security risk (due to the 
larger attack surface).

Mirage represents a new approach where only the necessary components of the 
OS are included and compiled along with the application into a 
[unikernel][].
This results in highly efficient and extremely lean *[appliances][]*, with a 
much smaller attack surface.  These appliances can be deployed directly to 
the cloud and embedded devices, with the benefits of reduced costs and 
increased security and scalability.

## How does Mirage work?

<a href="http://www.xenproject.org/developers/teams/hypervisor.html"><img style="float:left; margin-right: 15px;" width="300" src="/images/Xen-Panda-Ecosystem-1-500px.png"></a>
Mirage is a unikernel for constructing secure, high-performance network 
applications across a variety of cloud computing and mobile platforms. It 
works by treating the [Xen hypervisor][Xen] as a stable hardware platform, allowing 
us to focus on high-performance protocol implementations without worrying 
about having to support the thousands of device drivers found in a 
traditional OS.

Code can be developed in a high-level functional programming language (OCaml)
on a desktop OS such as Linux or Mac OSX, and is then compiled into a 
fully-standalone, specialised unikernel. These unikernels run directly 
on Xen Project hypervisor APIs. Since the Xen Project powers most public 
clouds such as [Amazon EC2][], [Rackspace Cloud][], and many others, Mirage 
lets your servers run more cheaply, securely and faster in any Xen Project 
based cloud or hosting service.

Mirage is based around the OCaml language, with syntax extensions and 
[35+ libraries][mirage-repos] which map directly to operating system constructs when being 
compiled for production deployment. As such, Mirage includes clean-slate 
functional implementations of protocols ranging from TCP/IP, DNS, SSH, 
Openflow (switch/controller), HTTP, XMPP and Xen Project inter-VM transports.

<!--Some of the new applications we are building using Mirage include the 
next-generation Xen Cloud Platform (a widely deployed open-source Xen 
distribution), dubbed [Project Windsor][]. -->


## Where will Mirage be useful?

<a href="http://www.flickr.com/photos/radnezeoz/7343684238/"><img style="float:right; margin-left: 15px;" width="500" src="/images/cumulous-cruisin.jpg"></a>
An example of a current Mirage appliance can be seen at 
[openmirage.org][mirage-www], 
which is a completely self-hosted site, deployed on the public cloud and running directly on the Xen Project hypervisor (in this case, on 
Amazon EC2). Such appliances could be auto-configured and deployed directly 
to the public cloud (e.g. Rackspace or Amazon EC2) or pushed to embedded 
devices. There is also 
[http://decks.openmirage.org](http://decks.openmirage.org), where separate 
Mirage unikernels are being used to present slides for conferences.  These 
are both example of how Mirage is working right now and below are examples 
of what we can do in the future.

### Self-scaling architecture

We can create auto-scaling web-servers with very small footprints.  These 
would be cheaper to run than current solutions due to the small size but 
they would also be highly elastic.  If a sudden spike in traffic occurs, the 
web-servers can be configured to create and deploy copies of themselves to 
service the demand.  This auto-scaling happens so quickly that an incoming 
connection can trigger the creation of new server and the *new server* can 
then handle that request before it times out (which is on the order of 
milliseconds). When the demand dies down again, these web-servers can 
automatically shut themselves down. Since these machines boot fast we can be 
more elastic, raising and lowering capacity to precisely meet demand and 
therefore only spending what we actually need when we really need it.

### Deployment to embedded devices

<a href="http://www.flickr.com/photos/lukew/6171377827/"><img style="float:left; margin-right: 15px;" src="/images/device-love.jpg"></a>
Using Mirage, we can also create appliances that can run on embedded devices.
Such appliances can be deployed into small devices that are scattered 
around your home, for example in plant pots to measure moisture levels to 
chemical sensors 
in your fridge, which tell you exactly what has gone off.  You could access 
the data from these sensors via a web-sever appliance, which is also 
deployed locally in your home on a device like a [Raspberry Pi][RPi].  
Installing additional applications into your Raspberry Pi appliance can be a 
a simple 1-click operation, allowing you to share your data or compare with 
others.  Creating a home-based network like this ensures you're not affected 
by any upstream connectivity issues and that your data remains within your 
control.  

This same scenario can be deployed into a enterprise environment where 
sensors around a building can monitor environmental conditions, adjust 
lighting and many other things.  When additional computation is required, 
more appliances can automatically be created on a cloud provider for the 
short duration that they're needed.

Overall, Mirage provides substantial benefits in terms of increased 
efficiency and safety and is ideal for deploying to both the public could 
and embedded devices.  Together with [Signpost][] and [Irminsule][], Mirage 
forms a core piece of the Nymote toolstack to power the coming wave of 
[Internet of Things devices][iot-wiki].  

Mirage is primarily supported by [Horizon Digital Economy Research][horizon] - RCUK, and is also an 
[Incubated Project](http://www.xenproject.org/developers/teams/mirage-os.html) 
under the umberella of the [Xen Project](http://www.xenproject.org). 
You can find the source code on [GitHub][mirage-github] and more links and
slides on the [Mirage page](/software/mirage).


[mirage-install]: http://openmirage.org/wiki/install
[unikernel]: /docs/2013-asplos-mirage.pdf
[virtual machines]: http://en.wikipedia.org/wiki/Virtual_machine
[appliances]: http://en.wikipedia.org/wiki/Virtual_appliance
[Amazon EC2]: http://aws.amazon.com/ec2/
[Rackspace Cloud]: http://www.rackspace.com/cloud/
[Xen]: http://www.xenproject.org/developers/teams/hypervisor.html
[mirage-repos]: https://github.com/mirage
[Project Windsor]: http://blogs.citrix.com/2012/05/17/introducing-windsor-a-new-xen-based-virtualization-architecture/
[mirage-www]: http://openmirage.org
[RPi]: http://www.raspberrypi.org
[Signpost]: /software/signpost
[Irminsule]: /software/irminsule
[iot-wiki]: http://en.wikipedia.org/wiki/Internet_of_Things
[horizon]: http://www.horizon.ac.uk
[mirage-github]: http://github.com/mirage
