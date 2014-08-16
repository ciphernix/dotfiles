# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
set -o vi
alias vi=/usr/bin/vim

export PATH=$PATH:~/bin
stty -ixon
