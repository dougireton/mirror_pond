if !exists(':Tabularize')
  finish "quit here
endif

"align on first =
nnoremap <silent> <Leader>a= :Tabularize /^[^=]*\zs=<CR>
vnoremap <silent> <Leader>a= :Tabularize /^[^=]*\zs=<CR>

"align on first :
nnoremap <silent> <Leader>a: :Tabularize /^[^:]*:\zs/l0c1<CR>
vnoremap <silent> <Leader>a: :Tabularize /^[^:]*:\zs/l0c1<CR>

" align on Ruby hash rocket
nnoremap <silent> <Leader>a> :Tabularize /=><CR>
vnoremap <silent> <Leader>a> :Tabularize /=><CR>

" align on first comma
nnoremap <silent> <Leader>a, :Tabularize /,\zs<CR>
vnoremap <silent> <Leader>a, :Tabularize /,\zs<CR>
