---
layout: post
title: Towards Statistical Queries over Distributed Data
author: Amir Chaudhry
tags: [apps, behaviour, energy, location, mobile]
excerpt: "Practical uses of personal containers"
---

One of the issues with the distributed nature of personal data is the ability to perform statistical queries over it.  This is true of both aggregated data stores and those that only catalog data, which remains in its original location.  In both cases, a client that wishes to run a query still has to request access to a number of stores and aggregate the results in an efficient manner.  This last piece is exactly the scenario for which [Dataware][] is being designed.  

A new project is taking shape, which will use personal containers and the principles of Dataware to build an employee incentive scheme to optimise energy usage. It's taking place at Cambridge University in two phases.  The first phase is to gather fine-grained data from employees regarding travel habits and energy usage.  The second phase aims to use this information to construct incentive schemes to help optimise the energy usage of employees and monitor the changes.  

Energy use in buildings and in transport systems is rapidly becoming part of our lifelong contextual footprint so the study needs to be completed without participants sacrificing their privacy.  Therefore, the project will enable a user to collect their private information into a personal container which *they own*.  Then the project team can request the ability to run queries over subsets of the data contained in those stores.  This arrangement facilitates the following:-

- Allows the research team to calculate energy use accurately
- Assures users that the data is only used for this application
- Denies the team access to other data that is not relevant

The type of sensitive data relevant to the study will be daily commutes (e.g. GPS information between 8am-10am and 4pm-6pm on weekdays only).  This information could be combined with public data (e.g. traffic data) and a series of incentives constructed to optimise the overall energy usage.  A particularly exciting possibility would be the ability to test various types of incentives with different groups to see which are most effective.  All while preserving the individual privacy of users.

We'll post more information as the project develops, including the hurdles and technical challenges that need to be overcome.  In the meantime, you can read more about the project itself at the [C-AWARE site][].

[Dataware]: http://perscon.net/overview/dataware.html
[Chris Elsmore]: http://elsmorian.com/
[C-AWARE site]: http://www.cl.cam.ac.uk/research/srg/netos/c-aware/
