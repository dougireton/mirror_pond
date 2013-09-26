" Handle these cases:
" include_recipe 'current_cookbook::foo' => ./foo.rb
" include_recipe "#{cookbook_name}::foo" => ./foo.rb
" include_recipe 'apache2::ssl' => apache2/recipes/ssl.rb
function! ChefIncludeExpr(file)
  let l:match_colon = match(a:file, '::')

  if l:match_colon == 0
    " a:file == '::foo'
    " This is an edge case, e.g. include_recipe "#{cookbook_name}::log-parser"
    let l:included_recipe=substitute(substitute(a:file, '::', '',''), '$','.rb','')
  elseif l:match_colon > 0
    " a:file == 'git::source'
    " This is the most likely case
    let l:included_recipe=substitute(substitute(a:file,'::','/recipes/',''),'$','.rb','')
  else
    " if we get here, the user has 'gf' on something which isn't a filename
    " return the string and let Vim handle it natively
    return a:file
  endif

  return l:included_recipe
endfunction

" Make gf work on Chef include_recipe lines
" Add all cookbooks/*/recipe dirs to Vim's path variable
setlocal path+=.;cookbooks
setlocal includeexpr=ChefIncludeExpr(v:fname)
setlocal isfname+=:

" make this case work:
" include_recipe 'apache2' => apache2/recipes/default.rb
setlocal suffixesadd+=/recipes/default.rb

" TODO: Add Berkshelf support
" require 'berkshelf'
" cbs = Berkshelf.cookbook_store
" cbs.storage_path.to_path
