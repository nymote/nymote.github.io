---
layout: page
title: Mirage
tagline: "Lean and secure cloud OS"
next: "Release Developer Preview 1"
last: "Present at OSCON 2013, Oregon"
---
{% include JB/setup %}

## Your individual piece of the internet

<img style="float:right;" src="/images/gear-cloud.png">
Most applications that run in the cloud aren't optimised to do so.  They 
inherently carry assumptions about the underlying operating system with 
them, including vulnerabilities and bloat.  **Mirage** represents an 
approach where only the necessary components are included, allowing for 
highly efficient and extremely lean 'appliances'.  These can be deployed in 
environments ranging from Amazon's EC2 to the Raspberry Pi.  

Compartmentalisation of large servers into smaller 'virtual machines' has 
enabled many new businesses to get started and achieve scale.  This has been 
great for new services but many of those virtual machines are single-purpose 
and yet they contain largely complete operating systems which themselves run 
applications like web-servers.  This means a large part of the footprint is 
unused and unnecessary, which is both costly and a security risk.

**Mirage** represents a new approach to deploying and managing services that 
are designed to be small, lean and secure.  By turning software into these 
small 'appliances', Mirage can take full advantage of the cloud while 
dramatically reducing costs and simultaneously increasing security and 
scalability.   

We've presented Mirage at two conferences recently and are rapidly working 
towards a developer preview.  You can catchup by reading the 
[ASPLOS 2013 paper][], or by checking out the slides below from the talk at 
[OSCON 2013][]. 

There's much more information on the completely self-hosted 
[Mirage website][mirage-www] (running as a Xen appliance), where you'll find 
the full [list of papers][mirage-www-papers], an up to date 
[blog][mirage-blog] and even [installation instructions][mirage-install].


&#x20; <iframe src="http://www.slideshare.net/slideshow/embed_code/25360521" width="100%" height="400" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="max-width:476px;border:1px solid #CCC;border-width:1px 1px 0;margin-bottom:5px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true">oscon-2013</iframe>

[ASPLOS 2013 paper]: http://anil.recoil.org/papers/2013-asplos-mirage.pdf
[OSCON 2013]: http://www.oscon.com/oscon2013/public/schedule/detail/28956
[mirage-www]: http://openmirage.org
[mirage-www-papers]:  http://openmirage.org/wiki/papers
[mirage-blog]: http://openmirage.org/blog/
[mirage-install]: http://openmirage.org/wiki/install

<div align="right"><small><em>Image credit: <a href="http://dribbble.com/shots/346027-Cloud-Power-Artwork">Cloud Power</a> by <a href="http://dribbble.com/LeapLogic">Michael Thomas</a></em></small></div>
