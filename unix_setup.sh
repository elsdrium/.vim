#!/usr/bin/env zsh

# Check cmake, node and npm
if ! type cmake &> /dev/null || ! type node &> /dev/null || ! type npm &> /dev/null ; then
    echo 'Prerequisites are not installed. Please check the existences of cmake, node and npm.'
    exit
fi

# Check Vim and Zsh
VIM_CHECK=`echo "$(vim --version | egrep -o 'Vi IMproved [0-9]+[.][0-9]+' | cut -d' ' -f3) >= 7.4" | bc`
ZSH_CHECK=`which zsh`
if [ ! $VIM_CHECK ]; then
    echo '[WARNING] Cannot find Vim of version >= 7.4'
elif [ ! $ZSH_CHECK ]; then
    echo '[ERROR] Cannot find Zsh.'
    exit
elif [ ! `which curl` ]; then
    echo '[ERROR] curl is required for installing vim.plug.'
    exit
fi
# Note: it doesn't check git here, the environment should have git if this script already downloaded.

# Back to home
cd ~

# Get vim.plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create symbolic links
ln -fs ~/.vim/.vimrc

if type nvim > /dev/null; then
    # Neovim
    mkdir .config 2> /dev/null
    ln -fs ~/.vim ~/.config/nvim
    nvim +PlugInstall +qall
else
    [[ -f ~/.gitconfig ]] && sed -i -e s/nvim/vim/g ~/.gitconfig
    vim +PlugInstall +qall
fi

echo 'Done. For better vim support, additional utilities: ctags, jshint and pygments are recommended to install.'
