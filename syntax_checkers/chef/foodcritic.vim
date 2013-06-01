"============================================================================
"File:        foodcritic.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Martin Grenfell <martin.grenfell at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists("g:loaded_syntastic_chef_foodcritic_checker")
  finish
endif
let g:loaded_syntastic_chef_foodcritic_checker=1

function! SyntaxCheckers_chef_foodcritic_IsAvailable()
  return executable('foodcritic')
endfunction

function! SyntaxCheckers_chef_foodcritic_GetLocList()
  let makeprg = syntastic#makeprg#build({
        \ 'exe': 'foodcritic',
        \ 'args': '' })

  " FC023: Prefer conditional attributes: ./recipes/config.rb:49
  let errorformat = 'FC%n: %m: %f:%l'

  return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
      \ 'filetype': 'chef',
      \ 'name': 'foodcritic'})
