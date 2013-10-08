# Mirror Pond
An opinionated Vim distribution for Ruby and Chef development.

## Installation
### First time install for Mac OS X or Linux
1. Clone this repository:

    ``sh
    $ git clone https://github.com/dougireton/mirror_pond.git ~/.vim
    ```
2. Chmod the install.sh script:

    ```sh
    $ chmod u+x ~/.vim/install.sh
    ```
3. Run the install.sh script

    ```sh
    $ ~/.vim/install.sh
    ```
4. Now you are ready to run Vim.

### First time install for Windows
1. Clone this repository:

    ```bat
    c:\> git clone https://github.com/dougireton/mirror_pond.git ~/.vim
    ```
2. If you are using Vim < 7.4, you will need to create symlinks
   to .vimrc and .gvimrc:

    ```bat
    c:\> mklink $HOME\_vimrc $HOME\.vim\vimrc
    c:\> mklink $HOME\_gvimrc $HOME\.vim\gvimrc
    ```

3. Make the .vim/bundle directory:
    ```bat
    c:\> mkdir $HOME\.vim\bundle
    ```

4. Setup [Vundle]:

     ```bat
    c:\> git clone https://github.com/gmarik/vundle.git $HOME\.vim\bundle\vundle
     ```

5. Install configured bundles:

    Launch `vim`, run `:BundleInstall` 
    (or `vim +BundleInstall +qall` for CLI lovers)
