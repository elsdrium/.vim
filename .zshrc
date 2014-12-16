# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bureau_elsdrm"

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='osx'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
    platform='freebsd'
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
plugins=(osx git autojump vi-mode)

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
    alias l='ls -hpG'
    alias ls='ls -hpG'
    alias ll='ls -hlpGA'
    alias la='ls -pGA'
else
    export PATH="/home/elsdrm/.linuxbrew/bin:/home/elsdrm/.linuxbrew/Cellar/python3/3.4.2_1/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin"
    alias l='ls --color=auto -hp'
    alias ls='ls --color=auto -hp'
    alias ll='ls --color=auto -hlpA'
    alias la='ls --color=auto -pA'
fi

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias rv='vim +PluginClean +PluginInstall +PluginUpdate +qall'
alias rz='source ~/.zshrc'
alias ez='vim ~/.zshrc'
function pdf() { mupdf-x11 "$1" & }

NORMAL_SYMBOL='@'
INSERT_SYMBOL='@'
