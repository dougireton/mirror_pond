" ignore .git dirs
let g:ctrlp_custom_ignore = {
      \ 'dir': '\.git$'
      \ }

" show dotfiles and dotdirs
let g:ctrlp_show_hidden = 1

" keymappings for Ctrl-P
nnoremap <leader>cb :CtrlPBuffer<cr>
nnoremap <leader>cm :CtrlPMRU<cr>

" tags = ct
nnoremap <leader>ct :CtrlPTag<cr>
" directory = cd
" line = cl
" changes = cc

" registers = cr
" marks = c'
