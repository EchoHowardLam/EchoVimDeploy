#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

OverwriteWithBackup()
{
	# This bash function will copy src to dest
	# If dest already exist before the copy, then dest.old will be created as backup

	# Arguments:
	# 1 string src : source file name
	# 2 string dest : destination file name
	if [ -z "$1" ] || [ -z "$2" ] ; then return ; fi
	local src=$1
	local dest=$2

	if [ -f ${dest} ] ; then
		echo Renaming old ${dest} to ${dest}.old as backup
		mv ${dest} ${dest}.old
	fi

	echo Copying new ${src}
	cp ${src} ${dest}
}

if [ ! -f ~/.vim/autoload/plug.vim ] ; then
	echo First time installing vim plug
	# Vim (~/.vim/autoload)
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

OverwriteWithBackup $SCRIPT_DIR/vimrc.template ~/.vimrc

