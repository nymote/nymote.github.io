---
layout: post
title: Friend recommendations and Address Book Privacy
author: Amir Chaudhry
tags: [address book, behaviour, companies, leaks]
excerpt: "Path takes your address book without your knowledge or consent"
---

<!-- # Friend recommendations and address book privacy -->

In the last couple of weeks another news story about privacy flared-up, gathered some momentum and appears to have died down.

<a href="http://www.flickr.com/photos/moonbindery/3312836664/" title="Handbound address book. green fern cover by Barbara Simler, on Flickr"><img src="http://farm4.staticflickr.com/3641/3312836664_ef8e302412_m.jpg" width="240" height="232" align="right" hspace="10" vspace="10" alt="Handbound address book. green fern cover"></a>
The story was about how Path, a social networking app for the iPhone, was silently copying users' address books to its servers.  *How* it was discovered probably added some fuel to the story, since it involved a developer running a proxy and noticing what kind of information was being sent back and forth.  The headline was that the entire address book was sent from the phone to Path's servers.  There was no indication in Path's privacy policy that they collected information in this way (whether anyone actually *reads* such policies is a topic for another time).  You can follow the unfolding events in the rough timeline below.

The justification for needing the address book data is to improve friend recommendations.  For example, Alice joins a service and by accessing her address book, the service realises she has Bob's contact details.  Since Bob is already a member, the service can suggest that they connect.  This 'feature' is commonplace in almost every social networking application.  The issue with Path was that it occurred without users' explicit consent and that the data was then stored on their servers.  The CEO even commented that it was "industry best practice".

It's this last comment that is concerning.  Mostly because it's true.

Path wasn't alone in quietly scraping users' data.  Although they didn't suffer the same backlash, sites like Instagram, Twitter, Foursquare and others were also taking copies of users' address books. All without the users' explicit knowledge.  

It appears that in the race to deliver excellent, well-designed user experiences, the simple act of *informing users what you're doing* with their data is completely overlooked.  Perhaps it's one dialog box too far for the developers?  

The surprising thing that's come out of this isn't only that data-copying is so prevalent but the attitude that it's somehow Apple's responsibility.  Since Apple explicitly didn't lock-down address book access, it must be acceptable to do whatever you want with it.  Apple may be at fault for allowing unfettered access but their guidelines do state that:

> Para 17.1 - Apps cannot transmit data about a user without obtaining the
> user's prior permission and providing the user with access to information
> about how and where the data will be used
>
> Para 17.2 - Apps that require users to share personal information, such as
> email address and date of birth, in order to function will be rejected

The meaning of "data about a user" could be considered a little ambiguous and this viewpoint also seems to be shared by two US Congressmen, who promptly sent a letter to Apple asking for clarification on data access.

In general, I find the annoyance directed at Apple to be counter-productive. Despite the seemingly failed app approval process, it's still the social networks who wrote the code to copy data, *without user prompting*.  Claims that it's Apple's fault for 'letting them get away with it' seem to be missing the point.  That those networks should hold themselves to higher standards.  

Each of these 'privacy-leak' stories seem to be short-lived but the growing frequency indicates that control over [personal data][perscon-site] and awareness of your '[lifelong digital footprint][horizon-institute]' is becoming a more visible topic.  As well it should be.


### Rough timeline of events

- \[8 Feb\] - Arun Thanmpi [writes about][thanmpi-post] the exact `POST` request which sends his entire address book to Path
- \[8 Feb\] - Path CEO responds to comments on Thanmpi's blog post, and mentions that this behaviour is ["Industry best practice"][path-ceo-comment], among other things
- \[8 Feb\] - Another developer [confirms][curtis-post] that such behaviour is commonplace, but believes Apple is to blame
- \[9 Feb\] - Path CEO [apologises on their blog][path-apology]
- \[12 Feb\] - [NY Times article][ny-times-article] about the sensitivity of address book data
- \[14 Feb\] - [Venture Beat article][venture-beat-article] mentioning other services that transmit address book data, including in plain-text
- \[15 Feb\] - [Congressmen write to Apple][letter-to-apple] with several questions about Apple policies. 
- \[15 Feb\] - Apple makes a statement that ["any app wishing to access contact data will require explicit user approval"][apple-response]
- \[22 Feb\] - California Attorney General brings major tech vendors together to ensure [all mobile apps come with a privacy policy][mobile-privacy-guidelines]


<!-- ### Links -->

[thanmpi-post]: http://mclov.in/2012/02/08/path-uploads-your-entire-address-book-to-their-servers.html

[path-ceo-comment]: http://mclov.in/2012/02/08/path-uploads-your-entire-address-book-to-their-servers.html#comment-432242293

[hn-post]: http://news.ycombinator.com/item?id=3563016

[curtis-post]: http://dcurt.is/stealing-your-address-book

[path-apology]: http://blog.path.com/post/17274932484/we-are-sorry

[ny-times-article]: http://bits.blogs.nytimes.com/2012/02/12/disruptions-so-many-apologies-so-much-data-mining/

[venture-beat-article]: http://venturebeat.com/2012/02/14/iphone-address-book/

[letter-to-apple]: http://thenextweb.com/apple/2012/02/15/congress-sends-letter-to-apple-questioning-the-path-debacle-developer-data-access/

[apple-response]: http://allthingsd.com/20120215/apple-app-access-to-contact-data-will-require-explicit-user-permission/

[mobile-privacy-guidelines]: http://techcrunch.com/2012/02/22/apple-google-and-others-agree-to-mobile-app-privacy-policy-guidelines/

[perscon-site]: http://perscon.net/overview/

[horizon-institute]: http://www.horizon.ac.uk/Horizon-Research
