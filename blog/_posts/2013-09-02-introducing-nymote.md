---
layout: post
title: "Introducing Nymote"
author: Amir Chaudhry
tags: [infrastructure, internet of things, irminsule, mirage, signpost, tools]
excerpt: "Nymote is a set of tools and software infrastructure, created from the ground up, to provide end-users with life-long control of their networks and personal data."
---

**[Nymote][]** is a set of tools and software [infrastructure][], created from the ground up, to provide end-users with life-long control of their networks and personal data.  Think of it as the [toolstack][] to recapture the original vision of a resilient, decentralised Internet.   This site brings together the open-source technology we're building and describes what we're working towards --- infrastructure that empowers users and organisations to regain control over their digital data.

[Nymote]: http://nymote.org
[Infrastructure]: /#infrastructure
[toolstack]: http://en.wikipedia.org/wiki/Solution_stack

## Infrastructure matters
<a href="http://www.flickr.com/photos/suzumenonamida/8206148949/"><img style="float:left; margin-right: 15px;" src="/images/higashi-osaka-junction.jpg"></a>
The Internet has become such a huge part of our daily lives to the extent that it’s difficult to imagine a world without information and connectivity (literally) at your fingertips. Collaboration is easier, communication simpler and generally work is more productive than it's ever been.  For example, companies such as Apple, Google and Microsoft provide services that manage our emails, while reducing spam, and seamlessly keep our mobile devices in sync for us. Services such as Dropbox and Google Drive make the process of collaborating in teams trivially simple.  Social services like Facebook and Twitter make it fun and easy to keep up to date with friends, while LinkedIn helps you to manage your professional persona and visualise your network.  All of these companies are successful because they provide something of value to their users.  

