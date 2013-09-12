---
layout: post
title: "IndieWebCamp UK"
author: Amir Chaudhry
tags: []
---
{% include JB/setup %}

Last weekend I went down to Brighton for IndieWebCamp UK. I first heard about Indie Web via a [Wired article][indie-web-wired] which led me to discover [IndieWebCamp UK][] in Brighton.  The original idea behind Indie Web was around people owning their content and creating tools that syndicate to elsewhere on the web.  

## About Indie Web Camp

<a href="/images/indiewebcampuk-2013/01-large.png"><img style="float:right; margin-left: 15px;" src="/images/indiewebcampuk-2013/01.jpg"></a>
> What is the IndieWeb?
> 
> We should all own the content we're creating, 
> rather than just posting to third-party content silos. 
> Publish on your own domain, and syndicate out to silos.
> This is the basis of the 'Indie Web' movement. 

The aims are now much wider than this as the discussions on the day covered topics from design to peer-to-peer networking and the digital self, all from the perspective of individual ownership.  There was an emerging concept of 'Indie Data', under which all aspects of a user's data (and digital self) could be discussed.  It was a great event and the goals of Indie Web mirror our own.  
<!--I was there for the unconference format on Saturday and below is a summary of the day.-->

## Saturday unconference

<a href="/images/indiewebcampuk-2013/02-large.png"><img style="float:left; margin-right: 15px;" src="/images/indiewebcampuk-2013/02.jpg"></a>
During the morning everyone gave 3 minute introductions about their projects and tools.  Lots of people talked about their blogging infrastructure and mechanisms for syndicating the information out to twitter and elsewhere.  I spoke about the [Nymote][] toolstack, focusing more on [Signpost][] as a means of providing resilient connections between an individual's devices.  It would have been great if there was time for a demo of [Mirage](/software/mirage), especially creating the self-hosting website, as that would fit well with the workflows I saw.  You can run through the instructions and [try for yourself][mirage-install]!  In any case, my talk led to discussions later on about how we're represented online, and how we can gather our data under our control.  For example, Tom and Mike are working on [Keybits][], making it simple and easy for people to set up personal servers and [Aral][] is working on [Codename Promethus][], which is a user-experience-driven open-source project (he'll reveal more himself in due course -- but it's pretty exciting).  The guys from [Mailpile][] were also there, after their hugely successful [crowdfunding campaign][mailpile-indiegogo], and it was great to chat about problems and solutions related to how we use email.  

<a href="http://www.flickr.com/photos/99930774@N08/9712260140/"><img style="float:right; margin-left: 15px;" width="540" src="/images/brighton-food-fest.jpg"></a>
Lunch was fantastic because we had the [Brighton and Hove food festival][food-fest] literally on our doorstep.  There were so many stalls to choose from with food from all over the world.  At times it felt like the whole town had turned up and there was a great atmosphere.  Brighton is definitely a great place.

Overall, [Nymote][] as a toolstack fits extremely well with the projects I saw because it deals with some of the fundamental problems people need to solve.  For the case of Indie Web participants that meant dealing with identity and authentication ([Signpost][]) as well as connectivity ([Signpost][] again) and deployment ([Mirage][]).  We did briefly discuss immutable datastores and sync problems, where [Irminsule][] is relevant.  I've collected some of these projects on a [links page][], which I'll be adding to over time.  Please do [send me][email-link] any interesting things which should go on that list.

On a personal note, it was great to meet [Alf][] for the first time who is the guy behind [HubMed][], an alternative interface to [PubMed][] (a biomedical academic papers database).  I used HubMed while writing my PhD Thesis because it output BibTex for me and I remember emailing Alf with bug reports way back in January 2006.  The site was so useful that I've never forgotten it and it was a pleasure to be able to thank him directly (albeit 7 years later).

Below are some quick notes I took during the sessions I attended.

