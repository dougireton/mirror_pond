#!/bin/sh
set -e

vim_dir="$HOME/.vim"

if [ ! -d "$vim_dir" ]; then
  echo Please git clone mirror_pond to $vim_dir and run this script again...
  exit 1
fi

# Vim 7.4 looks for vimrc and gvimrc in the .vim directory, so only create
# symlinks for Vim < 7.4
vim_version=$(vim --version | grep -o 'Vi IMproved \d\.\d' | cut -d ' ' -f 3)
if (( $( bc <<< "$vim_version < 7.4" ) )); then
  ln -s $vim_dir/vimrc ~/.vimrc
  ln -s $vim_dir/gvimrc ~/.gvimrc
fi

if [ "$(uname)" == "Darwin" ]; then
  home_library="$HOME/Library"

  cd $home_library
  echo Creating backup, swap, and undo dirs under $home_library/Vim/
  mkdir -p Vim/backup
  mkdir -p Vim/swap
  mkdir -p Vim/undo
fi

mkdir $vim_dir/bundle
git clone https://github.com/gmarik/vundle.git $vim_dir/bundle/vundle
vim +BundleInstall +qall
echo Thank you for installing Mirror Pond!
