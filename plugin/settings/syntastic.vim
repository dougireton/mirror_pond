" use Rubocop syntax checker for Ruby
if executable('rubocop')
  let g:syntastic_ruby_checkers = ['mri', 'rubocop']
endif
