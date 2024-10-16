# Vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Tmux plugin manager
PLUGIN_DIR="~/.tmux/plugins/tmp"
if [ ! -d "$PLUGIN_DIR" ]; then
    echo "cloning tmux plugin manager"
    git clone https://github.com/tmux-plugins/tpm "$PLUGIN_DIR"
else
    echo "tmux plugin manager already found"
fi

# Enable vim settings and plugins. Must occur AFTER we've gnu-stowed everything.
vim -c "source ~/.vimrc" -c "PlugInstall" -c "qa"
