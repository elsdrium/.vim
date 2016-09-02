#!/usr/bin/env zsh

# You should use ZSH
#if [ `basename $SHELL` != "zsh" ]; then
    #echo "Please use zsh."
    #exit
#fi

# Back to home
cd ~

# Get Vundle and oh-my-zsh
`git clone https://github.com/VundleVim/Vundle.vim .unix_settings/.vim/bundle/Vundle.vim`
`git clone https://github.com/robbyrussell/oh-my-zsh .unix_settings/.oh-my-zsh`

# Use personalized theme
`cp .unix_settings/bureau_custom.zsh-theme .unix_settings/.oh-my-zsh/themes/bureau_custom.zsh-theme`

# Install and update vim plugins
`vim +PluginInstall +PluginUpdate +qall`

# Create symbolic links for dot-files
ln -fs .unix_settings/.zshrc
ln -fs .unix_settings/.oh-my-zsh
ln -fs .unix_settings/.vim
ln -fs .unix_settings/.vimrc
ln -fs .unix_settings/.inputrc
ln -fs .unix_settings/.jupyter
ln -fs .unix_settings/.ipython
ln -fs .unix_settings/.tmux.conf
ln -fs .unix_settings/.pylintrc

## (optional)
#`ln -fs .unix_settings/.pudb-theme.py`
#`ln -fs .unix_settings/.Xmodmap`
#`ln -fs .unix_settings/.spyder2-py3`
#`ln -fs .unix_settings/.spyder2`

# Update zsh
source .zshrc
