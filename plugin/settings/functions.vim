" from http://vimcasts.org/episodes/tidying-whitespace/
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let save_cursor = getpos('.')
  let last_search = getreg('/')
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  call setpos('.', save_cursor)
  call setreg('/', last_search)
endfunction
