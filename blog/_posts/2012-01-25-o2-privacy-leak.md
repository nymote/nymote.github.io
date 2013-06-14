---
layout: post
title: Privacy needs to be built in
author: Amir Chaudhry
tags: [companies, leaks, mobile, phone]
excerpt: "O2 reveals your phone number when you browse from your mobile"
---

Today, news broke about how O2, a Mobile Network Operator, reveals customers' mobile numbers when they browse from their phones.  A site put together [by Lewis Peckover][lewis-site] simply displays the headers sent to his servers when people visit the page.  If you visit from an O2 phone, then you <strike>can</strike> could easily see your phone number displayed.   In other words, the phone number is simply given to the requesting server as plain text in the http headers (specifically *x-up-calling-line-id*).  There was nothing particularly special about Lewis' site so it's reasonable to assume that any site people have browsed using their 3G connection could have kept a copy of the user's number.

This is obviously a massive breach of privacy and as you can imagine, news of it spread fairly quickly via twitter.  A few customers even posted templates to help others file complaints with the UK's Data Protection office (who have [now contacted O2][ICO-Statement] to "remind them of their data breach notification obligations").  One of the main objections was that advertisers who can track visitors now also have access to phone numbers which can be used to tie different visits together.

In fact, this isn't the first time that mobile browsing has been shown to leak data.  A prior [study by Collin Mulliner][mulliner-paper] in 2010 showed that the phone number could appear in any number of headers as well as other information (e.g your roaming status).  

This highlights how 'spread-out' personal data has become and breaches like this serve to remind us how lax some organisations can be.  As more and more people access the web via mobile devices, issues like this become more important.  Products and services should be designed to be privacy-preserving from the very beginning.  To some extent this can mitigate any mistakes that others can make but can also empower users by giving them the option to explicitly share information if they deem it sensitive.

*(O2 has now written [a post about what happened][O2-Statement])*


[lewis-site]: http://lew.io/headers.php
[ICO-Statement]: http://www.zdnet.co.uk/news/regulation/2012/01/25/privacy-watchdog-to-probe-o2-over-phone-number-leaks-40094902/
[bbc-article]: http://www.bbc.co.uk/news/technology-16721338
[mulliner-paper]: http://www.mulliner.org/collin/academic/publications/mobile_web_privacy_icin10_mulliner.pdf
[O2-Statement]: http://blog.o2.co.uk/home/2012/01/o2-mobile-numbers-and-web-browsing.html