#!/bin/sh

git clone git://github.com/dougireton/vimfiles.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
mkdir ~/.vim/bundle
git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
