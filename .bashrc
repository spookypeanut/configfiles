if [ -e /job/fscfc/ ]; then
    AT_FRAMESTORE=1
else
    AT_FRAMESTORE=0
fi

BASHMAJOR=$(bash --version | head -n1 | sed 's/[^0-9]*\([0-9]*\).*/\1/')

# Check if we're running SL6
if [ $AT_FRAMESTORE -eq 1 ]; then
    R="/etc/redhat-release"
    if [ -f $R -a "$(cat $R | head -c28)" == "Scientific Linux release 6.3" ]; then
        # If so, run the default bashrc
        if [ -f /etc/bashrc ]; then
            source /etc/bashrc
        fi
    elif [ -e /job/fscfc/common/bin/go-bash-setup ]; then
        source go-bash-setup
    fi
fi

# ENVIRONMENT VARIABLES
# I'd love to set this only in .profile, but thanks to /etc/bashrc.global I can't
if [[ `uname` == "Linux" ]]; then
    PATH=$HOME/apps/bin:${PATH}
fi
export PATH=$HOME/bin:${PATH}
#export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/apps/lib/
export EDITOR="gvim --nofork"
export PYTHONPATH="$HOME/lib/python/:$PYTHONPATH"
export MANPAGER="vimman"

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
alias lnc='ls -l --color=never'
alias happyrsync='rsync --progress --stats -vv -t'
g() { grep -li $* *; }
alias ipy="ipython"
# Can't do this as a function, so here's a cheap hack
echo 'rmdir $* 2> /dev/null && echo "Removed $*"; true;' > ~/bin/_rmdir_verbose_no_error
chmod 755 ~/bin/_rmdir_verbose_no_error
alias prunedirs='find -depth -type d -exec _rmdir_verbose_no_error {} \;'
alias start='xdg-open'

alias h='history | grep -i '
alias p='ps -ef | grep -v grep | grep -i '

alias vim='vim -o'

alias nydate='TZ=America/New_York date'

alias make='time make'
alias ssh='ssh -Y'

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

substr() { # $1 string, $2 start, $3 end
    local start=$2
    local end=$3
    [[ -z $start ]] && start=0
    [[ $start -lt 0 ]] && start=$[${#1} + $start]
    [[ $start -lt 0 ]] && start=0
    [[ -z $end ]] && end=${#1}
    [[ $end -lt 0 ]] && end=$[${#1} + $end]
    [[ $end -lt 0 ]] && end=0
    len=$[$end - $start]
    if [[ $len -gt 0 ]]
    then
        echo ${1:$start:$len}
    fi
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
gitk()  { git diff > /dev/null && /usr/bin/gitk --all $* & }

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
        pathtouse=$PL_CONFIG_PATH
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
export HISTCONTROL=erasedups:ignorespace
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
    if [ $BASHMAJOR -gt 3 ]; then
        shopt -s autocd
    fi
    export PS1='$_SHELL_TITLE\w$ '
    stty stop ^-    # I like ctrl-s, so set 'ctrl -' to stop the terminal instead
fi
labelshell() {
    export _SHELL_TITLE="$@ "
}

# Timing and error code printouts

# Tie into the DEBUG event to get a zsh-like preexec hook
# A more complete version at: http://glyf.livejournal.com/63106.html
preexec() { :; }    # Default empty function
postexec() { :; }   # Default empty function
preexec_invoke_exec () {
    [ -n "$COMP_LINE" ] && return  # Completing, do nothing
    preexec "$(history 1 | sed -e "s/^[ ]*[0-9]*[ ]*//g")";
}
trap 'preexec_invoke_exec' DEBUG
PROMPT_COMMAND='postexec'

if [ -n "$STY" ]
then
    __host="$(hostname | sed 's/\..*//')"
    __set_title() {
        printf "\033k%s\033\\" "$1"
        printf "\033]0;$__host:%s\007" "$1"
    }
    preexec() {
        __set_title "($(substr "$1" 0 7)) $(substr "$(basename "$PWD/")" 0 5)"
        [ -z $__cmd_time ] && __cmd_time="$(date '+%s')"
    }
    postexec() {
        local exitcode=$?

        # Set title to directory or $TITLE
        [ -z "$TITLE" ] && __set_title "$(substr "$PWD/" -10)" || \
            __set_title "$TITLE"

        # Report the time the command took if greater than a threshold
        local t=$[ $(date '+%s') - __cmd_time ]
        if [ $t -gt 3 -o $exitcode -ne 0 ]
        then
            if [ $exitcode -ne 0 ]
            then
                echo -en " [Finished in $t seconds "
                echo -e  "at $(date '+%H:%M:%S') with code $exitcode]\033[0m"
            else
                echo -en " [Finished in $t seconds "
                echo -e  "at $(date '+%H:%M:%S')]\033[0m"
            fi
        fi
        __cmd_time=
    }
fi

if [ -e $HOME/apps/todo.txt_cli/todo_completion -a \( $BASHMAJOR -gt 3 \) ]; then
    source $HOME/apps/todo.txt_cli/todo_completion
    alias t="todo.sh"
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
    alias ida='VirtualBox --startvm ida'

    alias temp='test -f /sys/devices/virtual/thermal/thermal_zone0/temp && cat /sys/devices/virtual/thermal/thermal_zone0/temp'
    alias adb-link='sudo `which adb` kill-server && sudo `which adb` start-server'
    alias scummvm='scummvm -d5'

    export PATH=$PATH:$HOME/adt-bundle-linux-x86/sdk/platform-tools/:$HOME/adt-bundle-linux-x86/sdk/tools/
    export ANDROID_LOG_TAGS="*:E WakeMe@:V"
fi

[[ -f "/home/hbush/.config/autopackage/paths-bash" ]] && . "/home/hbush/.config/autopackage/paths-bash" || true

