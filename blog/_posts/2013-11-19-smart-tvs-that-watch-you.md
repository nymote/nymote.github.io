---
layout: post
title: "Smart TVs that watch you"
author: Amir Chaudhry
date: 2013-11-19 19:00:00 +0000
tags: [companies, connectivity, devices, internet of things, leaks, privacy, products, security, software, TV]
excerpt: "As our devices grow smarter and more connected it's reasonable to expect that we'll get better services and features as a result.  One such device that's already making its way into our homes is the humble TV.  We already have smart devices that *connect* to our TVs, such as the AppleTV and Google's Chromecast device, but the manufacturers themselves are also adding more functionality.  However, what these devices are doing is worth a second look."
shorturl: http://nymote.org/blog/smart-tvs-that-watch-you
---
{% include JB/setup %}

As our devices grow smarter and more connected it's reasonable to expect 
that we'll get better services and features as a result.  One such device 
that's already making its way into our homes is the humble TV.  We already 
have smart devices that *connect* to our TVs, such as the AppleTV and 
Google's Chromecast device, but the manufacturers themselves are also adding 
more functionality.  However, what these devices are doing is worth a second 
look.

A recent post by [DoctorBeet][], examines what his LG TV was doing when he 
noticed advertising on the homescreen.  This led him to discover that LG was 
offering a Smart Ad service to advertisers, based on customers' data.  The 
LG site has since been taken down but apparently *"LG Smart Ad analyses 
users favourite programs, online behaviour, search keywords and other 
information to offer relevant ads to target audiences."* Furthermore, there 
was a setting on the TV itself called "Collection of watching info", where 
the default setting was 'ON'.  All of this seems quite invasive, since the 
TV was purchased outright so it's not a case of trading privacy for 
something that's free.  You'd think that turning the collection setting to 
'OFF' would largely solve the issue but this story isn't that simple.  You 
should [read the post in full][LG-smart-ad], but a brief summary is below.

DocterBeet turned off the collection setting and then decided to examine his 
internet traffic.  Apparently the viewing data was being *regardless* of the 
setting on the TV, which completely breaks user expectations.  As if that 
wasn't bad enough, the TV was scanning external USB drives and sending back 
that data too.  Sometimes just the filenames but sometimes all the content 
too.  When LG was contacted about the problems, their response was baffling. 
Essentially, they claimed that DoctorBeet had *"accepted the Terms and 
Conditions on \[their\] TV"* and implied there was nothing they could do. 
Since DoctorBeet is a technically savvy customer, he created rules on his 
home router to prevent any further connections to LG's computers, while 
ensuring he could still get the software updates.  

This case highlights a potential trend where devices that we've paid for are 
still attempting to collect user-data for the purpose of advertising.  A 
case of you are *both* the customer *and* the product. What's equally 
concerning is that one technically able customer was able to understand what 
was going on but the majority of users would have been none-the-wiser. 

The next few years are going to be interesting as more news like this breaks 
and people become more aware of how desperate companies are to learn about 
their users.  The irony is that if the customers had a real voice, many of 
them may be willing to trade with the companies and provide them access to 
data-sets, assuming a safe and secure way to do so was available.  We're 
working on a platform as part of the [Hub of all Things][HAT] project, where 
companies and customers can do exactly this.  There may be other users who 
want to have more control over their home networks so we're also looking at 
[novel ways to allow people to interact and configure home routers][homework].

The Internet of Things and connected devices have the potential to be as 
ground-breaking as the Web but end-users must also be empowered if we are to 
reap all the benefits.

*Read the full story at: [http://doctorbeet.blogspot.co.uk/2013/11/lg-smart-tvs-logging-usb-filenames-and.html][LG-smart-ad]*

[DoctorBeet]: http://doctorbeet.blogspot.co.uk
[LG-smart-ad]: http://doctorbeet.blogspot.co.uk/2013/11/lg-smart-tvs-logging-usb-filenames-and.html
[HAT]: http://hubofallthings.wordpress.com
[homework]: http://homenetworks.ac.uk
