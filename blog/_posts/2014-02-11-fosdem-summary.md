---
layout: post
title: "Summary of FOSDEM 2014"
author: Amir Chaudhry
date: 2014-02-11 13:40:00
tags: [conference, demo, irmin, mirage]
excerpt: "It's been just over a week since FOSDEM ended and it was even more hectic than we imagined.  Thousands of open source developers across dozens of rooms and speakers and lots of delicious waffles.  I'm still in awe that this is a completely volunteer organised event and that everything appeared to run smoothly."
shorturl: http://bit.ly/1fcKu8o
---
{% include JB/setup %}


It's been just over a week since FOSDEM ended and it was even more hectic 
than we imagined.  Thousands of open source developers across dozens of 
rooms and speakers and lots of delicious waffles.  I'm still in awe that 
this is a completely volunteer organised event and that everything appeared 
to run smoothly.  Especially, since this has to be the *only* conference 
I've been at where the wifi was usable (and ubiquitous).  

The most interesting aspect was how crowded some of the rooms became and how 
quickly.  For example, the [configuration management track][confmgmnt] was 
pretty much full throughout the day with a crowd of people trying to get in.
I heard that the Mozilla track was equally busy as were some other devrooms.
This may be in indication of relative popularity but also the sheer scale 
that this annual event has reached. It may be outgrowing ULB.  Thankfully, 
[videos will be available][fosdem-video] this year so I hope I can catchup 
up with the sessions I couldn't get to!  One that I was particularly 
interested in is the [Xen/ARM][] talk in the [Automotive track][fosdem-auto].
Since cars are now getting smarter and Xen works on embedded devices it 
would be an excellent use case for Mirage to ensure that the software 
running in vehicles is safe and does only what it's supposed to.  There were 
many other Xen talks too and you catchup with them on the 
[Xen blog][xen-fosdem].

The Mail track talks were crowded and during the 
[postfix talk][fosdem-postfix] we were treated to an interesting review of 
spam around the globe, which was followed up by the Mailpile team announcing 
their [alpha release][mailpile-alpha] on stage! The 
[Internet of Things devroom][fosdem-iot] had a number of interesting talks 
but there need to be more people thinking about the underlying 
infrastructure needs before we can begin building resilient, decentralised 
networks.

For the Mirage talk, Mort and Anil gave a great demo by building unikernels 
on stage to show the process in action.  They continued the demos at the Xen 
stall to a number of people including some surprisingly young FOSDEM 
attendees.  We'll soon be moving our personal websites to become self-hosted 
unikernels, and from there we can build out more of the Nymote toolstack.

We've captured some of the interesting tweets and pictures below and 
hopefully next year we'll be speaking at FOSDEM about how we're using the 
Nymote toolstack.

[confmgmnt]: https://fosdem.org/2014/schedule/track/configuration_management/
[fosdem-video]: https://fosdem.org/2014/news/2014-02-03-videos/
[xen-fosdem]: http://blog.xen.org/index.php/2014/02/07/xen-fosdem14-an-even-report/
[fosdem-postfix]: https://fosdem.org/2014/schedule/track/mail/
[mailpile-alpha]: https://www.mailpile.is/blog/2014-01-31_Alpha_Release_Shipping_Bits_and_Atoms.html
[fosdem-iot]: https://fosdem.org/2014/schedule/track/internet_of_things/
[Xen/ARM]: http://www.xenproject.org/developers/teams/arm-hypervisor.html
[fosdem-auto]: https://fosdem.org/2014/schedule/track/automotive_development/


<div class="storify"><iframe src="//storify.com/amirmc/fosdem/embed?header=false&border=false" width="100%" height=750 frameborder=no allowtransparency=true></iframe><script src="//storify.com/amirmc/fosdem.js?header=false&border=false"></script><noscript>[<a href="//storify.com/amirmc/fosdem" target="_blank">View the story "Summary of FOSDEM 2014" on Storify</a>]</noscript></div>