However, we’ve also made sacrifices in order to achieve these gains, in many cases without fully comprehending the trade-offs.  By adopting large centralised services we’ve made an implicit trade that in exchange for something useful, we will share our habits and data with them. In doing so we’ve empowered Internet behemoths while simultaneously reducing our ability to influence them. We are at the behest of [ever][tos1]-[changing][tos2] [Terms][tos3] of [Service][tos4], which are [not written in the users' interest][tosdr]. We trust services to secure our data but [repeated breaches][dropbox-breaches] undermine that trust.  Services that we come to depend on are [shut down][google-reader-shutdown], forcing us to look elsewhere and adapt our habits.  We are at the the point where so much of our lives are in these silos that [governments demand access to them][guardian-nsa].  

[tos1]: http://www.telegraph.co.uk/technology/social-media/9780565/Facebook-terms-and-conditions-why-you-dont-own-your-online-life.html
[tos2]: http://consumerist.com/2009/02/15/facebooks-new-terms-of-service-we-can-do-anything-we-want-with-your-content-forever
[tos3]: http://bits.blogs.nytimes.com/2012/12/17/what-instagrams-new-terms-of-service-mean-for-you/?_r=0
[tos4]: http://mattmckeon.com/facebook-privacy/
[tosdr]: http://tosdr.org
[dropbox-breaches]: http://venturebeat.com/2012/08/01/dropbox-has-become-problem-child-of-cloud-security/
[google-reader-shutdown]: http://gigaom.com/2013/07/03/google-readers-shutdown-the-rise-of-walled-gardens-and-the-future-of-the-open-web/
[guardian-nsa]: http://www.theguardian.com/world/2013/jun/06/us-tech-giants-nsa-data

<img style="float:right; margin-left: 15px;" src="/images/iot-devices.png">
In addition to the above, we have entered an era where more of our interactions with the world are through mobile devices, like smartphones.  This trend is set to continue and has been described as the [Post-PC era][post-pc], the [5th wave of computing][5th-wave] and the [Internet of Things][iot].  What they all have in common is the idea of remote devices recording data and performing useful services for us, like encouraging us to be more [physically active][activity-monitors] or [monitoring our homes][philips-monitor].  This is an exciting area and is reminiscent of the early days of the World Wide Web.  There are [highly successful][lima-plug] crowd-funded [projects][canary] that demonstrate the demand from users for new products and services.  As this space evolves we are faced with a choice.  One option is to continue along the current path of increasingly centralised services, providing access to even more intimate aspects of our lives, including health and medical data.  We've seen both the benefits and costs of this approach with the way things are now.  An alternative is to create more decentralised systems, which can provide the same benefits but with the user in control at the centre of their network of devices.  

[post-pc]: http://en.wikipedia.org/wiki/Post-PC_era
[5th-wave]: http://academy.bcs.org/content/2012-lecture-0
[iot]: http://en.wikipedia.org/wiki/Internet_of_Things
[activity-monitors]: http://allthingsd.com/20130715/fitbit-flex-vs-jawbone-up-and-more-a-wearables-comparison/
[philips-monitor]: http://www.usa.philips.com/c/app-enhanced-accessories/double-pack-m100d_37/prd/en/
[lima-plug]: http://www.kickstarter.com/projects/cloud-guys/plug-the-brain-of-your-devices
[canary]: http://www.indiegogo.com/projects/canary-the-first-smart-home-security-device-for-everyone

As things stand, we are fundamentally limited by the current system unless we can create decentralised alternatives that compete. Many of the services we enjoy today require a constant connection to the Internet in order to be useful. This is becoming more important as the current wave of Internet of Things devices find their way into our homes, with each of them tethered to a new wave of centralised services and any interruption in power or bandwidth having tangible effects on our lives.  The one truism in depending on other people's services is that they will change or disappear, so decentralised solutions are *easier* in the long term as *users* can control when they change or update things.  Such systems allow users to maintain the benefits of a networked world as well as achieve *life-long control* of their data.  Just as the current incarnation of the Internet is built on a range of open-source technologies, we need a set of robust tools that allow the developers of the future to build distributed systems and services that empower users.  

This is the mission of the Nymote toolstack. <strong>To enable the creation of resilient decentralised systems that incorporate privacy from the ground up so that users retain control of their networks and data</strong>. Nymote ensures that promises of “your data is safe with us” are underpinned by a technological foundation, which reduces the scope for human error and makes it easy to build scalable systems where users decide when to add features or upgrade.  

## Open-source building blocks

<a href="http://www.flickr.com/photos/jezpage/4990873353/"><img style="float:right" src="/images/lego-blocks.jpg"></a>
We're starting with fundamental [infrastructure][] to solve the problems around [operating systems][Mirage] for the future, [identity][Signpost] for users and devices and [data-persistence][Irminsule] across those devices.

[Mirage]: /software/mirage
[Signpost]: /software/signpost
[Irminsule]: /software/irminsule

We began work on these issues four years ago under the umbrella of the [Horizon Digital Economy programme][horizon-de], at Cambridge University and Nottingham University.  As a result many [contributors][about] have worked on these tools and published a number of [papers][].  In the coming weeks we will introduce you to each of these key technology pieces, which together form a new toolstack for the personal Internet. In the next post, we'll explain more about **[Mirage][]**, how it fits into the overall stack and deals with the problems of managing your own infrastructure.  Mirage takes a clean-slate approach to the *operating system*, with a view to whole-system optimisation and use on embedded devices.  It deals with issues of how to deploy applications and manage complex infrastructure by creating custom 'appliances', which can be run in a wide variety of environments.  If you'd like to read more about it in advance, you can check out the self-hosted [Mirage website][mirage-www], read the [award-winning paper][mirage-asplos], presented at [ASPLOS 2013][], and the earlier [HotCloud Paper][mirage-hotcloud].  There are also [slides][oscon-slides] presented at [OSCON][] this year and a [video][mirage-xensummit] from [XenSummit][].  You can try it out for yourself by following the [installation instructions][mirage-install] and looking through the 35+ repos on [GitHub][mirage-github].

[horizon-de]: http://www.horizon.ac.uk
[about]: /#about
[papers]: /docs
[mirage-www]: http://openmirage.org
[mirage-asplos]: http://anil.recoil.org/papers/2013-asplos-mirage.pdf
[ASPLOS 2013]: http://asplos13.rice.edu/programme/
[mirage-hotcloud]: http://anil.recoil.org/papers/2010-hotcloud-lamp.pdf
[oscon-slides]: http://www.slideshare.net/amirmc/mirage-extreme-specialization-of-cloud-appliances-oscon-2013
[OSCON]: http://www.oscon.com/oscon2013/public/schedule/detail/28956
[mirage-xensummit]: http://vimeo.com/57412215
[XenSummit]: http://www-archive.xenproject.org/xensummit/xs12na_talks/xensummit.html
[mirage-install]: http://openmirage.org/wiki/install
[mirage-github]: https://github.com/mirage

Following this, we will discuss **[Signpost][]**, which deals with the growing problems around *identity* and returns the *end-to-end principle* of connectivity to our devices.  It answers the question of 'who are you?' on the Internet and provides users with the mechanisms needed to create peer-to-peer connections between their devices.  Creating networks of devices this way increases their resilience and was one of the founding principles of the Internet.  If you'd like to read ahead, you can look over our recent [USENIX FOCI paper][], where we describe the architecture and scenarios.  There are also [two][signposter1] [posters][signposter2] that summarise the approach.  

[USENIX FOCI paper]: /docs/2013-foci-signposts.pdf
[signposter1]: /docs/2012-signpost-poster-a4.pdf
[signposter2]: /docs/2012-sigcomm-signposts-poster.pdf

Finally, we will cover **[Irminsule][]**, which rethinks how we *persist data* based on the principles of version control systems such as Git (or historically, [Bayou][]).  Irminsule incorporates provenance and sync and solves the problems of how all a user's devices coordinate and remain synchronised with each other, and how that data is seamlessly backed up and encrypted to prevent third-party snooping. This is increasingly important as the number of connected devices continues to grow.

[Bayou]: http://pdos.csail.mit.edu/6.824/papers/bayou-conflicts.ps

The emerging tools form the bedrock on which anyone can build robust and scalable applications.  Applications that provide all the great things we're used to with the additional benefits of resilience, ownership and privacy that come with decentralised networks.

To keep up to date with our posts, sign up to the [Nymote mailing list][followers-list].

[followers-list]: http://eepurl.com/mXYb1
