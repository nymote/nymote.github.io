---
layout: post
title: "Brewing MISO to serve Nymote"
author: Amir Chaudhry
date: 2015-01-20 14:00:00
tags: [calendar, contacts, irmin, mail, mirage, nymote, ocaml, signpost, unikernel]
description:
shorturl: http://nymote.org/brewing-miso-to-serve-nymote/
---
{% include JB/setup %}

The [mission of Nymote][nymote-mission] is to enable the creation of resilient
decentralised systems that incorporate privacy from the ground up, so that
users retain control of their networks and data.  To achieve this, we
reconsider all the old assumptions about how software is created in light of
the problems of the modern, networked environment.  Problems that will become
even more pronounced as more devices and sensors find their way into our lives.

We want to make it simple for anyone to be able to run a piece of the cloud
for their own purposes and the first three applications Nymote targets are
Mail, Contacts and Calendars, but to get there, we first have to create solid
foundations.


### Defining the bedrock ###

In order to create applications that work for the user, we first have to
create a robust and reliable software stack that takes care of fundamental
problems for us. In other words, to be able to assemble the applications we
desire, we must first construct the correct building blocks.

We've taken a clean-slate approach so that we can build long-lasting solutions
with all the benefits of hindsight but none of the baggage. As
mentioned in earlier posts, there are three main components of the stack,
which are: [Mirage][] (OS for the Cloud/IoT), [Irmin][] (distributed datastore)
and [Signpost][] (identity and connectivity) - all built using the [OCaml][]
programming language.

#### Using the MISO stack to build Nymote ####

As you've already noticed, there's a useful acronym for the above tools —
**MISO**. Each of the projects mentioned is a serious undertaking in its own
right and each is likely to be impactful as a stand-alone concept.  However,
when used together we have the opportunity to create applications and services
with high levels of security, scalability and stability, which are not easy to
achieve using other means. 

In other words, MISO is the *toolstack* that we're using to build Nymote —
Nymote is the *decentralised system* that works for its users.

Each of the projects is at a different phase but they have all have made great
strides over the last year.

#### Mirage ####

Mirage — a library operating system that constructs unikernels — is the most
mature part of the stack. I previously wrote about the
[Mirage 1.0 release][mir-10] and only six months later we had an
[impressive 2.0 release][mir-20], with continuing advances throughout the year.
We achieved major milestones such as the ability to deploy unikernels to
ARM-based devices, as well as a clean-slate implementation of the transport
layer security (TLS) protocol.

In addition to the development efforts, there have also been many
presentations to audiences, ranging from [small groups of startups][ac-ef-talk]
all the way to [prestigious keynotes][31c3-talk] with 1000+ attendees.  Ever
since we've had ARM support, the talks themselves have been delivered from
unikernels running on Cubieboards and you can see the growing collection of
slides at [decks.openmirage.org][decks].

All of these activities have led to a tremendous increase in public awareness
of unikernels and the value they can bring to developing robust, modern
software as well as the promise of [immutable infrastructure][after-docker].
As more people look to get involved and contribute to the codebase, we've also
begun curating a set of [Pioneer Projects][pioneer], which are suitable for a
range of skill-levels.

You can find much more information on all the activities of 2014 in the
comprehensive [Mirage review post][mirage-review]. As it's the most mature
component of the MISO stack, anyone interested in the *development of code*
towards Nymote should join the [Mirage mailing list][mir-mail].

