" ----------------------------------------------------------------------------
" Key mappings
" ----------------------------------------------------------------------------

if has("win32") || has("gui_win32")
  " Key mappings for Windows
  source $VIMRUNTIME/mswin.vim
endif

" exit to Normal mode with 'kj'
inoremap <unique> kj <ESC>

" Make 'Y' yank from cursor pos to EOL. This
" makes 'Y' consistent with 'D' which deletes
" from cursor pos to EOL.
nnoremap <unique> Y y$

" Visually select the text that was last
" edited/pasted. From
" http://vimcasts.org/episodes/bubbling-text/
nnoremap <unique> gV `[v`]

if !exists("g:loaded_tmux_navigator")
  " Make it easier to switch between windows
  " From here: http://vimcasts.org/episodes/working-with-windows/
  nnoremap <unique> <C-h> <C-w>h
  nnoremap <unique> <C-j> <C-w>j
  nnoremap <unique> <C-k> <C-w>k
  nnoremap <unique> <C-l> <C-w>l
endif

" Open and close the quickfix list
nnoremap <unique> <silent> <leader>qc :cclose<cr>
nnoremap <unique> <silent> <leader>qo :cwindow<cr>

" Use ^p and ^n to navigate and filter command-line history
" From Practical Vim by Drew Neil, Tip 34
cnoremap <unique> <C-p> <Up>
cnoremap <unique> <C-n> <Down>

" repeat the last :substitute command and preserve flags
" from Practical Vim by Drew Neil: 'Repeat the previous substitute command'
nnoremap <unique> & :&&<Enter>
xnoremap <unique> & :&&<Enter>

" swap mark motion commands to jump to mark's line and col with right pinky
" see http://items.sjbach.com/319/configuring-vim-right
nnoremap <unique> ' `
nnoremap <unique> ` '

" paste fully-qualified path of current file into the command window
" This is useful with ex commands like :write, :edit, etc.
" From Practical Vim by Drew Neil, pg 94
cnoremap <unique> <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" These functions depend on the Preserve function defined in
" plugins/settings/functions.vim

" Delete trailing whitespace
nnoremap <unique> <silent> <leader>dw :call Preserve("%s/\\s\\+$//e")<CR>

" Reindent entire file
nnoremap <unique> <silent> <leader>e :call Preserve("normal! gg=G")<CR>

" Quickly switch to alternate file
nnoremap <unique> <leader>a <C-^>

" Write current file using sudo. If you forgot to 'sudo vim filename.txt', use
" this command.
" see
" http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
if has("unix")
  cnoremap <unique> w!! w !sudo tee > /dev/null %
endif

" Mirrors and reversals
nno  <silent> <leader>fr   :set lz<cr>'aO<esc>ma'':'a+1,.g/^/m 'a<cr>kdd:set lz!<cr>
vno  <silent> <leader>fr   :<c-u>set lz<CR>O<esc>V'>:g/^/m '<<cr>'<dd:set lz!<cr>
nmap <silent> <leader>fR   V'a\fR
vno  <silent> <leader>fR   c<C-O>:set ri lz<cr><C-R>"<esc>:norm! dd`<<cr>:set ri! lz!<cr>
