" from http://vimcasts.org/episodes/tidying-whitespace/
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let save_cursor = getpos('.')
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call setpos('.', save_cursor)
endfunction
