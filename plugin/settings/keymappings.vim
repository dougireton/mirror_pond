" ----------------------------------------------------------------------------
" Key mappings
" ----------------------------------------------------------------------------

if has("win32") || has("gui_win32")

  " Key mappings for Windows
  source $VIMRUNTIME/mswin.vim

endif

" exit to Normal mode with 'ii'
inoremap ii <ESC>

map Y y$			" Make 'Y' yank from cursor pos to EOL. This
				" makes 'Y' consistent with 'D' which deletes
				" from cursor pos to EOL.

nmap gV `[v`]			" Visually select the text that was last
				" edited/pasted. From
				" http://vimcasts.org/episodes/bubbling-text/

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

" TODO: Figure out a good mapping for ZoomWin
" <C-W> o doesn't seem to work properly

" paste fully-qualified path of current file into the command window
" This is useful with ex commands like :write, :edit, etc.
" From Practical Vim by Drew Neil, pg 94
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
