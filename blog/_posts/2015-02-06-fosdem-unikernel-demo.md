---
layout: post
title: "Unikernel demo at FOSDEM"
author: Amir Chaudhry
date: 2015-02-06 18:10:00
tags: [mirage, nymote, ocaml, unikernel]
description:
shorturl: http://nymote.org/blog/fosdem-unikernel-demo/
---
{% include JB/setup %}

Last weekend was spent at one of the world's biggest open source conferences,
FOSDEM.  You can check out [last year's review][fosdem2014] to get an idea of
the scale of the event. Since there's no registration process, it's difficult
to estimate how many people attend but given how many rooms there are, and how
full they are, it's easily several thousand. I was impressed last year at how
smoothly things went and the same was true this year.

The main reason to attend this time was to run a demo of MirageOS from an ARM
board — one of the main advances since the previous conference. I looked over
all the things we'd achieved since last year and put together a demo that
showcases some of the capabilities as well as being fun.

### 2048 from a Unikernel on an ARM board

The demo was to serve the 2048 game from a Unikernel running on a Cubieboard2
with its own access point.  When people join the wifi network, they get
served a static page and can begin playing the game immediately.  

The components I needed for the demo were:

- Code for the 2048 game — I was able to lift code from a
[tutorial last year][2048], which [Daniel][], [Leo][], [Jeremy][] and
[Thomas][] all contributed to. It was first run at [CUFP 2014][cufp14] then
adapted and presented at [Functional Conf][fuconf-tut] in India (see the
[IOCaml notebook][iocaml-book]).  Attendees wrote the code in OCaml, which was
then compiled into pure JavaScript (via [js_of_ocaml][]). The result can be run
completely in the browser and only involves serving two files.

- Code for making a static website — Since the game is completely
self-contained (one html file and one js file). I only need to convert a static
website into a unikernel.  That's trivial and
[many people have done it before][jekyll-unikernel].

- A Cubieboard with a wifi access point — There are pre-built images on the
[MirageOS website][blobs], which make part of this easy. However, getting the
wifi access point up involves a few more steps.

The first two pieces should be straightforward and indeed, I had a working
unikernel serving the 2048 game within minutes (unix version on my laptop). 
The additional factors around the ARM deployment is where things were a little
more involved. Although this was technically straightforward to set up, it
still took a while to get all the pieces together.  A more detailed
description of the steps is in my [fosdemo repository][fosdemo] and in
essence, it revolves around configuring the wifi access point and setting up a
bridge (thanks to [Mindy][], [Magnus][] and [David][] for getting this
working).

Once this was all up and running, it was a simple matter to configure the
board to boot the unikernel on startup, so that no manual intervention would
be required to set things up at the booth.

#### Running the demo
<a href="https://twitter.com/amirmc/status/561525704161243137/"><img style="float:right; margin-left: 15px;" src="/images/fosdem15-tweet.png"></a>

I gave the demo at the Xen booth and it went very well.  There was a small
crowd throughout my time at the booth I'm convinced that the draw of a board
with glowing LEDs should not be underestimated.  Many people we're happy to
connect to the access point and download the game to their browser but there
were two main things I learnt.

Firstly, demos involving games will work if people actually *know* the game.
This is obvious, but I'd assumed that most people had already played 2048 —
especially the crowd I'd expect to meet at FOSDEM.  It turned out that around
a third of people had no idea what to do when the game loaded onto their
browser. They stared blankly at it and then blankly at me.  Of course, it was
trivial to get them started and they were soon absorbed by it — but it still
felt like some of the 'cool-factor' had been lost.

The second thing was that I tried to explain too much to people in much too
short a time.  This particular demo involved Xen unikernels, js_of_ocaml and a
Cubieboard2 with a wifi access point.
There's a surprisingly large amount of technology there, which
is difficult explain to a complete newcomer within one or two minutes.  When
it was obvious someone hadn't heard of unikernels, I focused on the approach
of library operating systems and the benefits that Mirage brings. If a visitor
was already familiar with the concept of unikernels, I could describe the rest
of the demo in more detail.

Everything else did go well and next time I'd like to have a demo like this
running with [Jitsu][].  That way, I could configure it so that a unikernel
would spin up, serve the static page and then spin down again. If we can
figure out the timing, then providing stats in the page about the lifetime of
that unikernel would also be great, but that's for another time.


##### Sidenote: The beginnings of a 'personal cloud'

One of the things we're keen to work towards is the idea of
[personal clouds][nymote]. It's not a stretch to imagine that a Cubieboard2,
running the appropriate software, could act as one particular node in a
network of your own devices. In this instance it's just hosting a fun and
simple game but more complex applications are also possible.


### Huge range of sessions and talks

Of course, there was lots more going on than just my demo and I had a great
time attending the talks. Some in particular that stood out to me were those
in the [open source design][osd] room, which was a new addition this year. It
was great to learn that there are design people out there who would like to
contribute to open source ([get in touch][amc], if that's you!). I also had a
chance to meet (and thank!) Mike McQuaid in his [Homebrew talk][homebrew].
FOSDEM is one of those great events where you can meet in person all those
folks you've only interacted with online.

Overall, it was a great trip and I thoroughly recommend it if you've never
been before!

[fosdem2014]: http://nymote.org/blog/2014/fosdem-summary/
[2048]: https://github.com/ocamllabs/2048-tutorial/
[cufp14]: http://cufp.org/2014/t7-leo-white-introduction-to-ocaml.html
[iocaml-book]: http://gazagnaire.org/fuconf14/
[js_of_ocaml]: http://ocsigen.org/js_of_ocaml/
[fuconf-tut]: http://booking.agilefaqs.com/functional-conf-2014#workshop-52-info
[jekyll-unikernel]: http://amirchaudhry.com/unikernels-for-everyone/
[blobs]: http://blobs.openmirage.org
[fosdemo]: https://github.com/amirmc/fosdemo
[Jitsu]: https://github.com/MagnusS/jitsu
[nymote]: http://nymote.org
[osd]: https://fosdem.org/2015/schedule/track/open_source_design/
[amc]: https://twitter.com/amirmc
[homebrew]: https://fosdem.org/2015/schedule/event/homebrew_the_good,_bad_and_ugly_of_osx_packaging/

[Leo]: http://www.lpw25.net
[Jeremy]: https://github.com/yallop
[Daniel]: http://erratique.ch
[Thomas]: http://gazagnaire.org
[Mindy]: http://somerandomidiot.com
[Magnus]: http://www.skjegstad.com
[David]: https://github.com/pqwy

