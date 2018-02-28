#!/usr/bin/env bash -e

ruby ./scripts/homebrew_setup.rb

./scripts/rbenv_setup.sh
./scripts/pyenv_setup.sh

ruby ./scripts/machine_setup.rb

defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "`pwd`/artifacts/iterm"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
