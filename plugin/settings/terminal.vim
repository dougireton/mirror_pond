" Settings for terminal Vim
if !has("gui_running")
  " Set cursor shape to bar in insert mode and block in normal mode
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"

  set title 			" show Vim buffer info in window title

  set mouse=a 			" use the mouse in terminal Vim
endif
