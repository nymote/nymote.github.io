---
layout: post
title: Pulling together a user interface
author: Anil Madhavapeddy
tags: [app engine, prototypes, plugins]
excerpt: "Fleshing out the App Enging node for personal containers"
---

<!--- OLD Excerpt: excerpt: Personal containers gather data from a wide variety of sources, and normalise them into a format which understands people (address book entries, with a set of services such as e-mail, phone, IM and online IDs), places (GPS, WOEID), media (photos, movies) and messages (Tweets, emails, Facebook messages). -->

We've been [hacking](http://github.com/avsm/perscon) away on fleshing out the <a href="http://code.google.com/appengine">App Engine</a> node for personal containers.  We're building this node first because, crucially, deploying an App Engine VM is free to anyone with a Google account.
<a href="/images/perscon-extjs.png"><img style="float:right" src="/images/perscon-extjs-thumb.png"></a>
The service itself is limited since you can only respond to HTTP or XMPP requests and do HTTP fetches, and so its primary use is as an always-on data collection service with a webmail-style UI written using [extjs](http://www.extjs.com/).

Personal containers gather data from a wide variety of sources, and normalise them into a format which understands people (address book entries, with a set of services such as e-mail, phone, IM and online IDs), places (GPS, WOEID), media (photos, movies) and messages (Tweets, emails, Facebook messages). I'll post more about the data model behind personal containers in a follow-up as the format settles.

The App Engine node has a number of plugins to gather data and aggregate them into a single view (see screenshot). Plugins include:

* [iPhoto](http://github.com/avsm/perscon/tree/master/plugins/iPhoto/) <img src="/images/iphoto_30x30.png" width="15" /> extracts location (via EXIF), people present (associated via [faces](http://gizmodo.com/5141741/what-to-know-about-iphoto-09-face-detection-and-recognition)), and of course, the actual photograph.
* [Adium](http://github.com/avsm/perscon/tree/master/plugins/Adium/) <img src="/images/chat_30x30.png" width="15" /> logs all IMs into a threaded chat view.
* [iPhone](http://github.com/avsm/perscon/tree/master/plugins/iPhone/) <img src="/images/phone_30x30.png" width="15" /> uses the backup files on a Mac to extract SMS messages, phone call records (and it could also get photographs and browsing history, although it currently doesn't).  An AppEngine tracker can also use [FindMyIPhone](http://www.apple.com/mobileme/features/find-my-iphone.html) to poll your iPhone regularly to keep track of your location without publishing it to Google or Yahoo (and hopefully in iPhone 4.0, we can operate as a background service at last!).
* [Twitter](http://github.com/avsm/perscon/tree/master/appengine/twitter.py) <img src="/images/twitter_30x30.png" width="15" /> runs directly on AppEngine (authenticated via OAuth) and synchronizes with a Twitter feed.
* [SyncServices](http://github.com/avsm/perscon/tree/master/plugins/MacOS-SyncServices/) hooks into the MacOS X <a href="http://developer.apple.com/macosx/syncservices.html">sync framework</a> and initially subscribes to Address Book updates. This seems to be the first open-source sync alternative to the expensive Mobile Me, as far as I can tell.  I'm planning to expand this to also subscribe to the full set of sync information (e.g. calendars).

I'm switching tacks briefly; we received an [Amazon Research Grant](http://aws.amazon.com/education/aws-in-education-research-grants/) recently and I'm building a node that runs as a Linux server to act as a longer-term archival and search server.  This is being written in OCaml and uses [Tokyo Cabinet](http://1978th.net/tokyocabinet/) (with Jake Donham's excellent [bindings](http://github.com/jaked/otoky)) and so should be speedy and a useful alternative implementation of the HTTP REST interface.  The plan is to automatically synchronize meta-data across all the nodes of a personal container, but store large and historical data away from expensive cloud storage such as App Engine. 

There are lots more plugins in development, such as [Foursquare](http://foursquare.com) and [Gowalla](http://gowalla.com) OAuth collectors, an [Android](http://github.com/avsm/perscon/tree/master/android) mobile application to upload location and contacts information, and Google GData synchronization.  If you're interested in one of these or something else, please do [get in touch](/contact.html) or just fork the [project](http://github.com/avsm/perscon) and start hacking!
