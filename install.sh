#!/usr/bin/env zsh

# Check Vim and Zsh
VIM_CHECK=`echo "$(vim --version | egrep -o 'Vi IMproved [0-9]+[.][0-9]+' | cut -d' ' -f3) >= 7.4" | bc`
ZSH_CHECK=`which zsh`    
if [ ! $VIM_CHECK ]; then
    echo 'Cannot find Vim of version >= 7.4'
    exit
elif [ ! $ZSH_CHECK ]; then
    echo 'Zsh does not exist.'
    exit
elif [ ! `which curl` ]; then
    echo 'curl is required for installing vim.plug.'
    exit
fi
# Note: it doesn't check git here, the environment should have git if this script already downloaded.

# Back to home
cd ~
 
# Get FZF
`git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf`
~/.fzf/install

# Get vim.plug and oh-my-zsh
`curl -fLo ~/.unix_settings/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
`git clone https://github.com/robbyrussell/oh-my-zsh .unix_settings/.oh-my-zsh`

# Use personalized theme
`cp .unix_settings/bureau_custom.zsh-theme .unix_settings/.oh-my-zsh/themes/bureau_custom.zsh-theme`

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
ln -fs .unix_settings/.ssh/config .ssh/config

# Install vim plugins
vim +PlugInstall +qall

## (optional)
#`ln -fs .unix_settings/.pudb-theme.py`
#`ln -fs .unix_settings/.Xmodmap`
#`ln -fs .unix_settings/.spyder2-py3`
#`ln -fs .unix_settings/.spyder2`

# Update zsh
source .zshrc
