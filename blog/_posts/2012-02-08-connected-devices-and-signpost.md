---
layout: post
title: Connected devices, web services and Signpost
author: Amir Chaudhry
tags: [aggregation, centralisation, connectivity, devices, distributed, internet of things, mobile, security, sensors, signpost, successes]
excerpt: "How to enable a true, distributed, 'internet-of-things'"
---

## Connected devices are here

<a href="http://www.flickr.com/photos/craigjewell/3375525952/" title="Antique Doorbell Button on a Sandstone Building by Craig Jewell Photography, on Flickr"><img src="http://farm4.staticflickr.com/3618/3375525952_ee8b4820c9_m.jpg" width="161" height="240" align="right" hspace="10" vspace="10" alt="Antique Doorbell Button on a Sandstone Building"></a> 
The number of internet-enabled devices is increasing and mobile phones only represent one category.  Other types of 'enabled' devices can be made quite cheaply, contain a multitude of sensors and be situated almost anywhere.  For example, there are a couple of projects on Kickstarter that promise small boxes with a variety of sensors and even actuators, that can be used for a variety of purposes (see [Twine][Twine Kickstarter] and [Ninja Blocks][Ninja Blocks]).  The fact that these projects surpassed their funding goals so quickly and spectacularly indicates how excited people are about the possibilities of smart sensors and connected devices.  Commercial products also exist, such as the [Nest thermostat][Nest], which communicates with a cloud-based service to regulate the temperature in the home.

You can easily imagine many uses for such linked-sensor networks.  One example might be a security and access system for your home.  For example, imagine that you have a camera attached to your doorbell, which can send a video-feed directly to your smart-phone at work.  You could then talk to the postman who's trying to deliver a parcel and make sure he leaves it with people at No.3 or No.10 (people you actually know), and definitely *not* with the guy at No.1 (who you've never got on with).  Perhaps you could also control the lock and let a trusted friend in if they've arrived while you're still on your way home.  The possibilities are only limited by the sensors, actuators and people's imaginations.

The key point about these types of devices is that they're '*connected*', which usually means '*connected-to-the-internet*'.  The implicit message is that they're linked to some kind of centralised service but most people don't delve into what that actually means.

[Twine Kickstarter]: http://www.kickstarter.com/projects/supermechanical/twine-listen-to-your-world-talk-to-the-internet
[Ninja Blocks]: http://ninjablocks.com/
[Nest]: http://www.nest.com


## All your device are belong to us ... ?

<a href="http://www.flickr.com/photos/katodog/4411945975/" title="The Old Ball and Chain by Ed Durbin (Katodog), on Flickr"><img src="http://farm5.staticflickr.com/4003/4411945975_142f8282ed.jpg" width="240" height="160" align="left" hspace="10" vspace="10" alt="The Old Ball and Chain"></a>
Something common to all the rhetoric about connected devices (phones included) are references to cloud-based services.  In fact, there's a surprising *lack* of discussion about this aspect.  It's almost taken for granted that such devices will need to 'dial home' to achieve anything useful.  'Home' is typically a third-party service to which users are granted access (possibly as a subscription).  It's a little lax to discuss the 'internet-of-things' without also mentioning the centralised services that may underlie it.  

Nikesh Arora of Google recently mentioned that ["Consumers want a divergence of devices but a convergence of services"][Arora Gplus].  It's safe to assume that Google would like to be a point of convergence and have begun to position themselves in this way\*. Arora, like many others, makes the implicit assumption that cloud-based services will provide the connectivity between devices.  Specifically, that these web-based services will act to host, co-ordinate and route data from whichever devices are authenticated with them.  

[Arora Gplus]: https://plus.google.com/104376123433741873548/posts/4RcwiHbS7ME

In all the excitement, what *isn't* really discussed is the increasing amount of personal data that would have to be shared with such centralised services (of course, they would all claim that data security is paramount for them).  Something to consider is whether the organisations even *need* to hold such information at all.  For some companies, there may be a clear, strategic desire to collate and analyse user data (e.g Google is adept at monetising what it learns from users).  However, in other cases, the back-end service may only exist to solve the problem of connectivity.  Put bluntly, it's difficult to get all your devices to talk to each other but much more straightforward to get them talking to one central point on the internet.  For example, your phone can usually 'find and connect' to the internet, but it's a lot more complicated if a device needs to 'find and connect' to your phone.  

If a mechanism existed to allow devices to quickly and efficiently make direct connections with each-other, then perhaps many of the coming services could focus on the value-adding features, instead of how to get data from device A (my doorbell camera) to device B (my smart-phone screen).

[Signpost][] addresses the difficult yet **fundamental problem** for properly enabling the 'internet-of-things'.  That of creating robust, ad-hoc, private connections between devices.

## Signpost enables truly connected devices

<a href="http://www.flickr.com/photos/heavytpro70/3373700465/" title="Tin cans and string by heavytpro70, on Flickr"><img src="http://farm4.staticflickr.com/3456/3373700465_2e2863f2cb.jpg" width="236" height="240" align="right" hspace="10" vspace="10" alt="Tin cans and string"></a>
Signpost enables devices to create bi-directional connections between each-other which can be used by applications to route data.  It could be used by any arbitrary application that needs to get information from one device to another and can also achieve this in a way that doesn't involve directly handling the data itself.  

Since devices can be highly mobile, moving from wifi networks to 3G and back, Signpost maintains two useful pieces of information for each device.  The first is a universal *name* for each device, which acts as a pointer.  The second is a list of *tactics*, which can be enacted to create connections between two trusted devices. In some sense this is similar to the way DNS works, resolving device names into methods for connecting to those devices.  Initially, a personal, centralised Signpost can act to co-ordinate these connections but an individual could have multiple Signposts.  For example one could run on your network at home to enable connectivity between home devices in the absence of the external internet.

In this way, the critical problem that Signpost solves is the ability to traverse the messy and chaotic structure of the internet to provide *end-to-end* connectivity.  More importantly, it can be done in an automated way that doesn't require the end users of devices to behave differently and can enable new services to grow that don't need to create web-services solely to co-ordinate devices.

Work is still progressing towards an alpha version and early results are very promising.  

[Signpost]: http://perscon.net/overview/signpost.html

\* <small>For example, Google has recently merged its privacy policies to allow all their services to share data between them.</small>
