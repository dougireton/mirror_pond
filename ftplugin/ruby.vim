" specify 2-space indent for Ruby files
setlocal expandtab
setlocal tabstop=2 shiftwidth=2 softtabstop=2

" highlight ruby whitespace errors
let ruby_space_errors = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

" set the 'foldmethod' option to 'syntax' and allow folding of
" classes, modules, methods, code blocks, heredocs and comments.
let ruby_fold = 1

" Activate Ruby.vim's tooltips for Ruby keywords
setlocal ballooneval

" The compiler plugins contain instructions which allow Vim to run the
" specified source file with an appropriate executable, parse any errors, and
" jump to the corresponding error location if required.
compiler ruby
