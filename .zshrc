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

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa id_github id_bitbucket

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

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
plugins=(git gitfast github vi-mode ssh-agent sudo incr mix)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

setopt AUTO_PUSHD
setopt GLOB_COMPLETE
setopt PUSHD_MINUS
setopt PUSHD_TO_HOME
setopt NO_BEEP
setopt NO_CASE_GLOB


bindkey -M vicmd "q" push-line
bindkey -M viins ";;" vi-cmd-mode
bindkey -M viins "^B" vi-backward-word
bindkey -M viins "^F" vi-forward-word

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

if [[ $platform == 'osx' ]]; then
    export PATH="/usr/local/opt/go/libexec/bin:/usr/local/opt/python@2/libexec/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

    # Spark 1.5.1 requires JVM 1.7+
    export JAVA_HOME='/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home'

    alias l='ls -hpG'
    alias ls='ls -hpG'
    alias ll='ls -hlpGA'
    alias la='ls -pGA'

    # iTerm2 support
    alias imgcat=~/.iterm2/imgcat

else # Linux
    export PATH="/usr/local/bin:/usr/games:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
    export LD_LIBRARY_PATH="/usr/local/lib64:/usr/local/lib:/usr/lib"

    alias l='ls --color=auto -hp'
    alias ls='ls --color=auto -hp'
    alias ll='ls --color=auto -hlpA'
    alias la='ls --color=auto -pA'
    alias rdwin='rdesktop -g 1620x980'
    #alias rs='rsync -av -e ssh elsdrm@140.109.135.120:/Users/elsdrm/Dropbox/.unix_settings /home/elsdrm'
    alias sag='sudo apt-get'
    alias acs='apt-cache search'
    alias sy='sudo yum'

    # system management
    alias dstat='dstat -cdlmnpsy'
    alias dus='du -smh' # disk usage summary
    alias xopen='xdg-open'
    alias gir='grep -ir'
fi


function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/env ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

function findcpp {
    TARGET=$([[ $1 = /*  ]] && echo "$1" || echo "$PWD/${1#./}")
    find $TARGET -type f \
        -iname '*.c' -o -iname '*.C' -o -iname '*.cpp' -o -iname '*.cxx' -o -iname '*.cc' -o -iname '*.c++' -o \
        -iname '*.h' -o -iname '*.H' -o -iname '*.hpp' -o -iname '*.hxx' -o -iname '*.hh' -o -iname '*.h++' -o \
        -iname '*.inl'
}

alias grep='grep --color=auto -n'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias fpp='fpp --keep-open'
alias nv='nvim'
alias nvdiff='nvim -d'
alias rv='v +PlugUpdate +qall'
alias rrv='v +PlugClean +PlugUpdate +PlugInstall +qall'
alias ev='v ~/.unix_settings/.vimrc'
alias rz='source ~/.zshrc'
alias ez='v ~/.unix_settings/.zshrc'
alias rcd='ranger-cd'
alias ssh='TERM=xterm-256color ssh -X'
alias tmux='TERM=xterm-256color tmux -2 -u'
# alias vnc=xvnc4viewer -FullColor
alias nvcc='nvcc -std=c++11'
alias clang++='clang++ -std=c++14'
# alias cuda='clang++ -std=c++11 -I/usr/local/cuda/include -L/usr/local/cuda/lib64 -lcudart --cuda-gpu-arch=sm_30'
alias g++='g++ -std=c++14'
alias p2u='sudo -H pip2 install --upgrade'
alias p3u='sudo -H pip3 install --upgrade'
alias ipy='ipython3'
unalias grv

# neovim is preferred, otherwise fall back to vi
if ! type nvim &> /dev/null; then
    export VISUAL="vim"
    export EDITOR="vim"
else
    export VISUAL="nvim"
    export EDITOR="nvim"
fi

v() {
    local args=("$@")
    for file in "${args[@]}"; do
        [[ $file = -* ]] && continue   # Ignore options
        [[ $file = +* ]] && continue   # Ignore vim commands

        if ! [[ -e $file ]]; then
            printf '%s: cannot access %s: No such file or directory\n' "$EDITOR" "$file" >&2
            return 1
        fi
    done
    # Use `command' to invoke the vim binary
    command "$EDITOR" "${args[@]}"
}

NORMAL_SYMBOL='@'
INSERT_SYMBOL='@'
#alias ndrun='nvidia-docker run -t -i -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --rm' # run Nvidia docker with X11 GUI

export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

if [[ -f ~/.machine_config ]]; then; source ~/.machine_config; fi
