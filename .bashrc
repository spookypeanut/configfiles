# ENVIRONMENT VARIABLES
export PS1='\w$ '
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/apps/lib/
export LD_LIBRARY_PATH=/usr/local/lib
export EDITOR="/usr/bin/gvim --nofork"
export PYTHONPATH="$HOME/lib/python/:$PYTHONPATH"
export MANPAGER="vimman"
export HOST=$HOSTNAME
if [[ `uname` == "Linux" ]]; then
    PATH=$HOME/apps/bin:${PATH}
fi
export PATH=$HOME/bin:${PATH}

# Output a core please maya
export MAYA_DEBUG_NO_SIGNAL_HANDLERS=1

# ALIASES & FUNCTIONS
# Default settings
alias bc='bc -l'
alias ls='ls --color=auto'
alias grep='grep --color=auto -I'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias screen='screen -x || screen -U'

# Abbreviations
alias ll='ls -lph --color=always --group-directories-first'
alias lrt='ls -lrt'
alias lsd='ls -ld */'
alias l='ls -CF'
alias lcc='ls -l| grep -v "\.o$" | grep -v "\.a$"'
g() { grep -li $* *; }

alias h='history | grep -i '
alias p='ps -ef | grep -v grep | grep -i '

alias vim='vim -o'


alias make='time make'
alias ssh='ssh -Y'

alias v.b='vim ~/.bashrc*'
alias v.v='vim ~/.vimrc'
alias kie='pkill -SEGV wineserver'

alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
alias .7='cd ../../../../../../..'
alias .8='cd ../../../../../../../..'
alias .9='cd ../../../../../../../../..'
# Directory management
cd() {
    CDHIST="$CDHIST:$PWD"  # Push directory
    if [[ "$1" == "-" ]]
    then rd
    else
        if [[ -z "$1" || -d "$1" ]]
        then builtin cd "$@"
        else builtin cd "$(dirname "$1")"
        fi
    fi
}
rd() {
    if [[ ! -z "$CDHIST" ]]
    then
        builtin cd "${CDHIST##*:}"
        CDHIST="${CDHIST%:*}"  # Pop directory
    fi
}
cdhist() {
    echo "$CDHIST" | tr ':' '\n'
}

lf()    { ls -d $PWD/$1*; }
cw()    { cat $(which $*); }
fw()    { file $(which $*); }
lw()    { ls -l $(which $*); }
vw()    { vim $(which $*); }
pywhich() { python -c "import $1; print $1.__file__"; }
mkdir() { /bin/mkdir "$@" && if [[ "$#" -eq 1 ]]; then cd "$1"; fi; }

# Git
alias gg='git gui &'
gitk()  { /usr/bin/gitk --all $* & }

# Tools
alias np='cat >/dev/null'
piechart() { du --max-depth=1 $* | sort -n; }
echopath() {
    if [ -z "$1" ]; then
        pathtouse=$PATH
    else
        pathtouse=$1
    fi
    echo $pathtouse | tr ":" "\n"
}
findinpath() {
    if [ -z "$2" ]; then
        pathtouse=$PATH
    else
        pathtouse=$2
    fi
    #echo "Using path $pathtouse"
    for i in $(echo $pathtouse | tr ':' ' '); do
        if [ -e $i/$1 ]; then
            ls $i/$1
        fi
    done
}

# Misspellings
alias cd..='cd ..'
alias cd-='cd -'
alias ls#='ls'
alias grerp='grep'
alias mv='mv -i'
alias cp='cp -i'

# COMPLETIONS
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

complete -cf cw
complete -cf lw
complete -cf fw
complete -cf vw
complete -cf screen
complete -cf sudo
complete -cf which
complete -cf man
complete -cf type
complete -cf strace
complete -o dirnames cd
complete -o dirnames rmdir
complete -A user finger
complete -A user groups
complete -A user mail

testcompletefunction() {
    echo "\n"
    echo "COMP_CWORD: $COMP_CWORD"
    echo "COMP_LINE: $COMP_LINE"
    echo "COMP_POINT: $COMP_POINT"
    echo "COMP_WORDS: $COMP_WORDS"

    echo "\n"
    COMPREPLY="COMPREPLY"
    echo "\n"
}

complete -F testcompletefunction testcomplete

# HISTORY
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
HISTIGNORE="clear:bg:fg:cd:cd -:exit:date"

# append to the history file, don't overwrite it
shopt -s histappend
# if you try to run a directory, it cds to it instead
shopt -s autocd

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=4000

# Test if we're in framestore
if [ -e /job/fscfc/ ]; then
    alias time='/usr/bin/time -p'
    df() {
        date
        /bin/df $*
        date
    }
    alias start='kfmclient exec'

    alias findBroken='for i in $(find -type l ) ; do [ -e $i ] || echo -e "Broken: \e[31;1m$i\e[0m" ; done'

    # Anything that shouldn't be published to the web goes in this file
    source ~/.bashrc.fscfc
else
    alias start='gnome-open'

    # Wine / VM
    alias autostitch="wine $HOME/apps/autostitch/autostitch.exe"
    alias ida='VirtualBox --startvm ida'

    alias temp='test -f /sys/devices/virtual/thermal/thermal_zone0/temp && cat /sys/devices/virtual/thermal/thermal_zone0/temp'
    alias adb-link='sudo `which adb` kill-server && sudo `which adb` start-server'
    alias scummvm='scummvm -d5'

    export PATH=$PATH:$HOME/android-sdk-linux_86/platform-tools/:$HOME/android-sdk-linux_86/tools/
    export ANDROID_LOG_TAGS="*:E WakeMe@:V"
fi

[[ -f "/home/hbush/.config/autopackage/paths-bash" ]] && . "/home/hbush/.config/autopackage/paths-bash"
