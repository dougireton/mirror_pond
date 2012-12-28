" maximize screen height. Set screen width to 84.
set lines=99 columns=178
" set fullscreen

set guioptions-=T		" Remove toolbar
set guioptions-=t		" Remove tear-off menus
set guioptions+=c		" Use :ex command-mode prompts instead of modal
                    " dialogs

if has("gui_macvim")
  " set guifont=Anonymous\ Pro:h14
  set guifont=Anonymous\ Pro\ for\ Powerline:h14
  set linespace=2
elseif has("Win32")
  set guifont=Consolas:h11
endif

" Setting these in GVim/MacVim because terminals cannot distinguish between
" <Space> and <S-Space> because curses sees them the same
nnoremap <Space> <PageDown>
nnoremap <S-Space> <PageUp>

if has("autocmd")
  " Automatically resize viewport splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif
