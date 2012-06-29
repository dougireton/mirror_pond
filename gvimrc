colorscheme solarized

" maximize screen height. Set screen width to 84.
set lines=999 columns=84

" Remove toolbar (T), tear-off menus (t) and use console prompts instead of
" modal dialogs
set guioptions-=T
set guioptions-=t
set guioptions+=c

if has("gui_macvim")
  set guifont=Anonymous\ Pro:h14
elseif has("Win32")
  set guifont=Consolas:h11
endif

" Setting these in GVim/MacVim because terminals cannot distinguish between
" <Space> and <S-Space> because curses sees them the same
nnoremap <Space> <PageDown>
nnoremap <S-Space> <PageUp>
