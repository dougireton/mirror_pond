" include_recipe 'current_cookbook::foo' => ./foo.rb
" include_recipe 'apache2::ssl' => apache2/recipes/ssl.rb
" include_recipe 'apache2' => 'apache2/recipes/default.rb

" Make gf work on Chef include_recipe lines
" Add all cookbooks/*/recipe dirs to Vim's path variable
setlocal path+=.;cookbooks

setlocal isfname+=:
setlocal includeexpr=substitute(substitute(v:fname,'::','/recipes/',''),'$','.rb','')


" Ruby's
" setlocal includeexpr=substitute(substitute(v:fname,'::','/recipes/default','g'),'$','.rb','')
