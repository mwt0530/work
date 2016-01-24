#ibus config
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus


#Git config
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWUNTRACKEDFILES=1
#export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_DESCRIBE_STYLE="branch"
export GIT_PS1_SHOWCOLORHINTS=1
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

