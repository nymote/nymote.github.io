---
layout: post
title: Growing awareness of Personal Data
author: Amir Chaudhry
tags: [aggregation, companies, security, leaks]
excerpt: "New companies thinking about personal data"
---

Awareness of Personal Data issues have risen in prominence in recent years and there have even been a number of new companies springing up around the idea of personal data stores.  At the moment, only a handful of these are public and it's likely that more of them are working away behind the scenes. 

Although we won't necessarily be discussing these sites in any detail it's interesting that what they all have in common is the aim of aggregating a user's data in one place.  Once a user has collected all her data, the suggestion is that she can share those 'data-streams' with others, including services that she's granted access to.  At the moment there's limited information on how this aspect would work in practice but it's certainly important in order to liberate the *value* of that data.

<a href="http://www.flickr.com/photos/harmony19490/362527788/"><img style="float:right" src="/images/open-padlock.png"></a>
In general, this approach seems similar to the previous iteration of Personal Containers.  The idea of aggregating data into one place is fairly intuitive but as we've [learned from prior feedback][PersConUpdate], there is valid concern about having "all your eggs in one basket".  

There have been security issues that highlight this problem.  Last year a [programming error at Dropbox][DropboxStory], a popular file-syncing service, led to customer accounts being accessible.  For a few hours you could access any user account with any arbitrary password.  The flaw was possible because of the way Dropbox handles encryption, specifically that they hold users' encryption keys and therefore have access to files.\* 

The situation above is a clear example that there should be more separation of privileges among our data.  Our response to feedback was the concept of [Dataware][Dataware].  The premise is to leave the data themselves in the most appropriate place but facilitate access to them.  We achieve this by creating shims that can interface with services and at the moment the team has put together a couple that interface with social networking sites and another for [Aether's Notebook][aether].  These look very promising and we hope to continue developing these and others, along with the ability to run authorised computations on the data.

There'll be more to follow in the coming weeks on different aspects of Personal Containers, covering both [Dataware][Dataware] and [Signpost][Signpost].

[PersConUpdate]: http://perscon.net/blog/2011/08/31/refresh.html
[DropboxStory]: http://www.wired.com/threatlevel/2011/06/dropbox
[Dataware]: http://perscon.net/overview/dataware.html
[Signpost]: http://perscon.net/overview/signpost.html
[aether]: http://perscon.net/blog/2011/09/01/aethers-notebook.html
[DropboxLeak]: http://www.google.com/search?q=dropbox%20open%20for%204%20hours

\**Although this might sound odd, many services do this.  If a user forgets their password, the files can still be recovered.  In this case there was some confusion about how security was presented to users.  In order to have a fully secure system, users would need to accept that if they lost their passwords, the service wouldn't be able to help.*