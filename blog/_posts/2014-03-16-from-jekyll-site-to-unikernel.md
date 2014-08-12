---
layout: post
title: "From Jekyll site to Unikernel"
author: Amir Chaudhry
date: 2014-03-16 19:30:00
tags: [mirage]
shorturl: 
---
{% include JB/setup %}

[Mirage][mirage] has reached a point where it's possible to easily set up
end-to-end toolchains to build [unikernels][]! <!--\[If you're not sure what that is, read the post [What is a unikernel?][amc-unikernel]\]-->
My first use-case is to be able to generate a unikernel which can serve my
personal static site but to do it with as much automation as possible. It
turns out this is possible with less than 50 lines of code.

I use Jekyll and GitHub Pages at the moment so I wanted a workflow that's as
easy to use, though I'm happy to spend some time up front to set up and
configure things.
The tools for achieving what I want are in good shape so
this post takes the example of a Jekyll site and goes through
the steps to produce a unikernel on
[Travis CI][] (a continuous integration service) which can later be
deployed.  Many of these instructions already exist in various forms but
they're collated here to aid this use-case.  

I will take you, dear reader, through the process and when we're finished,
the workflow will be as follows:

1. You'll write your posts on your local machine as normal
2. A push to GitHub will trigger a unikernel build for each commit
3. The Xen unikernel will be pushed to a repo for deployment

To achieve this, we'll first check that we can build a unikernel VM locally,
then we'll set up a continuous integration service to automatically build
them for us and finally we'll adapt the CI service to also deploy the built
VM.  Although the amount of code required is small, each of these steps is
covered below in some detail.
For simplicity, I'll assume you already have OCaml and Opam
installed -- if not, you can find out how via the
[Real Word OCaml install instructions][rwo-install].


## Building locally ##

To ensure that the build actually works, you should run things locally at
least once before pushing to Travis.  It's worth noting that the
[mirage-skeleton][] repo contains a lot of useful, public domain examples
and helpfully, the specific code we need is in
[mirage-skeleton/static_website][static-site].  Copy both the `config.ml`
and `dispatch.ml` files from that folder into a new `_mirage` folder in your
jekyll repository.

Edit `config.ml` so that the two mentions of `./htdocs` are replaced with
`../_site`.  This is the only change you'll need to make and you should now
be able to build the unikernel with the unix backend.  Make sure you have
the mirage package installed by running `$ opam install mirage` and then run:

{% highlight bash %}
$ cd _mirage
$ mirage configure --unix
$ make depend       # needed as of mirage 1.2
$ mirage build
$ cd ..
{% endhighlight %}

That's all it takes!  In a few minutes there will be a unikernel built on
your system (symlinked as `_mirage/mir-www`).  If there are any errors, make
sure that Opam is up to date and that you have the latest version of the
static_website files from [mirage-skeleton][]. 

### Serving the site locally ###

If you'd like to see this site locally, you can do so from within the
`_mirage` folder by running unikernel you just built.  There's more
information about the details of this on the [Mirage docs site][mir-www-docs]
but the quick instructions are:

{% highlight bash %}
$ cd _mirage
$ sudo mirage run

# in another terminal window
$ sudo ifconfig tap0 10.0.0.1 255.255.255.0
{% endhighlight %}

You can now point your browser at http://10.0.0.2/ and see your site!
Once you're finished browsing, `$ mirage clean` will clear up all the
generated files. 

Since the build is working locally, we can set up a continuous integration
system to perform the builds for us.


## Setting up Travis CI ##
<img style="float: right; margin-left: 10px" src="http://amirchaudhry.com/images/jekyll-unikernel/travis.png"></img>

We'll be using the [Travis CI][] service, which is free for open-source
projects (so this assumes you're using a public repo).  The benefit of using
Travis is that you can build a unikernel *without* needing a local OCaml
environment, but it's always quicker to debug things locally.

Log in to Travis using your GitHub ID which will then trigger a scan of your
repositories.  When this is complete, go to your Travis accounts page and
find the repo you'll be building the unikernel from.  Switch it 'on' and
Travis will automatically set your GitHub post-commit hook and token for you.
That's all you need to do on the website.

When you next make a push to your repository, GitHub will inform Travis,
which will then look for a YAML file in the root of the repo called
`.travis.yml`.  That file describes what Travis should do and what the build
matrix is.  Since OCaml is not one of the supported languages, we'll be
writing our build script manually (this is actually easier than it sounds).
First, let's set up the YAML file and then we'll examine the build script.

### The Travis YAML file - .travis.yml ###

The [Travis CI environment][travis-os] is based on Ubuntu 12.04, with a
number of things pre-installed (e.g Git, networking tools etc).  Travis
doesn't support OCaml (yet) so we'll use the `c` environment to get the
packages we need, specifically, the OCaml compiler, Opam and Mirage. Once
those are set up, our build should run pretty much the same as it did locally.

For now, let's keep things simple and only focus on the latest releases
(OCaml 4.01.0 and Opam 1.1.1), which means our build matrix is very simple.
The build instructions will be in the file `_mirage/travis.sh`, which we
will move to and trigger from the `.travis.yml` file.  This means our YAML
file should look like:

{% highlight yaml %}
language: c
before_script: cd _mirage
script: bash -ex travis.sh
env:
  matrix:
  - MIRAGE_BACKEND=xen DEPLOY=0
  - MIRAGE_BACKEND=unix
{% endhighlight %}

The matrix enables us to have parallel builds for different environments and
this one is very simple as it's only building two unikernels. One worker
will build for the Xen backend and another worker will build for the Unix
backend. The `_mirage/travis.sh` script will clarify what each of these
environments translates to.  We'll come back to the `DEPLOY` flag later on
(it's not necessary yet).  Now that this file is set up, we can work on the
build script itself.

### The build script - travis.sh ###

To save time, we'll be using an Ubuntu PPA to quickly get
[pre-packaged versions of the OCaml compiler and Opam][anil-ppa], so the
first thing to do is define which PPAs each line of the build matrix
corresponds to.  Since we're keeping things simple, we only need one PPA
that has the most recent releases of OCaml and Opam.

{% highlight bash %}
#!/usr/bin/env bash
ppa=avsm/ocaml41+opam11
echo "yes" | sudo add-apt-repository ppa:$ppa
sudo apt-get update -qq
sudo apt-get install -qq ocaml ocaml-native-compilers camlp4-extra opam
{% endhighlight %}

[NB: There are many [other PPAs][anil-ppa] for different combinations of
OCaml/Opam which are useful for testing].  Once the appropriate PPAs have
been set up it's time to initialise Opam and install Mirage. 

{% highlight bash %}
export OPAMYES=1
opam init
opam install mirage
eval `opam config env`
{% endhighlight %}

We set `OPAMYES=1` to get non-interactive use of Opam (it defaults to 'yes'
for any user input) and if we want full build logs, we could also set
`OPAMVERBOSE=1` (I haven't in this example).
The rest should be straight-forward and you'll end up with an
Ubuntu machine with OCaml, Opam and the Mirage package installed.  It's now
trivial to do the next step of actually building the unikernel!

{% highlight bash %}
mirage configure --$MIRAGE_BACKEND
mirage build
{% endhighlight %}

You can see how we've used the environment variable from the Travis file and
this is where our two parallel builds begin to diverge.  When you've saved
this file, you'll need to change permissions to make it executable by doing
`$ chmod +x _mirage/travis.sh`.

That's all you need to build the unikernel on Travis!  You should now commit
both the YAML file and the build script to the repo and push the changes to
GitHub.  Travis should automatically start your first build and you can
watch the console output online to check that both the Xen and Unix backends
complete properly.  If you notice any errors, you should go back over your
build script and fix it before the next step.

*\[NB: If you have a larger site, you may have to use a different file system
option for the configuration. Specifically,
*`$ FS=fat mirage configure --$MIRAGE_BACKEND`*, which will crate a disk
image of the website content using the [FAT file system][fat] format
(*`fat1.img`*). This means you'll also need to keep track of the disk image
for the deployment stage as your unikernel VM will connect to it. Look at the
[nymote build script][nym-script] for an example.\]*

## Deploying your unikernel ##
<img style="float: right; margin-left: 10px" src="http://amirchaudhry.com/images/jekyll-unikernel/octocat.png"></img>

When Travis has finished its builds it will simply destroy the worker and
all its contents, including the unikernels we just built.  This is perfectly
fine for testing but if we want to also *deploy* a unikernel, we need to get
it out of the Travis worker after it's built. In this case, we want to
extract the Xen-based unikernel so that we can later start it on a Xen-based
machine (e.g Amazon, Rackspace or - in our case - a machine on [Bytemark][]).

Since the unikernel VMs are small (only tens of MB), our method for
exporting will be to commit the Xen unikernel into a repository on GitHub.
It can be retrieved and started later on and keeping the VMs in version
control gives us very effective snapshots (we can roll back the site without
having to rebuild).  This is something that would be much more challenging
if we were using the 'standard' web toolstack.

The deployment step is a little more complex as we have to send the
Travis worker a private SSH key, which will give it push access to a GitHub
repository.  Of course, we don't want to expose that key by simply adding it
to the Travis file so we have to encrypt it somehow. 


### Sending Travis a private SSH key ###

Travis supports [encrypted environment variables][travis-key]. Each
repository has its own public key and the [Travis gem][travis-gem] uses
this public key to encrypt data, which you then add to your `.travis.yml`
file for decryption by the worker.  This is meant for sending things like
private API tokens and other small amounts of data. Trying to encrypt an SSH
key isn't going to work as it's too large.  Instead we'll use
[travis-senv][], which encodes, encrypts and chunks up the key into smaller
pieces and then reassembles those pieces on the Travis worker.  We still use
the Travis gem to encrypt the pieces to add them to the `.travis.yml` file.

While you could give Travis a key that accesses your whole GitHub account, my
preference is to create a *new* deploy key, which will only be used for
[deployment to one repository][github-deploy].

{% highlight bash %}
# make a key pair on your local machine
$ cd ~/.ssh/
$ ssh-keygen -t dsa -C "travis.deploy" -f travis-deploy_dsa
$ cd -
{% endhighlight %}

Note that this is a 1024 bit key so if you decide to use a 2048 bit key,
then be aware that Travis [sometimes has issues][rsa-key]. Now that we have
a key, we can encrypt it and add it to the Travis file. 

{% highlight bash %}
# on your local machine

# install the necessary components
$ gem install travis
$ opam install travis-senv

# chunk the key, add to yml file and rm the intermediate
$ travis-senv encrypt ~/.ssh/travis-deploy_dsa _travis_env
$ cat _travis_env | travis encrypt -ps --add
$ rm _travis_env
{% endhighlight %}

`travis-senv` encrypts and chunks the key locally on your machine, placing
its output in a file you decide (`_travis_env`).  We then take that output
file and pipe it to the `travis` ruby gem, asking it to encrypt the input,
treating each line as separate and to be appended (`-ps`) and then actually
adding that to the Travis file (`--add`).  You can run `$ travis encrypt -h`
to understand these options.  Once you've run the above commands,
`.travis.yml` will look as follows.

{% highlight yaml %}
language: c
before_script: cd _mirage
script: bash -ex travis.sh
env:
  matrix:
  - MIRAGE_BACKEND=xen DEPLOY=0
  - MIRAGE_BACKEND=unix
  global:
  - secure: ".... encrypted data ...."
  - secure: ".... encrypted data ...."
  - secure: ".... encrypted data ...."
  ...
{% endhighlight %}

The number of secure variables added depends on the type and size of the key
you had to chunk, so it could vary from 8 up to 29. We'll commit
these additions later on, alongside additions to the build script.

At this point, we also need to make a repository on GitHub
and add the public deploy key so
that Travis can push to it.  Once you've created your repo and added a
README, follow GitHub's instructions on [adding deploy keys][github-deploy]
and paste in the public key (i.e. the content of `travis-deploy_dsa.pub`).  

Now that we can securely pass a private SSH key to the worker
and have a repo that the worker can push to, we need to
make additions to the build script.


### Committing the unikernel to a repository ###

Since we can set `DEPLOY=1` in the YAML file we only need to make
additions to the build script.  Specifically, we want to assure that: only
the Xen backend is deployed; only *pushes* to the repo result in
deployments, not pull requests (we do still want *builds* for pull requests).

In the build script (`_mirage/travis.sh`), which is being run by the worker,
we'll have to reconstruct the SSH key and configure Git.  In addition,
Travis gives us a set of useful [environment variables][travis-env] so we'll
use the latest commit hash (`$TRAVIS_COMMIT`) to name the the VM (which also
helps us trace which commit it was built from).

It's easier to consider this section of code at once so I've explained the
details in the comments. This section is what you need to add at the end of
your existing build script (i.e straight after `mirage build`).

{% highlight bash %}
# Only deploy if the following conditions are met.
if [ "$MIRAGE_BACKEND" = "xen" \
            -a "$DEPLOY" = "1" \
            -a "$TRAVIS_PULL_REQUEST" = "false" ]; then

    # The Travis worker will already have access to the chunks
    # passed in via the yaml file. Now we need to reconstruct 
    # the GitHub SSH key from those and set up the config file.
    opam install travis-senv
    mkdir -p ~/.ssh
    travis-senv decrypt > ~/.ssh/id_dsa # This doesn't expose it
    chmod 600 ~/.ssh/id_dsa             # Owner can read and write
    echo "Host some_user github.com"   >> ~/.ssh/config
    echo "  Hostname github.com"          >> ~/.ssh/config
    echo "  StrictHostKeyChecking no"     >> ~/.ssh/config
    echo "  CheckHostIP no"               >> ~/.ssh/config
    echo "  UserKnownHostsFile=/dev/null" >> ~/.ssh/config

    # Configure the worker's git details
    # otherwise git actions will fail.
    git config --global user.email "user@example.com"
    git config --global user.name "Travis Build Bot"

    # Do the actual work for deployment.
    # Clone the deployment repo. Notice the user,
    # which is the same as in the ~/.ssh/config file.
    git clone git@some_user:amirmc/www-test-deploy
    cd www-test-deploy

    # Make a folder named for the commit. 
    # If we're rebuiling a VM from a previous
    # commit, then we need to clear the old one.
    # Then copy in both the config file and VM.
    rm -rf $TRAVIS_COMMIT
    mkdir -p $TRAVIS_COMMIT
    cp ../mir-www.xen ../config.ml $TRAVIS_COMMIT

    # Compress the VM and add a text file to note
    # the commit of the most recently built VM.
    bzip2 -9 $TRAVIS_COMMIT/mir-www.xen
    git pull --rebase
    echo $TRAVIS_COMMIT > latest    # update ref to most recent

    # Add, commit and push the changes!
    git add $TRAVIS_COMMIT latest
    git commit -m "adding $TRAVIS_COMMIT built for $MIRAGE_BACKEND"
    git push origin master
    # Go out and enjoy the Sun!
fi
{% endhighlight %}

At this point you should commit the changes to `./travis.yml` (don't forget
the deploy flag) and `_mirage/travis.sh` and push the changes to GitHub.
Everything else will take place automatically and in a few minutes you will
have a unikernel ready to deploy on top of Xen! 

You can see both the complete YAML file and build script in use on my
[test repo][], as well as the [build logs][] for that repo
and the [deploy repo][] with a VM.

*\[Pro-tip: If you add *`[skip ci]`* anywhere in your
commit message, Travis will skip the build for that commit.
This is very useful if you're making minor changes, like updating a
README.\]*


## Finishing up ##

Since I'm still using Jekyll for my website, I made a short script in my
jekyll repository (`_deploy-unikernel.sh`) that builds the site, commits the
contents of `_site` and pushes to GitHub. I simply run this after I've
committed a new blog post and the rest takes care of itself.

{% highlight bash %}
#!/usr/bin/env bash
jekyll build
git add _site
git commit -m 'update _site'
git push origin master
{% endhighlight %}

Congratulations! You now have an end-to-end workflow that will produce a
unikernel VM from your Jekyll-based site and push it to a repo.  If you
strip out all the comments, you'll see that we've written less than 50 lines
of code! Admittedly, I'm not counting the 80 or so lines that came for free
in the `*.ml` files but that's still pretty impressive.

Of course, we still need a machine to take that VM and run it but that's a
topic for another post.  For the time-being, I'm still using GitHub Pages
but once the VM is hosted somewhere, I will:

1. Turn off GitHub Pages and serve from the VM -- but still using Jekyll in
the workflow.
2. Replace Jekyll with OCaml-based static-site generation.

Although all the tools already exist to switch now, I'm taking my time so
that I can easily maintain the code I end up using.


## Expanding the script for testing ##

You may have noticed that the examples here are not very flexible or
extensible but that was a deliberate choice to keep them readable.  It's
possible to do much more with the build matrix and script, as you can see
from the Travis files on my [website repo][amc-repo], which were based on
those of the [Mirage site][mir-repo] and [Mort's site][mort-repo].
Specifically, you can note the use of more environment variables and case
statements to decide which PPAs to grab.  Once you've got your builds
working, it's worth improving your scripts to make them more maintainable
and cover the test cases you feel are important.


### Not just for static sites (surprise!) ###

You might have noticed that in very few places in the toolchain above have I
mentioned anything specific to static sites per se.  The workflow is simply
(1) do some stuff locally, (2) push to a continuous integration service
which then (3) builds and deploys a Xen-based unikernel.  Apart from the
convenient folder structure, the specific work to treat this as a static
site lives in the `*.ml` files, which I've skipped over for this post.  

As such, the GitHub+Travis workflow we've developed here is quite general
and will apply to almost *any* unikernels that we may want to construct.
I encourage you to explore the examples in the [mirage-skeleton][] repo and
keep your build script maintainable.  We'll be using it again the next time
we build unikernel devices.

****

*Acknowledgements:* There were lots of things I read over while writing this
post but there were a few particularly useful things that you should look up.
Anil's posts on [Testing with Travis][anil-travis] and
[Travis for secure deployments][anil-travis-ssh] are quite succinct (and
were themselves prompted by [Mike Lin's Travis post][mike-travis] several
months earlier). Looking over Mort's [build script][mort-build] and that of
[mirage-www][] helped me figure out the deployment steps as well as improve
my own script. Special thanks also to [Daniel][], [Leo][] and [Anil][] for
commenting on an earlier draft of this post.

This post was previously published on my [personal site][amc].

[unikernels]: http://queue.acm.org/detail.cfm?id=2566628
[rwo-install]: http://realworldocaml.org/install
[mirage]: http://nymote.org/software/mirage
[Travis CI]: https://travis-ci.org
[static-site]: https://github.com/mirage/mirage-skeleton/tree/master/static_website
[travis-os]: http://docs.travis-ci.com/user/ci-environment/#CI-environment-OS
[mirage-skeleton]: https://github.com/mirage/mirage-skeleton
[anil-ppa]: https://launchpad.net/~avsm
[travis-key]: http://docs.travis-ci.com/user/encryption-keys/
[travis-gem]: http://rubygems.org/gems/travis
[travis-env]: http://docs.travis-ci.com/user/ci-environment/#Environment-variables
[travis-senv]: https://github.com/avsm/travis-senv
[github-deploy]: https://help.github.com/articles/managing-deploy-keys#deploy-keys
[test repo]: https://github.com/amirmc/www-test
[build logs]: https://travis-ci.org/amirmc/www-test
[deploy repo]: https://github.com/amirmc/www-test-deploy
[amc-repo]: https://github.com/amirmc/amirmc.github.com/tree/master/_mirage
[mir-repo]: https://github.com/mirage/mirage-www
[mort-repo]: https://github.com/mor1/mort-www
[mort-build]: https://github.com/mor1/mort-www/blob/master/.travis-build.sh
[rsa-key]: https://github.com/avsm/travis-senv/issues/1
[anil-travis]: http://anil.recoil.org/2013/09/30/travis-and-ocaml.html
[anil-travis-ssh]: http://anil.recoil.org/2013/10/06/travis-secure-ssh-integration.html
[mike-travis]: http://blog.mlin.net/2013/02/testing-ocaml-projects-on-travis-ci.html
[mirage-www]: https://github.com/mirage/mirage-www/blob/master/.travis-ci.sh
[Bytemark]: http://www.bytemark.co.uk
[mir-www-docs]: http://openmirage.org/wiki/mirage-www
[Daniel]: http://erratique.ch
[Leo]: http://www.lpw25.net
[Anil]: http://anil.recoil.org

[fat]: http://en.wikipedia.org/wiki/File_Allocation_Table
[nym-script]: https://github.com/nymote/nymote.github.io/blob/master/_mirage/travis.sh
[amc]: http://amirchaudhry.com/from-jekyll-to-unikernel-in-fifty-lines/
