" ignore .git dirs
let g:ctrlp_custom_ignore = {
      \ 'dir': '\.git$'
      \ }

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
end

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
