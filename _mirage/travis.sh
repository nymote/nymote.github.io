#!/usr/bin/env bash

# Edited from https://gist.github.com/avsm/6757425 and @mor1
# (see post at: http://anil.recoil.org/2013/09/30/travis-and-ocaml.html)

OPAM_DEPENDS="mirage"

case "$OCAML_VERSION,$OPAM_VERSION" in
4.01.0,1.1.0) ppa=avsm/ocaml41+opam11 ;;
*) echo Unknown $OCAML_VERSION,$OPAM_VERSION; exit 1 ;;
esac

# set up machine
echo "yes" | sudo add-apt-repository ppa:$ppa
sudo apt-get update -qq
sudo apt-get install -qq ocaml ocaml-native-compilers camlp4-extra opam

# set up OPAM
export OPAMYES=1
# export OPAMVERBOSE=1  # uncomment this to get more debug info
opam init
opam install ${OPAM_DEPENDS}
eval `opam config env`

# Print info on system
echo Working directory
pwd
echo OCaml version
ocaml -version
echo OPAM versions
opam --version
opam --git-version
echo Mirage version
mirage --version

# run the commands to build from here
FS=fat mirage configure --$MIRAGE_BACKEND
mirage build

#############################
# DEPLOYMENT
#
# push a compressed xen VM to a specific repo (for deployment elsewhere)
if [ "$DEPLOY" = "1" -a "$TRAVIS_PULL_REQUEST" = "false" ]; then

    # env variables
    SSH_DEPLOY_KEY=~/.ssh/id_rsa
    XEN_DIR=xen/$TRAVIS_COMMIT
    DEPLOY_IMAGE=mir-www.xen
    FAT_IMAGE=fat1.img
    DEPLOY_USER=amcdeploy               # for github deployment repo
    DEPLOY_ACCOUNT=nymote               # for github deployment repo
    DEPLOY_REPO=nymote-www-deploy    # for github deployment repo

    # install the tool to deal with private SSH key
    opam install travis-senv

    # load up github SSH key and set up hosts file
    mkdir -p ~/.ssh
    travis-senv decrypt > $SSH_DEPLOY_KEY
    chmod 600 $SSH_DEPLOY_KEY # owner can read and write
    echo "Host $DEPLOY_USER github.com"   >> ~/.ssh/config
    echo "  Hostname github.com"          >> ~/.ssh/config
    echo "  StrictHostKeyChecking no"     >> ~/.ssh/config
    echo "  CheckHostIP no"               >> ~/.ssh/config
    echo "  UserKnownHostsFile=/dev/null" >> ~/.ssh/config

    # configure travis git details
    git config --global user.email "travis@amirmc.io" # this doesn't exist
    git config --global user.name "Travis Build Bot"

    # Do the actual work for deployment
    git clone git@$DEPLOY_USER:$DEPLOY_ACCOUNT/$DEPLOY_REPO
    case "$MIRAGE_BACKEND" in
        xen)
            cd $DEPLOY_REPO
            rm -rf $XEN_DIR     # in case of hash collision, delete previous?
            mkdir -p $XEN_DIR
            cp ../$DEPLOY_IMAGE ../config.ml $XEN_DIR
            bzip2 -9 $XEN_DIR/$DEPLOY_IMAGE
            if [ -f ../$FAT_IMAGE ]; then
                cp ../$FAT_IMAGE $XEN_DIR
                bzip2 -9 $XEN_DIR/$FAT_IMAGE
            fi
            git pull --rebase   # in case there are changes since cloning
            echo $TRAVIS_COMMIT > xen/latest    # update ref to most recent
            git add $XEN_DIR xen/latest         # add VM and ref to staging
            ;;

        *)
            echo unsupported deploy mode: $MIRAGE_BACKEND
            exit 1
            ;;
    esac

    # commit and push the changes
    git commit -m "adding $TRAVIS_COMMIT built for $MIRAGE_BACKEND"
    git push origin master

fi
