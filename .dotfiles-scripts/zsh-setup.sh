#!/bin/bash

# Ensure to have zsh installed

export ZSH_CUSTOM=~/.oh-my-zsh/custom


if [[ -d $ZSH_CUSTOM/../.git ]]
then
  echo "Oh My ZSH is already installed"
  git -C ${ZSH_CUSTOM}/../ pull --quiet
else
  echo "Oh My ZSH..."
  rm -rf $ZSH_CUSTOM/../
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Oh My ZSH plugins..."
omz_plugins=("zsh-autosuggestions" "zsh-completions" "zsh-syntax-highlighting")
for plugin in ${omz_plugins[@]}; do
  if [[ -d ${ZSH_CUSTOM}/plugins/${plugin} ]]
  then
    git -C ${ZSH_CUSTOM}/plugins/${plugin} pull --quiet
  else
    git clone --quiet https://github.com/zsh-users/${plugin} ${ZSH_CUSTOM}/plugins/${plugin}
  fi
done

echo "Powerlevel10k theme..."
if [[ -d ${ZSH_CUSTOM}/themes/powerlevel10k ]] 
then
  git -C ${ZSH_CUSTOM}/themes/powerlevel10k pull --quiet
else
  git clone --quiet https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k
fi

# If custom zshrc file was moved by ohmyzsh, replace it 
if [[ -f ${HOME}/.zshrc.pre-oh-my-zsh ]]
then
  mv ${HOME}/.zshrc.pre-oh-my-zsh ${HOME}/.zshrc
fi

# Change shell
echo "Force current user shell to be zsh"
sudo chsh -s $(which zsh) $USER
