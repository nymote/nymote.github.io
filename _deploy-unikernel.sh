#!/usr/bin/env bash

jekyll build
git add _site
git commit -m 'update _site'
git push origin master
