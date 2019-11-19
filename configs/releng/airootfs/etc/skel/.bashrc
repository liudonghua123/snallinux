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
export BROWSER="elinks"
export EDITOR="vim"
export FCEDIT="/usr/bin/vim"
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTIGNORE="&:bg:fg:la:ll:lla:llp:llap:ls:exit:exit *:h"
export HISTSIZE=10000
export MAILCHECK=1
export PATH="~/.bin:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin"
#export PS1="\[$NC\]\u@\h(\[$RED\]\W\[$NC\])\\$ "
export PS1='$( code="$?" ; if [ "$code" -ne "0" ] ; then echo -n "\[$red\]$code " ; fi)$( echo -n \[$NC\] )\u@\h($( echo -n \[$RED\] )\W$( echo -n \[$NC\] ))\$$( echo -n \[$NC\] ) '


# define alias's
alias du='du -kh'
alias df='df -kTh'
alias l='less'
alias g='grep'
alias more='less'
alias psg='ps -ef | grep -v grep | grep '

# ls alias's

alias la='ls -hFpA --color=auto '
alias lag='ls -hFpA | grep '
alias lam='ls -hFpA | less '
alias lg='ls -hFp | grep '
alias ll='ls -hFpl --color=auto '
alias lla='ls -hFplA --color=auto '
alias llag='ls -hFplA | grep '
alias llam='ls -hFplA | less '
alias llg='ls -hFpl | grep '
alias llm='ls -hFpl | less '
alias lm='ls -hFp | less '
alias ls='ls -hFp --color=auto '

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
