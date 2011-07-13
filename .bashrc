# ENVIRONMENT VARIABLES
export PS1='\w$ '
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/apps/lib/
export LD_LIBRARY_PATH=/usr/local/lib
export EDITOR="/usr/bin/gvim --nofork"
export PYTHONPATH="$HOME/lib/python/:$PYTHONPATH"
export MANPAGER="vimman"
export PATH=$HOME/bin:${PATH}

# ALIASES
alias bc='bc -l'

alias ls='ls --color=auto'
alias ll='ls -l'
alias lrt='ls -lrt'
alias lsd='ls -ld */'
alias l='ls -CF'
alias lcc='ls -l| grep -v "\.o$" | grep -v "\.a$"'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias np='cat >/dev/null'
alias h='history | grep -i '
alias p='ps -ef | grep -i '

alias vim='vim -o'
alias make='time make'

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

# Misspellings
alias cd..='cd ..'
alias cd-='cd -'
alias ls#='ls'
alias grerp='grep'

# Git
alias gg='git gui &'

lf()    {ls -d $PWD/$1*}
gitk()  {/usr/bin/gitk --all $* &}
cdd()   {cd $(echo $* | sed 's_/.*$_/_g')}
g()     {grep -li $* *}
cw()    {cat $(which $*)}
fw()    {file $(which $*)}
lw()    {ls -l $(which $*)}
vw()    {vim $(which $*)}

# COMPLETIONS
if [ -f /etc/bash_completion ]
then
	. /etc/bash_completion
fi

complete -cf cw
complete -cf lw
complete -cf fw
complete -cf vw

# HISTORY
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=4000

# Test if we're in framestore
if [ -e /job/fscfc/ ]; then
    alias go='. go-bash'
    alias findBroken='for i in $(find -type l ) ; do [ -e $i ] || echo -e "Broken: \e[31;1m$i\e[0m" ; done'

    # Anything that shouldn't be published to the web goes in this file
    source ~/.bashrc.fscfc
else
    alias start='gnome-open'

    # Wine / VM
    alias paf="wine $HOME/.wine/drive_c/Program\ Files/FamilySearch/Paf5/paf5.exe"
    alias autostitch="wine $HOME/autostitch/autostitch.exe"
    alias ida='VirtualBox --startvm ida'

    alias temp='test -f /sys/devices/virtual/thermal/thermal_zone0/temp && cat /sys/devices/virtual/thermal/thermal_zone0/temp'
    alias adb-link='sudo `which adb` kill-server && sudo `which adb` start-server'
    alias scummvm='scummvm -d5'

    export PATH=$PATH:$HOME/android-sdk-linux_86/platform-tools/:$HOME/android-sdk-linux_86/tools/
    export ANDROID_LOG_TAGS="*:E WakeMe@:V"
fi

