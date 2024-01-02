# My dotfiles

> Inspiration from ackama: https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/

## Installation

```bash
curl -Ls "https://raw.githubusercontent.com/cfrioux/dotfiles/master/.dotfiles-scripts/install.sh" | bash
```

## Usage

Use `dotfiles` command like a standard `git` one:

```bash
# status
dotfiles st

# add file
dotfiles add path/to/file.rc

# commit
dotfiles commit -m "my comment"

# push
dotfiles push
```


## **(do not run)** How was it made the first time?
> This part was used only to init the repository with its content: it is not necessary to re-use it.

```bash
git init $HOME/.cfg
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'" >> $HOME/.zsh/aliases
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:cfrioux/dotfiles.git

# adding a file
dotfiles add .vimrc
dotfiles commit -m "add .vimrc"
dotfiles push
```

