# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#ibus config
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus

#black=$'\[\e[1;30m\]'
#red=$'\[\e[1;31m\]'
#green=$'\[\e[1;32m\]'
#yellow=$'\[\e[1;33m\]'
#blue=$'\[\e[1;34m\]'
#magenta=$'\[\e[1;35m\]'
#cyan=$'\[\e[1;36m\]'
#white=$'\[\e[1;37m\]'
#normal=$'\[\e[m\]'

#Git config
if [ -f ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
	export GIT_PS1_SHOWDIRTYSTATE=1
	#export GIT_PS1_SHOWSTASHSTATE=1
	export GIT_PS1_SHOWUNTRACKEDFILES=1
	#export GIT_PS1_SHOWUPSTREAM="auto verbose"
	export GIT_PS1_DESCRIBE_STYLE="branch"
	export GIT_PS1_SHOWCOLORHINTS=1
	#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
	export PS1='[\u@\h \W\[\e[0;36m\]$(__git_ps1 " (%s)")\[\e[m\]]\$ '
fi

#bashmarks
if [  -f ~/.local/bin/bashmarks.sh ];then
	source ~/.local/bin/bashmarks.sh
fi

#python completion in interactive mode
if [ -f ~/.pythonstartup ];then
    export PYTHONSTARTUP=~/.pythonstartup
fi
