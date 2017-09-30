#!/usr/bin/env bash
set -e

SCRIPT_DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
cd $SCRIPT_DIR

echo "Check if git is clean for merge from master"
git diff-index --quiet --cached HEAD
git diff-files --quiet

echo "Git is clean, proceeding..."
git fetch
git merge origin/master master --ff
git checkout master || true

echo "Source bash_profile"
source ~/.bash_profile


