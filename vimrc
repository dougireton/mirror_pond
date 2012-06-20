" ----------------------------------------------------------------------------
"  Vundle setup
" ----------------------------------------------------------------------------
filetype off 			" Required for Vundle

set rtp+=~/.vim/bundle/vundle/	" Add vundle to the RuntimePath
call vundle#rc()

" Let Vundle manage Vundle. Required!
Bundle 'gmarik/vundle'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nelstrom/vim-visual-star-search'

filetype plugin indent on	" Turn on Filetype detection, plugins, and 

runtime macros/matchit.vim	" use the built-in Matchit plugin

" ----------------------------------------------------------------------------
"  moving around, searching and patterns
" ----------------------------------------------------------------------------
set incsearch			" Highlight pattern matches as you type
set ignorecase			" ignore case when using a search pattern
set smartcase			" override 'ignorecase' when pattern 
				" has upper case character

" ----------------------------------------------------------------------------
"  tags
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  displaying text
" ----------------------------------------------------------------------------
set scrolloff=3			" number of screen lines to show around 
				" the cursor

set linebreak			" For lines longer than the window,
				" wrap intelligently. This doesn't 
				" insert hard line breaks.

set showbreak=++\ \ 		" string to put before wrapped screen
				" lines

set sidescrolloff=2		" min # of columns to keep left/right of cursor

" Define characters to show when you show formatting
set listchars=tab:▸\ ,trail:·,precedes:<,extends:…
set number			" show line numbers

" ----------------------------------------------------------------------------
"  syntax, highlighting and spelling
" ----------------------------------------------------------------------------
set background=dark
set colorcolumn=+2		" display a line in column 80 (`textwidth` + 2)
				" to show you when to line break.

" ----------------------------------------------------------------------------
"  multiple windows
" ----------------------------------------------------------------------------
set laststatus=2		" Show a status line, even if there's only one 
				" Vim window

set switchbuf=usetab		" Jump to the 1st open window which contains
				" specified buffer, even if the buffer is in 
				" another tab.
				" TODO: Add 'split' if you want to split the
				" current window for a quickfix error window.

" set splitright			" a new window is put to the right of the
				" current one

" ----------------------------------------------------------------------------
"  multiple tab pages
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  terminal
" ----------------------------------------------------------------------------
set ttyfast			" this is the 21st century, people

" ----------------------------------------------------------------------------
"  using the mouse
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  GUI				" Set these options in .gvimrc
" See help for 'setting-guifont' for tips on how to set guifont on Mac vs Windows
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  printing
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  messages and info
" ----------------------------------------------------------------------------

set showcmd			" In the status bar, show incomplete commands 
				" as they are typed

set ruler			" Always display the current cursor position in 
				" the Status Bar

" ----------------------------------------------------------------------------
"  selecting text
" ----------------------------------------------------------------------------
set clipboard=unnamed		" Yank to the system clipboard by default

" ----------------------------------------------------------------------------
"  editing text			" TODO: look at these options
" ----------------------------------------------------------------------------
set showmatch			" when inserting a bracket, briefly jump to its 
				" match

set nojoinspaces		" Use only one space after '.' when joining 
				" lines, instead of two

" ----------------------------------------------------------------------------
"  tabs and indenting
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  folding
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  diff mode
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  mapping
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  reading and writing files
" ----------------------------------------------------------------------------
set autoread			" Automatically re-read files changed outside 
				" of Vim

" ----------------------------------------------------------------------------
"  the swap file
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  command line editing
" ----------------------------------------------------------------------------
set wildmode=list:longest
set wildmenu
set wildignorecase

" ----------------------------------------------------------------------------
"  executing external commands
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  running make and jumping to errors
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  language specific
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  multi-byte characters
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  various
" ----------------------------------------------------------------------------
set gdefault                    " use the 'g' flag for :substitute

" ----------------------------------------------------------------------------
" Key mappings
" ----------------------------------------------------------------------------
" exit to Normal mode with 'ii'
inoremap ii <ESC>

" Make it easier to switch between windows
" From here: http://vimcasts.org/episodes/working-with-windows/
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" repeat the last :substitute command and preserve flags
" from Practical Vim by Drew Neil: 'Repeat the previous substitute command'
nnoremap & :&&<Enter>
xnoremap & :&&<Enter>
