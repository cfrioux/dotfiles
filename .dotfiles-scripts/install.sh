#!/bin/bash

cd $HOME

alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/.git --work-tree=$HOME'
shopt -s expand_aliases

if [[ -d $HOME/.cfg/.git ]]
then
  echo "Already installed: lets update it"
  dotfiles pull --quiet
else
  echo ".cfg" >> .gitignore
  git clone https://github.com/cfrioux/dotfiles.git $HOME/.cfg --quiet
  dotfiles config --local status.showUntrackedFiles no
  dotfiles checkout -f --quiet
fi

bash $HOME/.dotfiles-scripts/zsh-setup.sh
#bash $HOME/.dotfiles-scripts/tools-setup-apt.sh
