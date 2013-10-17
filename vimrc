" vimrc
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
"  Vundle setup
" ----------------------------------------------------------------------------
filetype off 			" Required for Vundle

set rtp+=~/.vim/bundle/vundle/	" Add vundle to the RuntimePath
call vundle#rc()

" Let Vundle manage Vundle. Required!
Bundle 'gmarik/vundle'

" Various editing plugins
Bundle 'kana/vim-textobj-user'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'ZoomWin'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-endwise'
Bundle 'godlygeek/tabular'
Bundle 'HarnoRanaivo/vim-neatfoldtext'

" Comment plugin
Bundle 'tpope/vim-commentary'

" File managers/explorers
Bundle 'kien/ctrlp.vim'

" Shell/OS integration plugins
Bundle 'tpope/vim-dispatch'

if executable('ack')
  Bundle 'mileszs/ack.vim'
endif

if executable('ag')
  Bundle 'rking/ag.vim'
endif

Bundle 'mhinz/vim-startify'
Bundle 'chrisbra/Recover.vim'

" Tmux plugins
if executable('tmux')
  Bundle 'christoomey/vim-tmux-navigator'
  Bundle 'sjl/vitality.vim'
endif

" Buffer plugins
Bundle 'moll/vim-bbye'

" Status bar plugins
Bundle 'bling/vim-airline'

" Colorschemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'endel/vim-github-colorscheme'

" Ruby plugins
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rake'
Bundle 'vim-ruby/vim-ruby'

" Chef plugins
Bundle 'dougireton/vim-chef'

" JSON plugins
Bundle 'elzr/vim-json'

" Markdown plugins
Bundle 'tpope/vim-markdown'

" PowerShell plugins
Bundle 'dougireton/vim-ps1'

" Wiki
Bundle 'vimwiki'

" Syntax check on buffer save
Bundle 'scrooloose/syntastic'

" Source Control plugins
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
Bundle 'mhinz/vim-signify'


if has('autocmd')
  filetype plugin indent on	  " Turn on Filetype detection, plugins, and
                              " indent
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable			" Turn on syntax highlighting
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" load the man plugin for a nice man viewer
runtime! ftplugin/man.vim

" ----------------------------------------------------------------------------
"  moving around, searching and patterns
" ----------------------------------------------------------------------------
set nostartofline     " keep cursor in same column for long-range motion cmds
set incsearch			    " Highlight pattern matches as you type
set ignorecase			  " ignore case when using a search pattern
set smartcase			    " override 'ignorecase' when pattern has upper case
                      " character

" ----------------------------------------------------------------------------
"  tags
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  displaying text
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
"  syntax, highlighting and spelling
" ----------------------------------------------------------------------------
set background=dark

" ignore colorscheme doesn't exist error if solarized isn't installed
silent! colorscheme solarized

if exists('+colorcolumn')
  set colorcolumn=80    " display a line in column 80 to show you
                        " where to line break.
endif

" ----------------------------------------------------------------------------
"  multiple windows
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
"  multiple tab pages
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  terminal
" ----------------------------------------------------------------------------
set ttyfast			      " this is the 21st century, people

" ----------------------------------------------------------------------------
"  using the mouse
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  GUI				      " Set these options in .gvimrc
" See help for 'setting-guifont' for tips on how to set guifont on Mac vs Windows
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  printing
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  messages and info
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
"  selecting text
" ----------------------------------------------------------------------------

set clipboard=unnamed	" Yank to the system clipboard by default

" ----------------------------------------------------------------------------
"  editing text
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
"  tabs and indenting
" ----------------------------------------------------------------------------
set tabstop=2             " tab = 2 spaces
set shiftwidth=2          " autoindent indents 2 spaces
set smarttab              " <TAB> in front of line inserts 'shiftwidth' blanks
set softtabstop=2
set shiftround            " round to 'shiftwidth' for "<<" and ">>"
set expandtab

" ----------------------------------------------------------------------------
"  folding
" ----------------------------------------------------------------------------
if has('folding')
  set nofoldenable 		       " When opening files, all folds open by default
endif

set foldtext=NeatFoldText()  "Use a custom foldtext function

" ----------------------------------------------------------------------------
"  diff mode
" ----------------------------------------------------------------------------
set diffopt+=vertical       " start diff mode with vertical splits by default

" ----------------------------------------------------------------------------
"  mapping
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  reading and writing files
" ----------------------------------------------------------------------------
set autoread			          " Automatically re-read files changed outside
                            " of Vim

" ----------------------------------------------------------------------------
"  the swap file
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
"  command line editing
" ----------------------------------------------------------------------------
set history=200    " Save more commands in history
                   " See Practical Vim, by Drew Neil, pg 68

set wildmode=list:longest,full

" File tab completion ignores these file patterns
set wildignore+=*.exe,*.swp,.DS_Store
set wildmenu

" Add guard around 'wildignorecase' to prevent terminal vim error
if exists('&wildignorecase')
  set wildignorecase
endif

" ----------------------------------------------------------------------------
"  executing external commands
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
"  running make and jumping to errors
" ----------------------------------------------------------------------------

if executable('grep')
  set grepprg=grep\ --line-number\ -rIH\ --exclude-dir=tmp\ --exclude-dir=.git\ --exclude=tags\ $*\ /dev/null
endif

" ----------------------------------------------------------------------------
"  language specific
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  multi-byte characters
" ----------------------------------------------------------------------------
set encoding=utf-8

" ----------------------------------------------------------------------------
"  various
" ----------------------------------------------------------------------------
set gdefault              " For :substitute, use the /g flag by default

" ----------------------------------------------------------------------------
" Autocmds
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
" Allow overriding these settings
" ----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
