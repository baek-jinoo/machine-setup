#!/usr/bin/env bash
set -ex

git fetch
git merge origin/master master --ff
git checkout master

source ~/.bash_profile &> /dev/null

