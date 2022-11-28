# enable options
shopt -s checkhash
shopt -s checkwinsize
shopt -s cmdhist
shopt -s histappend
shopt -s histreedit
shopt -s lithist
shopt -s mailwarn

# define some colors
red='[0;31m'
RED='[1;31m'
blue='[0;34m'
BLUE='[1;34m'
cyan='[0;36m'
CYAN='[1;36m'
dark='[0;30m'
DARK='[1;30m'
NC='[0m'         # No Color

# variables
export BROWSER="firefox"
export EDITOR="vim"
export TERMINAL="lxterminal"
export FCEDIT="/usr/bin/vim"
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTIGNORE="&:bg:fg:la:ll:lla:llp:llap:ls:exit:exit *:h"
export HISTSIZE=10000
export MAILCHECK=1
export TERM

export PATH="~/.bin:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin"
#export PS1="\[$NC\]\u@\h(\[$RED\]\W\[$NC\])\\$ "
export PS1='$( code="$?" ; if [ "$code" -ne "0" ] ; then echo -n "\[$red\]$code " ; fi)$( echo -n \[$NC\] )\u@\h($( echo -n \[$RED\] )\W$( echo -n \[$NC\] ))\$$( echo -n \[$NC\] ) '

stty erase 

# define alias's
alias du='du -kh'
alias df='df -kTh'
alias g='grep'
alias l='less -R'
alias more='less'
alias psg='ps -ef | grep -v grep | grep '
alias vim='vim -u ~/.vimrc'

use_bat=`which bat 2>/dev/null || which batcat 2>/dev/null || echo /dev/null`
use_exa=`which exa 2>/dev/null || echo /dev/null`

# use these alternatives if they exist
if [ -x $use_bat ] ; then
    #echo "aliasing cat to $use_bat"
    alias cat=$use_bat
else
    unalias cat 2>/dev/null
fi
if [ -x $use_exa ] ; then
    #echo "aliasing ls to $use_exa"
    alias ls="$use_exa"
    alias la="$use_exa -a"
    alias lag="$use_exa -a | grep"
    alias lg="$use_exa | grep"
    alias ll="$use_exa -l --git"
    alias lla="$use_exa -la --git"
    alias llag="$use_exa -la --git | grep "
    alias llg="$use_exa -l --git | grep "
else
    alias ls='ls -hFp --color=auto '
    alias la='ls -hFpA --color=auto '
    alias lag='ls -hFpA | grep '
    alias lg='ls -hFp | grep '
    alias ll='ls -hFpl --color=auto '
    alias lla='ls -hFplA --color=auto '
    alias llag='ls -hFplA | grep '
    alias llg='ls -hFpl | grep '
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# start screen if interactive
if [[ $- == *i* ]] ; then
    if [[ "$TERM" == "linux" ]] ; then
        echo -n "run startx [Y/n/s/x]? "
        read x
        if [ "$x" == "s" ] ; then
            screen -raAd main || screen -S main
            exit
        elif [ "$x" == "x" ] ; then
            screen -x main || screen -S main
            exit
        elif [ "$x" != "n" ] ; then
            startx
        fi
    elif [[ "$TERM" =~ "screen" ]] ; then
        echo "already in screen" >> /dev/null
    elif [[ "$TERM" =~ "xterm" ]] ; then
        echo -n "run screen [Y/n/x]? "
        read x
        if [ "$x" == "x" ] ; then
            screen -x main || screen -S main
            exit
        elif [ "$x" != "n" ] ; then
            screen -raAd main || screen -S main
            exit
        fi
    fi
fi
