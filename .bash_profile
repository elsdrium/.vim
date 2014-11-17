
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/Matlab_R2014b.app/bin:/usr/texbin"

# Setting ls color
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx 

#alias clang++='clang++ -I/usr/local/Cellar/gcc/4.9.2/lib/gcc/x86_64-apple-darwin14.0.0/4.9.2/include/c++ -I/usr/local/Cellar/gcc/4.9.2/lib/gcc/x86_64-apple-darwin14.0.0/4.9.2/include/c++/x86_64-apple-darwin14.0.0 -I/usr/local/Cellar/gcc/4.9.2/lib/gcc/x86_64-apple-darwin14.0.0/4.9.2/include/c++/backward -I/usr/local/Cellar/gcc/4.9.2/lib/gcc/x86_64-apple-darwin14.0.0/4.9.2/include -I/usr/local/Cellar/gcc/4.9.2/lib/gcc/x86_64-apple-darwin14.0.0/4.9.2/include-fixed -I/usr/local/include -I/usr/include --std=c++11 --stdlib=libc++ -lc++ -lstdc++ -L/usr/local/Cellar/gcc/4.9.2/lib/gcc/x86_64-apple-darwin14.0.0/4.9.2/ -L/usr/local/Cellar/gcc/4.9.2/lib/gcc/x86_64-apple-darwin14.0.0/4.9.2/../../../ -L/usr/lib/'



# Setting some aliases
alias ..='cd ..'
alias ....='cd ../..'
alias ls='ls -pG'
alias la='ls -pGA'
alias reload='source ~/.bash_profile && source ~/.bashrc'
alias reloadvim='vim +PluginClean +PluginInstall +PluginUpdate +qall'
function pdf() { mupdf-x11 "$1" & }

source ~/.bashrc
