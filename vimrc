" vim:fdm=marker
" vimrc
" ----------------------------------------------------------------------------
" License {{{1
" ----------------------------------------------------------------------------
" Copyright 2013 Doug Ireton

" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at

"     http://www.apache.org/licenses/LICENSE-2.0

" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

" ----------------------------------------------------------------------------
"  Vim package manager {{{1
" ----------------------------------------------------------------------------
"  Setup {{{2
filetype off 			" Required for Vundle

set rtp+=~/.vim/bundle/vundle/	" Add vundle to the RuntimePath
call vundle#rc()

" Let Vundle manage Vundle. Required!
Plugin 'gmarik/vundle'

" Various editing plugins {{{2
Plugin 'kana/vim-textobj-user'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'ZoomWin'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-endwise'
Plugin 'godlygeek/tabular'
Plugin 'HarnoRanaivo/vim-neatfoldtext'
Plugin 'dougireton/vim-qargs'
Plugin 'justinmk/vim-sneak'

" Comment plugin {{{2
Plugin 'tpope/vim-commentary'

" File managers/explorers {{{2
Plugin 'kien/ctrlp.vim'

" Shell/OS integration plugins {{{2
Plugin 'tpope/vim-dispatch'

if executable('ack')
  Bundle 'mileszs/ack.vim'
endif

if executable('ag')
  Bundle 'rking/ag.vim'
endif

Plugin 'mhinz/vim-startify'
Plugin 'chrisbra/Recover.vim'

" Tmux plugins {{{2
if executable('tmux')
  Bundle 'christoomey/vim-tmux-navigator'
  Bundle 'sjl/vitality.vim'
endif

" Buffer plugins {{{2
Plugin 'moll/vim-bbye'

" Status bar plugins {{{2
Plugin 'bling/vim-airline'

" Colorschemes {{{2
Plugin 'altercation/vim-colors-solarized'
Plugin 'endel/vim-github-colorscheme'

" Ruby plugins {{{2
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'
Plugin 'vim-ruby/vim-ruby'

" Chef plugins {{{2
Plugin 'dougireton/vim-chef'

" JSON plugins {{{2
Plugin 'elzr/vim-json'

" Markdown plugins {{{2
Plugin 'tpope/vim-markdown'

" PowerShell plugins {{{2
Plugin 'dougireton/vim-ps1'

" Wiki {{{2
Plugin 'vimwiki'

" Syntax check on buffer save {{{2
Plugin 'scrooloose/syntastic'

" Source Control plugins {{{2
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'mhinz/vim-signify'

" Filetype detection, plugins, indent, syntax {{{1
if has('autocmd')
  filetype plugin indent on	  " Turn on Filetype detection, plugins, and
                              " indent
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable			" Turn on syntax highlighting
endif

" Builtin plugins {{{1
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" load the man plugin for a nice man viewer
runtime! ftplugin/man.vim

" ----------------------------------------------------------------------------
"  Moving around, searching and patterns {{{1
" ----------------------------------------------------------------------------
set nostartofline     " keep cursor in same column for long-range motion cmds
set incsearch			    " Highlight pattern matches as you type
set ignorecase			  " ignore case when using a search pattern
set smartcase			    " override 'ignorecase' when pattern has upper case
                      " character

