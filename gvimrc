" Copyright 2013 Doug Ireton

" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at

"     http://www.apache.org/licenses/LICENSE-2.0

" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

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
