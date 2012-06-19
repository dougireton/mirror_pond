vimfiles
========

Vim files for OSX and Windows


## Quick start for Mac OS X
1. Clone this repository:

    ```
    $ git clone git://github.com/dougireton/vimfiles.git ~/.vim
    ````

2. Create symlinks to .vimrc and .gvimrc:

    ```
    $ ln -s ~/.vim/vimrc ~/.vimrc
    $ ln -s ~/.vim/gvimrc ~/.gvimrc
    ````

3. Setup [Vundle]:

     ```
     $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
     ```

4. Install configured bundles:

     Launch `vim`, run `:BundleInstall` 
     (or `vim +BundleInstall +qall` for CLI lovers)
