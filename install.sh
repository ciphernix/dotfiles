#!/bin/bash
BASEDIR="$( cd "$(dirname "$0")" ; pwd -P )"
echo $BASEDIR
SCRIPTNAME=$0

function usage() {
	echo "Install dot files...."
	echo "Usage: ${SCRIPTNAME} <bash> <vim> <all>"
	echo
}

function install_bash() {
	if [ -f ~/.bashrc ]; then
		cp ~/.bashrc ~/.bashrc.bkp
	fi
	if [ -f ~/.bash_profile ]; then
		cp ~/.bash_profile ~/.bash_profile.bkp
	fi
	ln -sf ${BASEDIR}/bashrc ~/.bashrc
	ln -sf ${BASEDIR}/bash_profile ~/.bash_profile
	ln -sf ${BASEDIR}/git-prompt.sh ~/.git-prompt.sh
	echo "Installed bash dot files"
}

function install_vim() {
	if [ -f ~/.vimrc ]; then
		mv ~/.vimrc ~/.vimrc.bkp
	fi

	if [ -d ~/.vim ]; then
		mv ~/.vim ~/vim.bkp
	fi

	ln -sf ${BASEDIR}/vimrc ~/.vimrc
	ln -sf ${BASEDIR}/vim ~/.vim

    if [ -f ~/.ctags ]; then
        grep "langmap=Go:.go" ~/.ctags > /dev/null
        if [  $? -ne 0 ]; then
            cat ${BASEDIR}/ctags >> ~/.ctags
        fi
    else # No ctags file, just copy our go def
        ln -sf ${BASEDIR}/ctags ~/.ctags
    fi

	echo "Installed vim dot files."
}

function install_tmux() {
    if [ -f ~/.tmux.conf ]; then
        cp ~/.tmux.conf ~/.tmux.conf.bkp
    fi
    ln -sf ${BASEDIR}/tmux/_tmux.conf ~/.tmux.conf

    if [ -f ~/.tmux-themepack ]; then
        cp ~/.tmux-themepack ~/.tmux-themepack.bkp
    fi
    ln -sf ${BASEDIR}/tmux/_tmux-themepack ~/.tmux-themepack
}

case "$1" in
	bash)
	  install_bash
	  ;;

	vim)
	  install_vim
	  ;;
	tmux)
	  install_tmux
	  ;;

	all)
	 install_bash
	 install_vim
     install_tmux
	 ;;

	 *)
	   usage
	   exit 1
esac

