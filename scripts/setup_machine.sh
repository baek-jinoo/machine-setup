#!/usr/bin/env bash -e

ruby ./scripts/homebrew_setup.rb

./scripts/rbenv_setup.sh
./scripts/pyenv_setup.sh

ruby ./scripts/setup_machine.rb

