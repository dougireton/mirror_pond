# Mirror Pond
An opinionated Vim distribution for Ruby and Chef development 


## First time install for Mac OS X
1. Clone this repository:

    ```
    $ git clone https://github.com/dougireton/mirror_pond.git ~/.vim
    ````

2. Create symlinks to .vimrc and .gvimrc:

    ```
    $ ln -s ~/.vim/vimrc ~/.vimrc
    $ ln -s ~/.vim/gvimrc ~/.gvimrc
    ````

3. Make the .vim/bundle directory:
    ````
    $ mkdir ~/.vim/bundle
    ````

4. Setup [Vundle]:

     ```
    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
     ```

5. Install configured bundles:

    Launch `mvim`, run `:BundleInstall` 
    (or `mvim +BundleInstall +qall` for CLI lovers)
