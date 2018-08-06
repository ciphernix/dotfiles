# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
set -o vi
if [ -x ~/.local/vim/bin/vim ]; then
    vim_path=~/.local/vim/bin
    alias vi=~/.local/vim/bin/vim
else
    alias vi=/usr/bin/vim
fi

if [ -f ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
	export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi

export PATH=$PATH:~/bin
export GOPATH=~/go
export GOROOT=/usr/local/go
export PATH=$vim_path:~/bin:${GOPATH}/bin/:${GOROOT}/bin:$PATH
stty -ixon
