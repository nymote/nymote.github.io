---
layout: post
title: "A new website for Nymote"
author: Amir Chaudhry
tags: [signpost, irminsule, mirage, infrastructure, tools]
excerpt: "Nymote is a set of tools and software infrastructure, created from the ground up, to provide end-users with life-long control of their networked personal data."
---

**Nymote** is a set of tools and software [infrastructure][], created from the ground up, to provide end-users with life-long control of their networked personal data.  Think of it as the [tool stack][] to enable a personal, decentralised Internet.   This site brings together all the core open-source technology we're building and describes what we're working towards.  Infrastructure that allows us to create decentralised products and services.

## Infrastructure matters
<a href="http://www.flickr.com/photos/suzumenonamida/8206148949/"><img style="float:left; margin-right: 15px;" src="/images/higashi-osaka-junction.jpg"></a>
The Internet has become such a huge part of our daily lives to the extent that it’s difficult to imagine a world without information and connectivity (literally) at your fingertips. Collaboration is easier, communication simpler and generally work is more productive.  For example, companies such as Apple, Google and Microsoft provide services that manage our emails, while reducing spam, and seamlessly keep our mobile devices in sync for us. Services such as Dropbox and Google Drive make the process of collaborating in teams trivially simple.  Social services like Facebook and Twitter make it fun and easy to keep up to date with friends, while LinkedIn helps you to manage your professional persona and visualise your network.  All of these companies are successful because they provide something of value to their users.  

