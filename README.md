# Dotfiles

Clone this repo into your home directory.

`git clone git@github.com:hdmamin/.dotfiles.git`

Install GNU-stow for dotfile management.

`brew install stow` or `apt-get install stow`

Enter the dotfiles directory and use stow to symlink everything to your home directory.

`cd ~/.dotfiles && stow *`

The `stow` command also has a -t option that lets us specify a target directory (the default is the parent of the directory where the command is run from). This can be useful for Paperspace notebooks, where we must place everything in the ~/storage dir if we want it to persist (i.e. this dir will be at ~/storage/.dotfiles rather than ~/.dotfiles).

For convenience, I'm also keeping a short script here to install vim-plug. This will be necessary in order for our .vimrc file to work correctly.

