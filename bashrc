# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
set -o vi
alias vi=/usr/bin/vim

if [ -f ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
	export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi

export PATH=$PATH:~/bin
stty -ixon
