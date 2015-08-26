#!/bin/bash

cd $(dirname $0)
for DOTFILE in .?*
do
	if [ ${DOTFILE} != '..' ] && [ ${DOTFILE} != '.git' ]
	then
		ln -is "${HOME}/dotfiles/${DOTFILE}" ${HOME}/${DOTFILE}
	fi
done

# bundleの中にディレクトリが残っていると、それがすでにインストールされていると見なされるので消す。
rm -rf ${HOME}/.vim/bundle
mkdir ${HOME}/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim
