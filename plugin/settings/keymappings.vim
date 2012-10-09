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

" Use ^p and ^n to navigate and filter command-line history
" From Practical Vim by Drew Neil, Tip 34
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" repeat the last :substitute command and preserve flags
" from Practical Vim by Drew Neil: 'Repeat the previous substitute command'
nnoremap & :&&<Enter>
xnoremap & :&&<Enter>

" swap mark motion commands to jump to mark's line and col with right pinky
" see http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

" paste fully-qualified path of current file into the command window
" This is useful with ex commands like :write, :edit, etc.
" From Practical Vim by Drew Neil, pg 94
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" These functions depend on the Preserve function defined in
" plugins/settings/functions.vim

" Delete trailing whitespace
nnoremap <silent> <leader>dw :call Preserve("%s/\\s\\+$//e")<CR>

" Reindent entire file
nnoremap <silent> <leader>= :call Preserve("normal gg=G")<CR>

" mute search highlighting
" from Practical Vim by Drew Neil, Tip 80 'Highlight Search Matches'
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
