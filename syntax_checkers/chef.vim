"============================================================================
"File:        chef.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Martin Grenfell <martin.grenfell at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================
" function! s:FindRubyExec()
"     if executable("rvm")
"         return system("rvm tools identifier")
"     endif

"     return "ruby"
" endfunction

" if !exists("g:syntastic_ruby_exec")
"     let g:syntastic_ruby_exec = s:FindRubyExec()
" endif

function! SyntaxCheckers_chef_IsAvailable()
    return executable('foodcritic')
endfunction

function! SyntaxCheckers_chef_GetLocList()
    " let exe = expand(g:syntastic_ruby_exec)
    " if !has('win32')
    "     let exe = 'RUBYOPT= ' . exe
    " endif

    let makeprg = syntastic#makeprg#build({
                \ 'exe': 'foodcritic',
                \ 'args': '' })

    " let errorformat = '%-G%.%#warning: %\(possibly %\)%\?useless use of == in void context'
    " FC023: Prefer conditional attributes: ./recipes/config.rb:49
    let errorformat = 'FC%n: %m: %f:%l'

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'chef',
    \ 'name': 'chef'})
