#ibus config
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

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
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWSTASHSTATE=1
#export GIT_PS1_SHOWUNTRACKEDFILES=1
#export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_DESCRIBE_STYLE="branch"
export GIT_PS1_SHOWCOLORHINTS=1
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export PS1='[\u@\h \W\[\e[0;36m\]$(__git_ps1 " (%s)")\[\e[m\]]\$ '

#bashmarks
source ~/.local/bin/bashmarks.sh
