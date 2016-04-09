#!/bin/zsh

# You should use ZSH
if `basename "$SHELL"` != "zsh"
then
    echo "Please use zsh."
    exit
fi

# Get this file's own directory
BASEDIR=$(dirname "$0")

cd $BASEDIR

# Get Vundle and oh-my-zsh
git clone https://github.com/VundleVim/Vundle.vim .vim/bundle/Vundle.vim
git clone https://github.com/robbyrussell/oh-my-zsh .oh-my-zsh

# Use personalized theme
cp bureau_custom.zsh-theme .oh-my-zsh/themes/bureau_custom.zsh-theme

# Install and update vim plugins
vim +PluginInstall +PluginUpdate +qall

# Create symbolic links for dot-files
ln -s .zshrc ~/.zshrc
ln -s .oh-my-zsh ~/.oh-my-zsh
ln -s .vim ~/.vim
ln -s .vimrc ~/.vimrc
ln -s .inputrc ~/.inputrc
ln -s .jupyter ~/.jupyter
ln -s .ipython ~/.ipython
ln -s .tmux.conf ~/.tmux.conf

## (optional)
ln -s .pudb-theme.py ~/.pudb-theme.py
ln -s .Xmodmap ~/.Xmodmap
ln -s .spyder2-py3
ln -s .spyder2

# Update zsh
source .zshrc
