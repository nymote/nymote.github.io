[![Build Status](https://travis-ci.org/amirmc/amirmc.github.com.png?branch=master)](https://travis-ci.org/amirmc/amirmc.github.com)

## Unikernel to serve static website

These are the files needed to generate a [mirage unikernel][] from a Jekyll
static site.  The content of the \*.ml files are taken from the
[`mirage_skeleton` repository][1], specifically, the `static_website` folder.
There are only minor tweaks to point to the `_site` folder where Jekyll puts
its generated output. As such, these files should work with any Jekyll site.

[Travis CI][] is used to build the unikernel and push it into another repo
for downstream deployment.  The `.travis.yml` file in the root of this repo
tells Travis what to do, which is essentially to run the `.travis.sh` script
in this folder.

Since these files are copy/pasted from another repo, the following links
should help to check if things have been updated upstream

Files are from: https://github.com/mirage/mirage-skeleton/commit/1709bad5bac9484b8feb476aa6803e464d66057b

Latest versions are:
- [config.ml][]
- [dispatch.ml][]

[1]: https://github.com/mirage/mirage-skeleton

[mirage unikernel]: http://openmirage.org
[Travis CI]: https://travis-ci.org
[config.ml]: https://github.com/mirage/mirage-skeleton/commits/master/static_website/config.ml
[dispatch.ml]: https://github.com/mirage/mirage-skeleton/commits/master/static_website/dispatch.ml


***************************************

*Original README content*

Put static files into the htdocs/ directory.

For a Xen DHCP kernel, do:

$ env DHCP=true mirage configure --xen
$ make
$ make run

edit `www.xl` to add a VIF, e.g. via:

```
vif = ['bridge=xenbr0']
```

And then run the VM via `xl create -c www.xl`
