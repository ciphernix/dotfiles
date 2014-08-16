HOST=`hostname -s`

export PS1='$(print -en "\033]0;${USER}@${HOST}:${PWD}\a"; print -n "${USER}@${HOST}:";if [[ "${PWD#$HOME}" != "$PWD" ]] then; print -n "~${PWD#$HOME}"; else; print -n "$PWD";fi;print "$ ")'

set -o vi
alias vi=/usr/bin/vim

export PATH=$PATH:~/bin
stty -ixon
