---
layout: post
title: Yurts for Digital Nomads
author: Anil Madhavapeddy
tags: [app engine, hiring, infrastructure, mobile]
excerpt: "Learning that App Engine is ok for small records but not big things"
---

<!--- OLD Excerpt: excerpt: The App Engine data collector for Personal Containers is coming on nicely, and working with AppEngine has been interesting; it's got excellent availability and you can't beat the price (free), but coding robust Python that doesn't trip over the tight resource limits for individual requests and asynchronous tasks and queries is tricky.  While it is good for small records such as my iPhone or FindMyiPhone GPS traces traces, it doesn't work so well with my gigabytes of photographs or decades of e-mail. -->

The App Engine data collector for Personal Containers is coming on nicely, and is on track for an alpha preview release [fairly soon](http://github.com/avsm/perscon/blob/master/README.md). Working with AppEngine has been interesting; it's got excellent availability and you can't beat the price (free), but coding robust Python that doesn't trip over the tight resource limits for individual requests, asynchronous tasks and queries is tricky.  While it is good for small records such as my [iPhone](http://github.com/avsm/perscon/tree/master/plugins/iPhone/) or Find My iPhone [GPS traces](http://github.com/avsm/perscon/blob/master/appengine/perscon/drivers/fmi.py) traces, it doesn't work so well with my gigabytes of photographs or decades of e-mail.

This confirmed our earlier intuition that there is no one perfect solution for personal data handling; instead, we need to *embrace diversity* and construct an infrastructure that can cope with change over the coming decades. Mobile programming has changed beyond recognition in just a few years, and cloud providers are specialising in different ways (e.g. [PiCloud](http://www.picloud.com/) for simple compute, or [EC2](http://aws.amazon.com) for fancy services like elastic [load balancing](http://aws.amazon.com/elasticloadbalancing/)).

<a href="/images/nomads-diagram.png"><img style="float:right" src="/images/nomads-diagram-300.png"></a>
So to recognise this, we are building components that all interoperate with your personal data, keep it secure, and ensure it persists for more than a few years.  [Malte Schwarzkopf](http://www.malteschwarzkopf.de/) came up with the term "digital [yurts](http://en.wikipedia.org/wiki/Yurt)", and it's stuck.  We've written a [draft paper](/papers/digital-yurts-draft1.pdf) about it, and would love to hear your comments and feedback on the approach.

There are some interesting recent trends that make doing this particularly important:

* The New York Times wrote about the [data-driven life](http://www.nytimes.com/2010/05/02/magazine/02self-measurement-t.html) increasingly influencing our decision making. Current sensor data such as GPS traces are just harbringers for the privacy disaster that would be information such as heart rates or your consumption habits getting into the public domain. *(link via [Derek Murray](http://www.cl.cam.ac.uk/~dgm36/))*.
* Facebook has announced a brand new API platform to get access to your information. The [EFF](http://eff.org) has a fantastic timeline of [Facebook's Eroding Privacy](http://www.eff.org/deeplinks/2010/04/facebook-timeline) over the last five years, to demonstrate how unsafe it is to trust your data to any third-party.  We've started developing an information dump plugin for Facebook, but the API just changed mid-way and so it has to be started again (volunteers welcome!).
* In the UK, the [Digital Economy Act](http://en.wikipedia.org/wiki/Digital_Economy_Act_2010) is an extremely controversial act that makes anonymity and privacy all the more important.  We're assembling an open-source [dust cloud](http://www.scribd.com/doc/28393106/Using-Dust-Clouds-to-Enhance-Anonymous-Communication) that integrates Tor into personal containers to automatically grant you anonymity as you communicate with your friends.

If you're interested, join our [group](/contact.html) or contact [me](http://anil.recoil.org) directly.  At this stage, you need desire and the ability to hack code, but things are settling down over the next few months...