" ----------------------------------------------------------------------------
"  Tags {{{1
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Displaying text {{{1
" ----------------------------------------------------------------------------
set scrolloff=3       " number of screen lines to show around the cursor

set linebreak			    " For lines longer than the window, wrap intelligently.
                      " This doesn't insert hard line breaks.

set showbreak=↪\ \ 		" string to put before wrapped screen lines

set sidescrolloff=2		" min # of columns to keep left/right of cursor
set display+=lastline " show last line, even if it doesn't fit in the window

set cmdheight=2 		  " # of lines for the command window
                      " cmdheight=2 helps avoid 'Press ENTER...' prompts

" Define characters to show when you show formatting
" stolen from https://github.com/tpope/vim-sensible
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  endif
endif

set number			      " show line numbers

" ----------------------------------------------------------------------------
"  Syntax, highlighting and spelling {{{1
" ----------------------------------------------------------------------------
set background=dark

" ignore colorscheme doesn't exist error if solarized isn't installed
silent! colorscheme solarized

if exists('+colorcolumn')
  set colorcolumn=80    " display a line in column 80 to show you
                        " where to line break.
endif

" ----------------------------------------------------------------------------
"  Multiple windows {{{1
" ----------------------------------------------------------------------------
set laststatus=2  	  " Show a status line, even if there's only one
                      " Vim window

set hidden		    	  " allow switching away from current buffer w/o writing

set switchbuf=usetab  " Jump to the 1st open window which contains
                      " specified buffer, even if the buffer is in
                      " another tab.
                      " TODO: Add 'split' if you want to split the
                      " current window for a quickfix error window.

set statusline=
set statusline+=b%-1.3n\ >                    " buffer number
set statusline+=\ %{fugitive#statusline()}:
set statusline+=\ %F
set statusline+=\ %M
set statusline+=%R
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=
set statusline+=\ %Y
set statusline+=\ <\ %{&fenc}
set statusline+=\ <\ %{&ff}
set statusline+=\ <\ %p%%
set statusline+=\ %l:
set statusline+=%02.3c   	" cursor line/total lines

set helpheight=30         " Set window height when opening Vim help windows

" ----------------------------------------------------------------------------
"  Multiple tab pages {{{1
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Terminal {{{1
" ----------------------------------------------------------------------------
set ttyfast			      " this is the 21st century, people

" ----------------------------------------------------------------------------
"  Using the mouse {{{1
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  GUI {{{1			     
"  Set these options in .gvimrc
" See help for 'setting-guifont' for tips on how to set guifont on Mac vs Windows
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Printing {{{1
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Messages and info {{{1
" ----------------------------------------------------------------------------
set showcmd			    " In the status bar, show incomplete commands
                    " as they are typed

set noshowmode      " don't display the current mode (Insert, Visual, Replace)
                    " in the status line. This info is already shown in the
                    " Airline status bar.

set ruler			      " Always display the current cursor position in
                    " the Status Bar

set confirm         " Ask to save buffer instead of failing when executing
                    " commands which close buffers

" ----------------------------------------------------------------------------
"  Selecting text {{{1
" ----------------------------------------------------------------------------

set clipboard=unnamed	" Yank to the system clipboard by default

" ----------------------------------------------------------------------------
"  Editing text {{{1
" ----------------------------------------------------------------------------
set backspace=indent,eol,start  "backspace over everything

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j 	  " delete comment char on second line when
                          " joining two commented lines
endif

set showmatch  			      " when inserting a bracket, briefly jump to its
                          " match

set nojoinspaces	  	    " Use only one space after '.' when joining
                          " lines, instead of two

set completeopt+=longest 	" better omni-complete menu

set nrformats-=octal      " don't treat numbers with leading zeros as octal
                          " when incrementing/decrementing

" ----------------------------------------------------------------------------
"  Tabs and indenting {{{1
" ----------------------------------------------------------------------------
set tabstop=2             " tab = 2 spaces
set shiftwidth=2          " autoindent indents 2 spaces
set smarttab              " <TAB> in front of line inserts 'shiftwidth' blanks
set softtabstop=2
set shiftround            " round to 'shiftwidth' for "<<" and ">>"
set expandtab

" ----------------------------------------------------------------------------
"  Folding {{{1
" ----------------------------------------------------------------------------
if has('folding')
  set nofoldenable 		         " When opening files, all folds open by default
  set foldtext=NeatFoldText()  " Use a custom foldtext function
endif

" ----------------------------------------------------------------------------
"  Diff mode {{{1
" ----------------------------------------------------------------------------
set diffopt+=vertical       " start diff mode with vertical splits by default

" ----------------------------------------------------------------------------
"  Mapping {{{1
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Reading and writing files {{{1
" ----------------------------------------------------------------------------
set autoread			          " Automatically re-read files changed outside
                            " of Vim

" ----------------------------------------------------------------------------
"  The swap file {{{1
" ----------------------------------------------------------------------------

" Set swap file, backup and undo directories to sensible locations
" Taken from https://github.com/tpope/vim-sensible
" The trailing double '//' on the filenames cause Vim to create undo, backup,
" and swap filenames using the full path to the file, substituting '%' for
" '/', e.g. '%Users%bob%foo.txt'
let s:dir = has('win32') ? '$APPDATA/Vim' : match(system('uname'), "Darwin") > -1 ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'
if isdirectory(expand(s:dir))
  if &directory =~# '^\.,'
    let &directory = expand(s:dir) . '/swap//,' . &directory
  endif
  if &backupdir =~# '^\.,'
    let &backupdir = expand(s:dir) . '/backup//,' . &backupdir
  endif
  if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
    let &undodir = expand(s:dir) . '/undo//,' . &undodir
  endif
endif
if exists('+undofile')
  set undofile
endif

" ----------------------------------------------------------------------------
"  Command line editing {{{1
" ----------------------------------------------------------------------------
set history=200    " Save more commands in history
                   " See Practical Vim, by Drew Neil, pg 68

set wildmode=list:longest,full

" File tab completion ignores these file patterns
set wildignore+=*.exe,*.swp,.DS_Store,.git/*
set wildmenu

" Add guard around 'wildignorecase' to prevent terminal vim error
if exists('&wildignorecase')
  set wildignorecase
endif

" ----------------------------------------------------------------------------
"  Executing external commands {{{1
" ----------------------------------------------------------------------------

if has("win32") || has("gui_win32")
  if executable("PowerShell")
    " Set PowerShell as the shell for running external ! commands
    " http://stackoverflow.com/questions/7605917/system-with-powershell-in-vim
    set shell=PowerShell
    set shellcmdflag=-ExecutionPolicy\ RemoteSigned\ -Command
    set shellquote=\"
    " shellxquote must be a literal space character.
    set shellxquote= 
  endif
endif

" ----------------------------------------------------------------------------
"  Running make and jumping to errors {{{1
" ----------------------------------------------------------------------------

if executable('grep')
  set grepprg=grep\ --line-number\ -rIH\ --exclude-dir=tmp\ --exclude-dir=.git\ --exclude=tags\ $*\ /dev/null
endif

" ----------------------------------------------------------------------------
"  Language specific {{{1
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Multi-byte characters {{{1
" ----------------------------------------------------------------------------
set encoding=utf-8

" ----------------------------------------------------------------------------
"  Various {{{1
" ----------------------------------------------------------------------------
set gdefault              " For :substitute, use the /g flag by default

" ----------------------------------------------------------------------------
" Autocmds {{{1
" ----------------------------------------------------------------------------


" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
" From https://github.com/thoughtbot/dotfiles/blob/master/vimrc
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" ----------------------------------------------------------------------------
" Allow overriding these settings {{{1
" ----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
