# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bureau_custom"

export platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    export platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    export platform='osx'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
    export platform='freebsd'
fi

function estimate_time_preexec {
    start_time=$SECONDS
}

function estimate_time_precmd {
    timer_result=$(( $SECONDS - $start_time ))
    if [[ $timer_result -gt 3 ]]; then
        calc_elapsed_time
    fi
    start_time=$SECONDS
}

function calc_elapsed_time {
if [[ $timer_result -ge 3600 ]]; then
    let "timer_hours = $timer_result / 3600"
    let "remainder = $timer_result % 3600"
    let "timer_minutes = $remainder / 60"
    let "timer_seconds = $remainder % 60"
    print -P "%B%F{red}>>> elapsed time ${timer_hours}h${timer_minutes}m${timer_seconds}s%b"
elif [[ $timer_result -ge 60 ]]; then
    let "timer_minutes = $timer_result / 60"
    let "timer_seconds = $timer_result % 60"
    print -P "%B%F{yellow}>>> elapsed time ${timer_minutes}m${timer_seconds}s%b"
elif [[ $timer_result -gt 3 ]]; then
    print -P "%B%F{green}>>> elapsed time ${timer_result}s%b"
fi
}


autoload -Uz add-zsh-hook

add-zsh-hook preexec estimate_time_preexec
add-zsh-hook precmd estimate_time_precmd

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast vi-mode)

# User configuration

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

setopt AUTO_PUSHD
setopt GLOB_COMPLETE
setopt PUSHD_MINUS
setopt PUSHD_TO_HOME
setopt NO_BEEP
setopt NO_CASE_GLOB


bindkey -M vicmd "q" push-line

export EDITOR="vi"
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

if [[ $platform == 'osx' ]]; then
    export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/Matlab_R2014b.app/bin:/usr/texbin"

    # spark 1.5.1 requires JVM 1.7+
    export JAVA_HOME='/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home'

    function pdf() { mupdf-x11 "$1" & }

    alias cdw='cd /Users/elsdrm/nas/workspace/'
    alias l='ls -hpG'
    alias ls='ls -hpG'
    alias ll='ls -hlpGA'
    alias la='ls -pGA'

else
    export PATH="/usr/local/cuda/bin:/usr/local/bin:/usr/games:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/MATLAB/R2015b/bin"
    export LD_LIBRARY_PATH="/usr/local/cuda/lib64"

    alias cdw='cd /home/elsdrm/nas/workspace/'
    alias l='ls --color=auto -hp'
    alias ls='ls --color=auto -hp'
    alias ll='ls --color=auto -hlpA'
    alias la='ls --color=auto -pA'
    #alias rs='rsync -av -e ssh elsdrm@140.109.135.120:/Users/elsdrm/Dropbox/.unix_settings /home/elsdrm'
    alias sag='sudo apt-get'
    #alias spark-ipynb='IPYTHON_OPTS="notebook" /home/elsdrm/spark-1.4.1-bin-hadoop2.6/bin/pyspark --master spark://140.109.21.193:7077'

    # system management
    alias dstat='dstat -cdlmnpsy'
    alias nmon='nmon -s 1'
fi

alias rr='ranger'
alias gsb='git show-branch --color'
alias grep='grep --color=auto -n'
alias egrep='egrep --color=auto -n'
alias fgrep='fgrep --color=auto -n'
alias ccat='highlight -O ansi'
alias v='vim'
alias rv='vim +PluginUpdate +qall'
alias rrv='vim +PluginClean +PluginUpdate +PluginInstall +qall'
alias ev='vim ~/.vimrc'
alias rz='source ~/.zshrc'
alias ez='vim ~/.zshrc'
#alias rlsftp='with-readline sftp'
#alias rlftp='with-readline ftp'
alias clang++='clang++ -std=c++11'
alias g++='g++ -std=c++11'
alias p2i='sudo -H pip2 install'
alias p2u='sudo -H pip2 install --upgrade'
alias p3i='sudo -H pip3 install'
alias p3u='sudo -H pip3 install --upgrade'
alias ipy='ipython3'

NORMAL_SYMBOL='@'
INSERT_SYMBOL='@'
