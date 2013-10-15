# Mirror Pond
An opinionated Vim distribution for Ruby and Chef development. Mirror Pond tries
to adhere closely to the spirit and "grammar" of Vim, while extending it to
better support Ruby and Chef development through judicious use of plugins.

## Name
Mirror Pond is named after my favorite beer - [Deschutes Mirror Pond Pale
Ale](http://www.deschutesbrewery.com/brew/mirror-pond-pale-ale).

It seemed appropriate to combine two of my favorite things - beer and Vim.

## Features
### Chef
1. `gf` on any `include_recipe` to jump to the included recipe.
    You can even jump to the `default` recipe, e.g. `gf` on `include_recipe
    'git'` will jump to the `default.rb` recipe in the `git` cookbook.

2. If you have [Foodcritic](http://acrmp.github.io/foodcritic/) installed, Vim
   will display Foodcritic errors inline via [Syntastic](https://github.com/scrooloose/syntastic).

![Syntastic Foodcritic errors](_assets/syntastic_foodcritic.png "Syntastic
Foodcritic errors")

### Ruby
1. If you have [Rubocop](https://github.com/bbatsov/rubocop) installed, Vim will display Rubocop errors inline via
   Syntastic.

2. Surround variable with "#{ * }" using Tim Pope's Surround plugin.

3. Surround text in Erb templates, "<% * -%>" and "<%= * %>"  using Tim Pope's Surround plugin.

4. Insert Ruby hash rocket, `=>` via `<Ctrl-l>`.

## Installation
### First time install for Mac OS X or Linux
1. Clone this repository:

    ```sh
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
    c:\> git clone https://github.com/dougireton/mirror_pond.git $HOME\.vim
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
