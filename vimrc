" ----------------------------------------------------------------------------
"  Vundle setup
" ----------------------------------------------------------------------------
filetype off 			" Required for Vundle

set rtp+=~/.vim/bundle/vundle/	" Add vundle to the RuntimePath
call vundle#rc()

" Let Vundle manage Vundle. Required!
Bundle 'gmarik/vundle'

" Language-specific syntax files
Bundle 'vim-ruby/vim-ruby'
Bundle 'elzr/vim-json'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-git'
Bundle 'dougireton/vim-ps1'

" Syntax check on buffer save
Bundle 'scrooloose/syntastic'

" Git plugin
Bundle 'tpope/vim-fugitive'

" Various editing plugins
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'ZoomWin'

" File managers/explorers
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'

" PowerLine for an awesome status line
Bundle "Lokaltog/vim-powerline"

" Colorschemes
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on	" Turn on Filetype detection, plugins, and
				" indent
syntax enable			" Turn on syntax highlighting

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

set hidden			" allow switching away from current buffer w/o
				" writing

set switchbuf=usetab		" Jump to the 1st open window which contains
                                " specified buffer, even if the buffer is in
                                " another tab.
                                " TODO: Add 'split' if you want to split the
                                " current window for a quickfix error window.

set splitright			" Create new vertically split windows to the
				" right of the current window instead of to the
				" left

set statusline=
set statusline+=b%-1.3n\ >
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
set statusline+=%02.3c   "cursor line/total lines

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

if has("win32") || has("win64")
  set directory=$TEMP
end

" ----------------------------------------------------------------------------
"  command line editing
" ----------------------------------------------------------------------------
set wildmode=list:longest
set wildignore+=*.exe,*.swp,.DS_Store	" File tab completion ignores these file patterns
set wildmenu
set wildignorecase

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
    " TODO: shellxquote must be a literal space character.
    " Fix my trim trailing whitespace command to not run automatically on save
    set shellxquote= 
  endif
endif

" ----------------------------------------------------------------------------
"  running make and jumping to errors
" ----------------------------------------------------------------------------

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
set gdefault                    " For :substitute, use the /g flag by default


" ----------------------------------------------------------------------------
" Autocmds
" ----------------------------------------------------------------------------
if has("autocmd")
  " use the :help command for 'K' in .vim files
  autocmd FileType vim set keywordprg=":help"

  " Visual Studio .proj files are XML
  au BufRead,BufNewFile *.proj set filetype=xml

endif
