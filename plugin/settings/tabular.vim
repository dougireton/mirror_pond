if exists(":Tabularize")
  nnoremap <silent> <Leader>a= :call Preserve("Tabularize /=")<CR>
  vnoremap <silent> <Leader>a= :call Preserve("Tabularize /=")<CR>

  nnoremap <silent> <Leader>a: :call Preserve("Tabularize /:\zs")<CR>
  vnoremap <silent> <Leader>a: :call Preserve("Tabularize /:\zs")<CR>

  nnoremap <silent> <Leader>a> :call Preserve("Tabularize /=>")<CR>
  vnoremap <silent> <Leader>a> :call Preserve("Tabularize /=>")<CR>
endif

