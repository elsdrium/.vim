#!/bin/zsh

# You should use ZSH
if `basename "$SHELL"` != "zsh"
then
    echo "Please use zsh."
    exit
fi

# Back to home
`cd`

# Get Vundle and oh-my-zsh
`git clone https://github.com/VundleVim/Vundle.vim .unix_settings/.vim/bundle/Vundle.vim`
`git clone https://github.com/robbyrussell/oh-my-zsh .unix_settings/.oh-my-zsh`

# Use personalized theme
`cp .unix_settings/bureau_custom.zsh-theme .unix_settings/.oh-my-zsh/themes/bureau_custom.zsh-theme`

# Install and update vim plugins
`vim +PluginInstall +PluginUpdate +qall`

# Create symbolic links for dot-files
`ln -s .unix_settings/.zshrc`
`ln -s .unix_settings/.oh-my-zsh`
`ln -s .unix_settings/.vim`
`ln -s .unix_settings/.vimrc`
`ln -s .unix_settings/.inputrc`
`ln -s .unix_settings/.jupyter`
`ln -s .unix_settings/.ipython`
`ln -s .unix_settings/.tmux.conf`

## (optional)
#`ln -s .unix_settings/.pudb-theme.py`
#`ln -s .unix_settings/.Xmodmap`
#`ln -s .unix_settings/.spyder2-py3`
#`ln -s .unix_settings/.spyder2`

# Update zsh
source .zshrc
