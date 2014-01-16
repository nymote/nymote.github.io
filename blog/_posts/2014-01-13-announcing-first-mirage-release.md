---
layout: post
title: "Announcing the first major release of Mirage - the Cloud Operating System"
author: Amir Chaudhry and Anil Madhavapeddy
date: 2014-01-13 17:00:00
tags: [mirage, releases, software]
excerpt: "We're very pleased to announce that version 1.0 of Mirage, the first of the components, has been released! This is the first major release of Mirage and represents many years of development, testing and community building. As mentioned previously, there are three main components of the Nymote toolstack, which are: Mirage - an operating system for the cloud, Signpost - an identity and connectivity system and Irminsule - a distributed database. As always, the best way to learn is to try things out, so follow the revamped install instructions and create your own webserver to host a static website!"
shorturl: http://nymote.org/blog/announcing-first-mirage-release
---
{% include JB/setup %}

We're very pleased to announce that version 1.0 of Mirage, the first of the 
components, has been released! This is the first major release of Mirage and 
represents many years of development, testing and community building. As 
mentioned previously, there are three main components of the 
[Nymote toolstack][nymote-intro], which are: [Mirage][mirage-nym] - an 
operating system for the cloud, [Signpost][signpost-nym] - an identity and 
connectivity system and [Irminsule][irmin-nym] - a distributed database. As 
always, the best way to learn is to try things out, so follow the revamped 
[install instructions][mirage-install] and create your own webserver to host 
a static website!

We've written before [about Mirage and its importance][mirage-post] and this 
1.0 release represents the first stable toolkit for creating appliances. 
One of the first places where we'll be using Mirage is this (and other) 
websites.  We will take all the content you see on this site and compile it, 
along with the required components from a operating system (e.g networking 
and a file system) together with webserver functionality and create a small, 
fully-functioning appliance.  We'll then run that appliance directly on top 
of the Xen hypervisor on the public cloud.  The [Mirage website][mirage-www] 
has been running this way for some time and that unikernel appliance is 
around 1MB in size (including all content). 
To make it easier for others to generate sites this way we've been creating 
[new tools][mirage-tools] that help with static site generation.  As the 
appliances are so small, we're even able to check them into version control 
systems so you can easily roll-back to a previous version without having to 
recompile anything! You can see the 
[repository of previous unikernels][mirage-archive] to get an idea of this 
in action.

The Mirage team will also be using the new tools to convert their personal 
websites into unikernel appliances and as we create and release more 
libraries we'll be incorporating those also.  For example, once we have a 
workflow with unikernel websites it becomes much easier to add other 
functionality because it's a simple matter of using the appropriate 
libraries, writing some application code and then deploying to the cloud. 
In other words, you begin to reap the benefits of having a operating system 
that works for you in the cloud, while ensuring it remains lean and safe. 
For example, we could incorporate [CardDAV][] and then use our own 
infrastructure to synchronise contacts between our mobile devices, instead 
of relying on third-parties to do it for us.  As this process becomes more 
streamlined, it's easy to see how we can build up to having our own personal 
cloud by incorporating only the features we need, when we need them and 
always under our control.

There have been a number of articles about Mirage, and a good introduction 
to the concept and direction is in the recent Communications of the ACM 
article called 
[Unikernels: Rise of the Virtual Library Operating System][acm-queue]. 
There are also write ups about the Mirage release at [eWeek][], [InfoWorld][]
and a general overview on [Linux.com][linux-cloud-article] (a full list is 
on the self-hosted [Mirage website][mirage-www-links]).  We're looking 
forward to the upcoming activities for 2014 and the new avenues that Mirage 
will open up for us!


[nymote-intro]: http://nymote.org/blog/2013/introducing-nymote/
[mirage-nym]: http://nymote.org/software/mirage/
[signpost-nym]: http://nymote.org/software/signpost/
[irmin-nym]: http://nymote.org/software/irminsule/
[mirage-install]: http://openmirage.org/wiki/install
[mirage-post]: http://nymote.org/blog/2013/overview-of-mirage/
[mirage-www]: http://openmirage.org
[mirage-archive]: https://github.com/mirage/mirage-www-deployment
[CardDAV]: http://en.wikipedia.org/wiki/CardDAV‎
[mirage-tools]: http://openmirage.org/blog/decks-n-drums
[linux-cloud-article]: http://www.linux.com/news/enterprise/cloud-computing/751156-are-cloud-operating-systems-the-next-big-thing
[eWeek]: http://www.eweek.com/cloud/xen-project-builds-its-own-cloud-os-mirage.html/
[InfoWorld]: http://www.infoworld.com/t/operating-systems/xen-mirage-the-less-more-cloud-os-233823
[acm-queue]: http://queue.acm.org/detail.cfm?id=2566628
[mirage-www-links]: http://openmirage.org/links
