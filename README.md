# Dotfiles Setup

Make sure to have `zsh` and `neovim` installed before pulling the repo down.

Next, make sure to have the following alias present: `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

Then clone the repo: `git clone --bare git@github.com:Olyve/dotfiles.git $HOME/.dotfiles`

Run the following commands to setup and pulle the files.
```
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```
> If you run into an issue with file conflcits, remove the conflicting files and try again
