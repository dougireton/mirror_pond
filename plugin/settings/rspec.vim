" https://github.com/thoughtbot/vim-rspec
nnoremap <unique> <leader>rf :call RunCurrentSpecFile()<CR>
nnoremap <unique> <leader>rs :call RunNearestSpec()<CR>
nnoremap <unique> <leader>rl :call RunLastSpec()<CR>
nnoremap <unique> <leader>ra :call RunAllSpecs()<CR>

" Run rspec tests via Tim Pope's Dispatch plugin if it's loaded
if exists("g:loaded_dispatch")
  let g:rspec_command = "Dispatch rspec {spec}"
endif