[indie-web-wired]: http://www.wired.com/wiredenterprise/2013/08/indie-web/
[IndieWebCamp UK]: http://indiewebcamp.com/2013/UK
[Nymote]: http://nymote.org
[signpost]: /software/signpost
[mirage-install]: http://www.openmirage.org/wiki/install
[Keybits]: http://www.keybits.net
[Aral]: https://twitter.com/aral
[Codename Promethus]: http://aralbalkan.com/notes/codename-prometheus/
[Mailpile]: http://www.mailpile.is
[mailpile-indiegogo]: http://www.indiegogo.com/projects/mailpile-taking-e-mail-back
[Alf]: https://twitter.com/invisiblecomma
[HubMed]: http://www.hubmed.org
[PubMed]: http://www.ncbi.nlm.nih.gov/pubmed
[Mirage]: /software/mirage
[Irminsule]: /software/irminsule
[links page]: /links
[food-fest]: http://brightonfoodfestival.com
[email-link]: mailto:amir@nymote.com?subject=New%20link%20to%20consider!

### Collaborative real-time data

&#x20; <iframe style="float:right; margin-left: 15px; margin-bottom: 15px" width="560" height="315" src="//www.youtube-nocookie.com/embed/NSTZ4mIv_wk?rel=0" frameborder="0" allowfullscreen="true">Aral on Woot</iframe>
Specific things mentioned include Woot (see video below), [WebRTC][], [Camlistore][] and [PeerCDN][].  Also some brief discussion about peer-to-peer and how it can benefit companies, with the example of Spotify.  Apparently 80% of plays on Spotify come from only 12% of their catalogue and they use P2P technology to get content to users faster and reduce their own bandwidth costs.

> Instead of downloading a single song file from its own server to you, Spotify searches for copies of the song wherever it can find them, including the computers of other Spotify users.  
*(from [NPR][NPR-spotify])*

[NPR-spotify]: http://www.npr.org/blogs/therecord/2011/11/09/141594727/how-spotify-works-pay-the-majors-use-p2p-technology
[WebRTC]: http://www.webrtc.org
[Camlistore]: http://camlistore.org
[PeerCDN]: https://peercdn.com

### User Experience Design

Aral spoke about user experience design. Open-source has had a massive positive impact for other developers and industry but very few projects directly make it to mainstream consumer adoption.  Believes that this is because design is treated as something you put on afterwards, rather than a core principle.  

Essentially, people still perceive a difference between design and development where there shouldn't be one.  An analogy would be developers working in isolation from QA.  Designers need to understand developers and developers whould incorporate design.  Introduced [Codename Promethus][] and had a roundtable discussion about design and development practices.

During the discussion, Aral raised an interesting point that scratching your own itch only solves problems for people who have the same itch (i.e people like yourselves, other developers).  To reach mainstream adoption, developers and designers need to think *beyond* their own problems.


### Privacy and tools for the future

An open and wide ranging discussion around privacy online, secure communications and responsibility.  One of the questions posed was whether developers have a responsibility for security and safety regarding the software they create.  The general feeling was that yes, they do but an analogy about food regulations was also made and the role of government was brought up.

There were some practical discussions about problems of key exchange and identity online as well as how people can use their domain as an identifier. The latter is where [Signpost][] will help.

### Movie: Terms and Conditions May Apply

&#x20; <iframe style="float:left; margin-right: 15px; margin-bottom: 15px" src="//player.vimeo.com/video/57182041?byline=0&amp;portrait=0" width="540" height="304" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen="true">tacma vimeo trailer</iframe>
To wrap up the day we had the first UK screening of [Terms and Conditions May Apply][tacma].  This was a fascinating look at how the interests of centralised companies diverge from what is best for the end users and how incremental changes over time have led us to a world where we routinely hand over ongoing access to our personal lives.  It's a great movie to show people who may not understand the problem but at the same time it doesn't do enough at the end to demonstrate ways out of the current situation.

You can find reviews of the movie on [IMDB][] and the trailer is above.  If you happen to be in Cambridge UK and would like me to set up a screening of the movie, please do [get in touch][email-tacma].


[tacma]: http://tacma.net
[IMDB]: http://www.imdb.com/title/tt2084953/
[email-tacma]: mailto:amir@nymote.com?&subject=Terms%20and%20Conditions%20movie
