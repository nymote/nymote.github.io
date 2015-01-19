---
layout: post
title: "Unikernels for everyone!"
author: Amir Chaudhry
date: 2015-01-19 13:00:00
tags: [mirage, nymote, ocaml, unikernel]
description:
shorturl: http://nymote.org/blog/2015/unikernels-for-everyone/
---
{% include JB/setup %}

Many people have now set up unikernels for blogs, documenting their
experiences for others to follow.  Even more important is that people are
going beyond static sites to build unikernels that provide more complicated
services and solve real-world problems.

To help newcomers get started, there are now even more posts that that use
different tools and target different deployment methods.  Below are summaries
of some of the posts I found interesting and that will make it easier for you
try out different ways of creating and deploying your unikernels.

### Unikernel blogs with MirageOS ###

Mindy picked up where the [first set of instructions][jekyll-unikernel]
finished and described her work to get an Octopress blog running on Amazon EC2.
As one of the first people outside the core team to work on this, she had a
lot of interesting experiences — which included getting into the Mirage
networking stack to debug an issue and submit a bugfix!  More recently, she
also wrote a couple of excellent posts on *why* she uses a unikernel for her
blog.  These posts cover the security concerns (and responsibility) of running
networked services on today's Internet and the importance of owning your
content — both ideas are at the heart of the work behind [Nymote][] and are
well worth reading.

- *Mindy's posts*
  - *Overview* - ["I Am Unikernel (and So Can You!)"][mindy-overview]
  - *First in her Mirage series* - ["It's a Mirage! (or, How to Shave a Yak.)"][mindy-first]
  - ["Attack Surface: Why I Unikernel, Part 1"][mindy-uk1]
  - ["My Content Is Mine: Why I Unikernel, Part 2"][mindy-uk2]

Ian took a different path to AWS deployment by using Vagrant and Test Kitchen
to to get his static site together and build his unikernel, and then Packer to
create the images for deployment to EC2.  All succinctly explained with code
available on GitHub for others to try out!

- *Ian on* ["Mirage with Jekyll on Amazon EC2"][mir-jekyll]

Toby wanted to put together a blog that was a little more complicated than a
traditional static site, with specific features like subdomains based on tags
and the ability to set future dates for posts. He also pulled in some other
libraries so he can use Mustache for sever-side rendering, where his blog
posts and metadata are stored as JSON and rendered on request.

- *Toby on* ["Building a Blog with MirageOS"][toby-blog]

Chris saw others working to get unikernel blogs on EC2 and decide he'd try
getting his up and running on Linode instead.  He is the first person to
deploy his unikernel to Linode and he provided a great walkthough with helpful
screenshots, as well as brief notes about the handful of differences compared
with EC2.  Chris also wrote about the issue he had with clean urls (i.e
serving `/about/index.html` when a user visits `/about/`) — he describes the
things he tried out until he was finally able to fix it.  

- *Chris' posts*
  - *Setting up a unikernel* - ["About Not Found"][chris-unikernel]
  - *Deploying to Linode* - ["Hello Linode"][chris-linode]

Phil focused on getting unikernels running on a cubieboards, which are ARM
based development boards — similar to the Raspberry Pi. He starts by taking
Mirage's pre-built [Cubieboard images][arm-tarball] — which makes it easy to
get Xen and an OCaml environment set up on the board — and getting this
installed on the Cubieboard.  He also noted the issues he came across along
with the simple tweaks he made to fix them and finally serves a Mirage hello
world page.

- *Phil on* ["Some Notes on Building and Running Mirage Unikernels on Cubieboard2"][phil]


### More than just static sites ###

Static sites have become the new 'hello world' app. They're simple to manage,
low-risk and provide lots of opportunities to experience something new.  These
aspects make them ideal for discovering the benefits (and trade offs) of the
unikernel approach and I look forward to seeing what variations people come up
with — For instance, there aren't any public instructions for deploying to
Rackspace so it would be great to read about someone's experiences there.
However, there are also many other applications that also fit the above
criteria of simplicity, low risk and plentiful learning opportunities. 

Thomas Leonard decided to create a unikernel for a simple REST service for
queuing package uploads for 0install.  His post takes you from the very
beginning, with a simple hello world program running on Xen, all the way
through to creating his REST service. Along the way there a lots of code
snippets and explanations of the libraries being used and what they're doing.
This is a great use-case for unikernels and there are a lot of interesting
things to take from this post, for example the ease with which Thomas was able
to find and fix bugs using regular tools. There's also lots of information on
performance testing and optimising of the unikernel, which he covers in a
follow-up post, and he even built tools to visualise the traces. 

- *Thomas' posts*
  - *Hello world and REST service* - ["My First Unikernel"][tom-unikernel]
  - *Profiling and optimisations* - ["Optimising the Unikernel"][tom-optimise]
  - *Tool to visualise traces* - ["Visualising an Asynchronous Monad"][tom-profile]

Of course, there's much more activity out there than described in this post as
people continually propose ideas on the [Mirage mailing list][mir-mail] — both
for things they would like to try out and issues they came up against. In my
[last post][nym-jekyll], I pointed out that the workflow is applicable to any
type of unikernel and as Thomas showed, with bit of effort it's already
possible to create useful, real-world services using the many libraries that
already exist. There's also a lot of scaffolding in the [mirage-skeleton][]
repo that you can build on which makes it even easier to get involved.  If you
want to dive deeper into the libraries and perhaps learn OCaml, there are lots
of [resources online][ocamlorg] and [projects][] to get involved with too.

Now is a great time to try building a unikernel for yourself and as you can
see from the posts above, shared experiences help other people progress
further and branch out into new areas. When you've had a chance to try
something out please do share your experiences online! 


<!-- ===== LINKS ===== -->

[jekyll-unikernel]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines/
[nymote]: http://nymote.org/
[mindy-overview]: http://www.somerandomidiot.com/blog/2014/08/18/i-am-unikernel/
[mindy-first]: http://www.somerandomidiot.com/blog/2014/03/14/its-a-mirage/
[mindy-uk1]: http://www.somerandomidiot.com/blog/2014/08/11/attack-surface-area/
[mindy-uk2]: http://www.somerandomidiot.com/blog/2014/08/14/my-content-is-mine/

[mir-jekyll]: https://github.com/iw/mirage-jekyll

[toby-blog]: http://ocaml.is-awesome.net/2014/11/building-a-blog-with-mirage-os

[chris-unikernel]: http://christopherbothwell.com/ocaml/mirage/2014/12/03/about-not-found.html
[chris-linode]: http://christopherbothwell.com/ocaml/mirage/linode/2014/12/08/hello-linode.html

[arm-tarball]: http://blobs.openmirage.org
[phil]: http://philtomson.github.io/blog/2014/09/10/some-notes-on-building-and-running-mirage-unikernels-on-cubieboard2/

[tom-unikernel]: http://roscidus.com/blog/blog/2014/07/28/my-first-unikernel/ 
[tom-optimise]: http://roscidus.com/blog/blog/2014/08/15/optimising-the-unikernel/
[tom-profile]: http://roscidus.com/blog/blog/2014/10/27/visualising-an-asynchronous-monad

[mir-mail]: http://lists.xenproject.org/cgi-bin/mailman/listinfo/mirageos-devel
[nym-jekyll]: http://nymote.org/blog/2014/from-jekyll-site-to-unikernel/
[mirage-skeleton]: https://github.com/mirage/mirage-skeleton
[ocamlorg]: http://ocaml.org/learn/books.html
[projects]: https://github.com/mirage/mirage-www/wiki/Pioneer-Projects
