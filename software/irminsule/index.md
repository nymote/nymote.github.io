---
layout: page
title: Irminsule
tagline: "A branch-consistent 'git-like' database"
---
{% include JB/setup %}

## Sync and backup built in

<img style="float:right;" src="/images/tree_of_digital_life.png">
Having multiple devices has made the engineering effort around data 
persistence and sync more complex.  We have to concern ourselves about how 
data obtained for one device is made available and useful to others, without 
losing history.  **Irminsule** is a new kind of library database, based on 
the principles of Git (the version control system), meaning that all history 
can be kept and moved between devices with ease.

Many third-party services have arisen to tackle the specific issue of how 
our content remains synchronised across our devices. Yet most of them rely 
on the premise of having one canonical location from which all other devices 
take their cues.  This is invariably somewhere up in the cloud and is 
subject to the whims of the providers.  Developers have had good distributed solutions that don't rely on one authority but why have such 
such approaches not made it into more mainstream products?

**Irminsule** is a library database that takes the principles behind tools 
like Git and applies them to the wider problem of storing and syncing our 
data.  This allows the possibility for all software using the Irminsule 
layer to remain in sync as changes can be pushed directly from one location 
to another.  It also allows the possibility of reverting to previous 
versions of any content as all history is also preserved.

<div align="right"><small><em>Image credit: <a href="http://adoomer.deviantart.com/art/Tree-of-digital-life-191421032">Tree of digital life</a> by <a href="http://adoomer.deviantart.com">Adoomer</a></em></small></div>

<!-- <img style="float:left;" src="/images/tree_of_life.png"> -->