- *Source code* - [Mirage org on GitHub](https://github.com/mirage)

#### Irmin ####

Irmin — a library to persist and synchronize distributed data structures —
made significant progress last year. It's based on the principles of Git, the
distributed version control system, and allows developers to choose the
appropriate combination of consistency, availability and partition tolerance
for their needs.

Early last year Irmin was released as an alpha with the ability to speak
'fluent Git' and by the summer, it was supporting user-defined merge
operations and fast in-memory views.  A couple of summer projects improved the
[merge strategies][merge-strat] and synchronisation strategies, while an
external project — Xenstore — used Irmin to [add fault-tolerance][xirminstore].

More recent work has involved a big clean-up in the user-facing API (with nice
[developer documentation][irmin-docs]) and a cleaner high-level REST API.
Upcoming work includes proper documentation of the REST API, which means Irmin
can more easily be used in non-OCaml projects, and full integration with
Mirage projects. 

Irmin is already being used to create
[a version controlled IMAP server][imaplet] and
[a version controlled distributed log system][irmin-dog]. It's no surprise
that the first major release is coming [very soon][irmin-10]!

- *Source code* - [Irmin on GitHub](https://github.com/mirage/irmin)

#### Signpost ####

Signpost will be a collection of libraries that aims to provide identity and
connectivity between devices.  Forming efficient connections between
end-points is becoming ever more important as the number of devices we own
increases. These devices need to be able to recognise and reach each-other,
regardless of their location on the network or the obstacles in between. 

This is very much a nascent project and it involves a lot of work on
underlying libraries to ensure that security aspects are properly considered.
As such, we must take great care in how we implement things and be clear about
any trade-offs we make. Our thoughts are beginning to converge on a design we
think will work and that we would entrust with our own data, but we're
treating this as a case of 'Here Be Dragons'.  This is a critical piece of the
stack and we'll share what we learn as we chart our way towards it.

Even though we're at the design stage of Signpost, we did substantial work
last year to create the libraries we might use for implementation.  A
particularly exciting one is [Jitsu][] — which stands for Just In Time
Summoning of Unikernels. This is a DNS server that spawns unikernels in
response to DNS requests and boots them in real-time with no perceptible lag
to the end user.  In other words, it makes much more efficient use of
resources and significantly reduces latency of services for end-users —
services are only run *when* they need to be, in the *places* they need to be. 

There's also been lots of efforts on other libraries that will help us
*iterate towards* a complete solution. Initially, we will use pre-existing
implementations but in time we can take what we've learned and create more
robust alternatives. Some of the libraries are listed below (but note the
friendly disclaimers!). 

- *Source code*
  - [Bindings to libsodium](https://github.com/dsheets/ocaml-sodium)
  - [Implementation of DNSCurve](https://github.com/dsheets/ocaml-dnscurve)
  - [Bindings to libmacaroons](https://github.com/dsheets/ocaml-libmacaroons)


#### OCaml ####

[OCaml][ocamlorg] is a mature, powerful and highly pragmatic language.  It's
proven ideal for creating robust systems applications and
[many others][ocaml-co] also recognise this.  We're using it to create all the
tools you've read about so far and we're also helping to improve the ecosystem
around it.

One of the major things we've been involved with is the coordination of the
OCaml Platform, which combines the OCaml compiler with a coherent set of tools
and workflows to be more productive in the language and speed up development
time.  We presented the first major release of these efforts at OCaml 2014 and
you can [read the abstract][platform-pdf] or [watch the video][platform-video].

There's more to come, as we continue to improve the tooling and also support
the community in [other ways][gov-post].


### Early steps towards applications ###

Building blocks are important but we also need to push towards working
applications.  There are different approaches we've taken to this, which
include building prototypes, wireframing use-cases and implementing features
with other toolstacks.  Some of this work is also part of a larger
[EU funded project][ucn]\* and below are brief summaries of the things we've
done so far. We'll expand on them as we do more over time.

**Mail** - As mentioned above, a prototype IMAP server exists ([IMAPlet][])
which uses Irmin to store data. This is already able to connect to a client to
serve mail. The important feature is that it's an IMAP server which is version
controlled in the backend and can expose a REST API from the mailstore quite
easily.

**Contacts** - We first made wireframe mockups of the features we might like
in a contacts app (to follow in later post) and then built a
[draft implementation][yan-app]. To get here, code was first written in OCaml
and then put through the [js_of_ocaml][] compiler. This is valuable as it
takes us closer to a point where we can build networks using our address books
and have the system take care of sharing details in a privacy-conscious manner
and with minimal maintenance. The [summary post][yan-writeup] has more detail.

**Calendar** - This use-case was approached in a completely different way as
part of a hackathon last year. A rough but functional prototype was built over
one weekend, with a team formed at the event.  It was centralised but it
tested the idea that a service which integrates intimately with your life (to
the point of being very invasive) can provide disproportionate benefits.  The
[experience report][seedhack] describes the weekend and our app — Clarity —
won first place. This was *great* validation that the features are desirable
so we need to work towards a decentralised, privacy-conscious version.


### Time to get involved! ###

The coming year represents the best time to be working on the MISO stack and
using it to make Nymote a reality.  All source code is publicly available and
the projects are varied enough that there is something for everyone.  Browse
through issues, consider the [projects][pioneer] or simply write online and
share with us the things you'd like to see.
This promises to be an exciting year!

*Sign up to the [mailing list][nym-list] to keep up to date!*

*\* NB The research leading to these results has received
funding from the European Union's Seventh Framework Programme FP7/2007-2013
under the UCN project, grant agreement no 611001.*

<!-- ========================================================= -->

[nymote-mission]: http://nymote.org/blog/2013/introducing-nymote/
[Mirage]: http://nymote.org/software/mirage/
[Irmin]: http://nymote.org/software/irmin/
[Signpost]: http://nymote.org/software/signpost/
[OCaml]: http://ocaml.org

[mir-10]: http://nymote.org/blog/2014/announcing-first-mirage-release/
[mir-20]: http://openmirage.org/blog/announcing-mirage-20-release
[mir-mail]: http://lists.xenproject.org/cgi-bin/mailman/listinfo/mirageos-devel
[after-docker]: https://medium.com/@darrenrush/after-docker-unikernels-and-immutable-infrastructure-93d5a91c849e
[mir-links]: http://openmirage.org/links
[ac-ef-talk]: http://amirchaudhry.com/describing-miso-entrepreneur-first-2014/
[31c3-talk]: http://media.ccc.de/browse/congress/2014/31c3_-_6443_-_en_-_saal_2_-_201412271245_-_trustworthy_secure_modular_operating_system_engineering_-_hannes_-_david_kaloper.html#video
[decks]: http://decks.openmirage.org
[pioneer]: https://github.com/mirage/mirage-www/wiki/Pioneer-Projects
[mirage-review]: http://openmirage.org/blog/2014-in-review

[merge-strat]: http://gazagnaire.org/pub/FGM15.pdf
[xirminstore]: http://openmirage.org/blog/introducing-irmin-in-xenstore
[irmin-docs]: http://samoht.github.io/irmin/
[imaplet]: https://opam.ocaml.org/packages/imaplet-lwt/imaplet-lwt.0.1.3/
[irmin-dog]: https://github.com/samoht/dog
[irmin-10]: https://github.com/mirage/irmin/issues?q=is%3Aopen+is%3Aissue+milestone%3A1.0.0

[jitsu]: https://github.com/MagnusS/jitsu

[ocamlorg]: http://ocaml.org
[ocaml-co]: http://ocaml.org/learn/companies.html
[gov-post]: http://amirchaudhry.com/towards-governance-framework-for-ocamlorg
[opam-12beta]: http://opam.ocaml.org/blog/opam-1-2-0-beta4/
[platform-programme]: http://ocaml.org/meetings/ocaml/2014/#11401230OCamlNews
[platform-pdf]: http://ocaml.org/meetings/ocaml/2014/ocaml2014_7.pdf
[platform-video]: https://www.youtube.com/watch?v=jxhtpQ5nJHg&list=UUP9g4dLR7xt6KzCYntNqYcw

[ucn]: http://usercentricnetworking.eu
[yan-app]: https://github.com/yansh/contacts-app
[js_of_ocaml]: http://ocsigen.org/js_of_ocaml/
[yan-writeup]: http://yansnotes.blogspot.co.uk/2015/01/work-summary-ocaml-labs.html
[seedhack]: http://seedcamp.com/seedhack-5-0/

[nym-list]: http://nymote.us5.list-manage.com/subscribe?u=8a83b2d5453bba2ee5838b4ad&id=a41245094c
