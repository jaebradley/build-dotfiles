#!/bin/bash

which git
if [[ $? -ne 0 ]]; then echo "git command does not exist" && exit 255; fi

cd "$HOME"
if [[ $? -ne 0 ]]; then echo "unable to move to $HOME directory" && exit 255; fi

git clone https://github.com/jaebradley/dotfiles.git .dotfiles
if [[ $? -ne 0 ]]; then echo "could not clone dotfiles repository" && exit 255; fi

/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
if [[ $? -ne 0 ]]; then echo "unable to checkout config" && exit 255; fi

if [[ -x "./scripts/start.sh" ]]; then echo "start script is not executable" && exit 255; fi

bash ./scripts/start.sh
if [[ $? -ne 0 ]]; then echo "start script failed" && exit 255; fi
