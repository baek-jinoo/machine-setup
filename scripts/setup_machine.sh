#!/usr/bin/env bash

ruby ./homebrew_setup.rb

./rbenv_setup.sh
./pyenv_setup.sh

ruby ./setup_machine.rb
