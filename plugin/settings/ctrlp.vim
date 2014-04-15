" Ctrl-P User Command
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

elseif executable('git')
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
endif


" keymappings for Ctrl-P
nnoremap <leader>cb :CtrlPBuffer<cr>
nnoremap <leader>cm :CtrlPMRU<cr>

" tags = ct
" directory = cd
" line = cl
" changes = cc

" registers = cr
" marks = c'
