#!/bin/bash

which git
if [[ $? -ne 0 ]]; then echo "git command does not exist" && exit 255; fi

cd "$HOME"
if [[ $? -ne 0 ]]; then echo "unable to move to $HOME directory" && exit 255; fi

ls -la .
if [[ $? -ne 0 ]]; then echo "unable to list everything in current directory" && exit 255; fi

rm -r ./*
if [[ $? -ne 0 ]]; then echo "unable to delete everything in $HOME directory" && exit 255; fi

git clone --bare https://github.com/jaebradley/dotfiles.git .dotfiles
if [[ $? -ne 0 ]]; then echo "could not clone dotfiles repository" && exit 255; fi

git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
if [[ $? -ne 0 ]]; then echo "unable to checkout config" && exit 255; fi

if [[ -x "./scripts/start.sh" ]]; then echo "start script is not executable" && exit 255; fi

bash ./scripts/start.sh
if [[ $? -ne 0 ]]; then echo "start script failed" && exit 255; fi
