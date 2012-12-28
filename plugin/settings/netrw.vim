" vspilt files to the right window
let g:netrw_altv = 1

" split files to the bottom window
" let g:netrw_alto = 1

" Files and directories to hide
let g:netrw_list_hide='.DS_Store,^\.git/$'

" define shortcut to return to netrw window
let g:netrw_retmap = 1
nmap <silent> <leader>d <Plug>NetrwReturn

" vpslit when previewing files
let g:netrw_preview = 1

" 30% of window for netrw, 70% for file
let g:netrw_winsize = 70

" don't write error msgs to separate window
let g:netrw_use_errorwindow = 0
