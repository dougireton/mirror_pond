#!/bin/sh

set -e

vim_dir="~/.vim"
if [ ! -d "$vim_dir" ]; then
  echo Please git clone mirror_pond to $vim_dir and try again.
  exit 1
fi

# Vim 7.4 looks for vimrc and gvimrc in the .vim directory, so only create
# symlinks for Vim < 7.4
vim_version=$(vim --version | grep -o 'Vi IMproved \d\.\d' | cut -d ' ' -f 3)
if (( $( bc <<< "$vim_version < 7.4" ) )); then
  ln -s $vim_dir/vimrc ~/.vimrc
  ln -s $vim_dir/gvimrc ~/.gvimrc
fi

mkdir $vim_dir/bundle
git clone https://github.com/gmarik/vundle.git $vim_dir/bundle/vundle
vim +BundleInstall +qall
echo Thank you for installing Mirror Pond!
