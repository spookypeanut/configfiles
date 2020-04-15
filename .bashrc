if [ -e /job/fscfc/ ]; then
    AT_FRAMESTORE=1
else
    AT_FRAMESTORE=0
fi

BASHMAJOR=$(bash --version | head -n1 | sed 's/[^0-9]*\([0-9]*\).*/\1/')

# Check if we're running SL6
if [ $AT_FRAMESTORE -eq 1 ]; then
    ONSL6=0
    R="/etc/redhat-release"
    if [ -f $R ]; then
        if [ "$(cat $R | head -c26)" == "Scientific Linux release 6" ]; then
            ONSL6=1
        fi
    fi
    if [ $ONSL6 == 1 ]; then
        source /etc/bashrc
    elif [ -e /job/fscfc/common/bin/go-bash-setup ]; then
        source go-bash-setup
    fi
fi


# ENVIRONMENT VARIABLES
# I'd love to set this only in .profile, but thanks to /etc/bashrc.global I can't
if [[ `uname` == "Linux" ]]; then
    PATH=$HOME/apps/bin:${PATH}
fi
export PATH=$HOME/bin:$HOME/rippingscripts:$HOME/grooviedev/bin:${PATH}
export EDITOR="gvim --nofork"
export PYTHONPATH="$HOME/lib/python/:$HOME/rippingscripts/python/:$PYTHONPATH"
export MANPAGER="vimman"

# Make DVD reading less verbose
export DVDCSS_VERBOSE=1

# Output a core please maya
export MAYA_DEBUG_NO_SIGNAL_HANDLERS=1

export PYTHONDONTWRITEBYTECODE=1

# ALIASES & FUNCTIONS
# Default settings
alias bc='bc -l'
alias ls='ls --color=auto'
alias grep='grep --color=auto -I'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias screen='screen -x || screen -U'
alias mpq='mplayer -nosound'
lsdvd() { /usr/bin/lsdvd "$@" | sed "/^$/d" ; }
alias tmux='tmux -2 attach || tmux -2 -u'
alias vim='vim -o'
alias vi='vim'
alias ssh='ssh -Y'

alias mount='mount | column -t'

# Abbreviations
alias ll='ls -lph --color=always --group-directories-first'
alias lrt='ls -lrt'
alias lsd='ls -ld */'
alias l='ls -CF'
alias lcc='ls -l| grep -v "\.o$" | grep -v "\.a$"'
alias lnc='ls -l --color=never'
alias happyrsync='rsync --progress --stats --size-only -vv -r -t'
alias slowrsync='rsync --progress --stats -vv -r -t --bwlimit=0.5M'
g() { grep -li $* *; }
alias ipy="ipython"
alias py="python"
# Can't do this as a function, so here's a cheap hack
echo 'rmdir "$@" 2> /dev/null && echo "Removed $*"; true;' > ~/bin/_rmdir_verbose_no_error
chmod 755 ~/bin/_rmdir_verbose_no_error
alias prunedirs='find -depth -type d -exec _rmdir_verbose_no_error {} \;'
alias start='xdg-open'
alias aptupgrade='sudo aptitude update && sudo aptitude upgrade'

alias h='history | grep -i '
alias p='ps -ef | grep -v grep | grep -i '

alias make='time make'

alias v.b='vim ~/.bashrc*'
alias v.v='vim ~/.vimrc'

alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
alias .7='cd ../../../../../../..'
alias .8='cd ../../../../../../../..'
alias .9='cd ../../../../../../../../..'

lf()    { ls -d $PWD/$1*; }
cw()    { cat $(which $*); }
fw()    { file $(which $*); }
lw()    { ls -l $(which $*); }
vw()    { vim $(which $*); }
pywhich() { python -c "import $1; print $1.__file__"; }
mkdir() { /bin/mkdir "$@" && if [[ "$#" -eq 1 ]]; then cd "$1"; fi; }

# Git
alias gg='git gui &'
gitk()  { git diff > /dev/null && /usr/bin/gitk --all $* & }

# Tools
alias np='cat >/dev/null'
piechart() { du -h --max-depth=1 $* | sort --human-numeric; }
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
        pathtouse=$(plconfigpath)
    else
        pathtouse=$2
    fi
    #echo "Using path $pathtouse"
    for i in $(echo $pathtouse | tr ':' ' '); do
        if [ -e $i/$1 ]; then
            ls -d $i/$1
        fi
    done
}
alias battery='echo "scale=1; $(cat /sys/class/power_supply/BAT0/charge_now) / $(cat /sys/class/power_supply/BAT0/charge_full) * 100 "| bc'
alias temp='for i in /sys/class/thermal/thermal_zone?/temp; do echo $(cat $i | cut -c1-2).$(cat $i | cut -c3-3)°; done'

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
complete -f -d start
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
export HISTCONTROL=ignoredups:ignorespace
# HISTIGNORE should *only* contain things that you never want to do
# twice in a row
export HISTIGNORE="clear:bg:fg:cd:exit"
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=15000
export HISTFILESIZE=20000

# This stuff is only for interactive shells
if [ -t 0 ]; then
    # SHELL OPTIONS
    # append to the history file, don't overwrite it
    shopt -s histappend
    # check the window size after each command and update LINES and COLUMNS
    shopt -s checkwinsize
    # attempt to save all lines of a multi-line command in the same history entry
    shopt -s cmdhist
    # don't attempt to search the PATH for completion of an empty line
    shopt -s no_empty_cmd_completion
    # if you try to run a directory, it cds to it instead
    shopt -s autocd
    export PS1='$_SHELL_TITLE\w$ '
    stty stop ^-    # I like ctrl-s, so set 'ctrl -' to stop the terminal instead
fi
labelshell() {
    export _SHELL_TITLE="$@ "
}

if [ -e $HOME/apps/todo.txt_cli/todo_completion -a \( $BASHMAJOR -gt 3 \) ]; then
    source $HOME/apps/todo.txt_cli/todo_completion
    alias t="todo.sh"
    alias a="start-tor-browser"
    export TODOTXT_DEFAULT_ACTION=ls
fi

# Test if we're in framestore
if [ $AT_FRAMESTORE -eq 1 ]; then
    alias time='/usr/bin/time -p'

    # Anything that shouldn't be published to the web goes in this file
    source ~/.bashrc.fscfc
else

    # Wine / VM
    alias autostitch="wine $HOME/apps/autostitch/autostitch.exe"

    alias adb-link='sudo `which adb` kill-server && sudo `which adb` start-server'
    alias scummvm='scummvm -d5'
    alias tocomp='cd "$(echo $PWD | sed "s_/Books/_/BooksComp/_" | sed "s_/Comedy/_/ComedyComp/_")"'
    # Touchpad sensitivity in SDL (ScummVM) is ridiculous. These help
    export SDL_VIDEO_X11_DGAMOUSE=0
    export SDL_VIDEO_X11_MOUSEACCEL="1/1/1"
    export SDL_MOUSE_RELATIVE=0

    export PATH=$PATH:$HOME/android/sdks/platform-tools:$HOME/android/sdks/tools
fi
