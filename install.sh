#!/bin/bash 
BASEDIR=$(dirname "$0")
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
	ln -sf ${BASEDIR}/bashrc ~/.bashrc 
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

	echo "Installed vim dot files."
}

case "$1" in 
	bash)
	  install_bash
	  ;;

	vim)
	  install_vim
	  ;;

	all)
	 install_bash
	 install_vim
	 ;;
	
	 *)
	   usage
	   exit 1
esac

