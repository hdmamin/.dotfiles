# Dotfiles

Clone this repo into your home directory.

`git clone git@github.com:hdmamin/.dotfiles.git`

Install GNU-stow for dotfile management.

`brew install stow` or `apt-get install stow`

Enter the dotfiles directory and use stow to symlink everything to your home directory. With Paperspace notebooks, you may want to place this in /notebooks/storage/.dotfiles rather than ~/.dotfiles to get persistent storage.

```
cd ~/.dotfiles/dotfiles
stow * -t ~
```

For convenience, I'm also keeping a short script here to install vim-plug. This is necessary for our .vimrc file to work correctly. The nested dotfiles directory allows us to keep a readme and other files in the root which won't be symlinked (.stow-local-ignore file did not seem to work).


