" ftplugin/chef.vim
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

if (exists('b:did_ftplugin'))
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

" Handle these cases:
" include_recipe 'current_cookbook::foo' => ./foo.rb
" include_recipe "#{cookbook_name}::foo" => ./foo.rb
" include_recipe 'apache2::ssl' => apache2/recipes/ssl.rb

" Make gf work on Chef include_recipe lines
" Add all cookbooks/*/recipe dirs to Vim's path variable
setlocal path+=.,**1/recipes;cookbooks,**1;cookbooks

" Add Berkshelf cookbooks to the search path
" TODO: Make this work on Windows
if isdirectory($BERKSHELF_PATH . '/cookbooks')
  setlocal path+=$BERKSHELF_PATH/cookbooks/**1/recipes,$BERKSHELF_PATH/cookbooks/**1
elseif isdirectory($HOME . '/.berkshelf/cookbooks')
  setlocal path+=$HOME/.berkshelf/cookbooks/**1/recipes,$HOME/.berkshelf/cookbooks/**1
endif

" make this case work:
" include_recipe 'apache2' => apache2/recipes/default.rb
setlocal suffixesadd+=/recipes/default.rb

let &cpo = s:cpo_save
unlet s:cpo_save

" Vim will execute this to undo any options set in this ftplugin
let b:undo_ftplugin = 'setlocal path< suffixesadd<'