However, we’ve also made sacrifices in order to achieve these gains, in many cases without fully comprehending the trade-offs.  By adopting large centralised services we’ve made an implicit trade that in exchange for something useful, we will share our habits and data with them. In doing so we’ve empowered Internet behemoths while simultaneously reducing our ability to influence them. We are at the behest of [ever][tos1]-[changing][tos2] [Terms][tos3] of [Service][tos4], which are [not written in the users' interest][tosdr]. We trust services to secure our data but [repeated breaches][dropbox-breaches] undermine that trust.  Services that we come to depend on are [shut down][google-reader-shutdown], forcing us to look elsewhere and adapt our habits.  We are at the the point where so much of our lives are in these silos that [governments demand access to them][guardian-nsa].  


As things stand, we risk becoming slaves to the current system unless we can create decentralised alternatives that compete. The one truism in depending on other people's services is that they will change or disappear so decentralised solutions are *easier* in the long term as *users* can control when they change or update things.  Such systems allow users to maintain the benefits of a networked world as well as achieve *life-long control* of their data.  Just as the current incarnation of the Internet is built on a range of open-source technologies, we need a set of robust tools that allow the developers of the future to build distributed systems and services that empower users.  

Our approach is to create secure, robust and open-source infrastructure that others can build on. Security and privacy need to be incorporated from the ground up so that promises of “your data is safe with us” can be kept by the technology itself. In some cases, this means taking existing tools and technologies and making them much easier to use and deploy. In other cases, it means rebuilding tools and creating new products to replace those that are no longer fit for purpose.


## Open-source building blocks

<a href="http://www.flickr.com/photos/jezpage/4990873353/"><img style="float:right" src="/images/lego-blocks.jpg"></a>
We're starting with fundamental [infrastructure][] to solve the problems around [operating systems][Mirage] for the future, [identity][Signpost] for users and devices and [data-persistence][Irminsule] across those devices.

Over the coming weeks we will introduce you to these key technology pieces, which form a new tool stack for the personal Internet. **[Mirage][]** takes a clean-slate approach to the *operating system*, with a view to whole-system optimisation and use on embedded devices.  It deals with problems of how to deploy applications and manage complex infrastructure by creating custom 'appliances'.  **[Signpost][]** deals with the growing problems around *identity* and returns the *end-to-end principle* of connectivity to our devices.  It deals with with the question of 'who are you?' on the Internet and scales naturally with the number of devices a user has.  **[Irminsule][]** rethinks how we *persist data* based on the principles of Git and incorporates provenance and sync. It solves the problems of how all a user's devices will remain synchronised with each other and how that data is backed up.

This work is being done in the open by a range of [contributors][about] who have already published a number of influential [papers][].  The emerging tools form the bedrock on which anyone can build robust and scalable applications.  Applications that provide all the great things we're used to but without requiring us to be subject to the whims of the Internet Barons.  You can read more about each of these projects by following the links above and this site will be updated as they progress.

To keep up to date with our posts and updates sign up to the [Nymote mailing list][followers-list].


[Nymote]: http://nymote.org
[Nymote Blog]: http://nymote.org/blog
[Infrastructure]: /#infrastructure
[tool stack]: http://en.wikipedia.org/wiki/Solution_stack
[Signpost]: /software/signpost
[Mirage]: /software/mirage
[Irminsule]: /software/irminsule
[papers]: /docs
[about]: /#about
[followers-list]: http://eepurl.com/mXYb1
[dropbox-breaches]: http://venturebeat.com/2012/08/01/dropbox-has-become-problem-child-of-cloud-security/
[tosdr]: http://tosdr.org
[google-reader-shutdown]: http://gigaom.com/2013/07/03/google-readers-shutdown-the-rise-of-walled-gardens-and-the-future-of-the-open-web/
[guardian-nsa]: http://www.theguardian.com/world/2013/jun/06/us-tech-giants-nsa-data
[tos1]: http://www.telegraph.co.uk/technology/social-media/9780565/Facebook-terms-and-conditions-why-you-dont-own-your-online-life.html
[tos2]: http://consumerist.com/2009/02/15/facebooks-new-terms-of-service-we-can-do-anything-we-want-with-your-content-forever
[tos3]: http://bits.blogs.nytimes.com/2012/12/17/what-instagrams-new-terms-of-service-mean-for-you/?_r=0
[tos4]: http://mattmckeon.com/facebook-privacy/

### Interesting links:

**Changing Terms of Service**

- http://www.telegraph.co.uk/technology/social-media/9780565/Facebook-terms-and-conditions-why-you-dont-own-your-online-life.html

- http://consumerist.com/2009/02/15/facebooks-new-terms-of-service-we-can-do-anything-we-want-with-your-content-forever

- http://bits.blogs.nytimes.com/2012/12/17/what-instagrams-new-terms-of-service-mean-for-you/?_r=0

- http://mattmckeon.com/facebook-privacy/



<!-- <a href="http://www.flickr.com/photos/jezpage/4990873353/" title="257/365 - LEGO by Jez Page, on Flickr"><img src="http://farm5.staticflickr.com/4147/4990873353_f2a285f68a_o.jpg" width="3888" height="2592" alt="257/365 - LEGO"></a> -->

<!--One of the fundamental limitations is that distributed systems are difficult and in order to build viable alternatives, we need to address the underlying problems first.  

<a href="http://www.flickr.com/photos/benfuji/4233370523/" title="glowing lego blocks by Ben-Miller, on Flickr"><img src="http://farm5.staticflickr.com/4007/4233370523_63c4feac79_z.jpg" width="640" height="373" alt="glowing lego blocks"></a>

<a href="http://www.flickr.com/photos/hungrydesigns/4704480669/" title="Candy Lego Blocks - AMAZING! by Hungry Designs, on Flickr"><img src="http://farm5.staticflickr.com/4025/4704480669_deb40e3fa0_z.jpg" width="547" height="410" alt="Candy Lego Blocks - AMAZING!"></a>

<a href="http://www.flickr.com/photos/jezpage/4990873353/" title="257/365 - LEGO by Jez Page, on Flickr"><img src="http://farm5.staticflickr.com/4147/4990873353_547ab8d298_z.jpg" width="640" height="427" alt="257/365 - LEGO"></a>

<a href="http://www.flickr.com/photos/suzumenonamida/8206148949/" title="Higashi Osaka Junction by Manish Prabhune(マニッシュ), on Flickr"><img src="http://farm9.staticflickr.com/8205/8206148949_fbf6675e08_o.jpg" width="4291" height="2794" alt="Higashi Osaka Junction"></a>
-->

<!-- 
Building viable alternatives means revisiting our assumptions and thinking over the problems that need to be solved in the context of the Internet today.  
It’s time to work on those alternatives. -->