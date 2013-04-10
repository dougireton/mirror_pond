" only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

nnoremap <buffer> <silent> P :Pick<CR>
nnoremap <buffer> <silent> S :Squash<CR>
nnoremap <buffer> <silent> E :Edit<CR>
nnoremap <buffer> <silent> R :Reword<CR>
nnoremap <buffer> <silent> F :Fixup<CR>

