" Handle these cases:
" include_recipe 'current_cookbook::foo' => ./foo.rb
" include_recipe "#{cookbook_name}::foo" => ./foo.rb
" include_recipe 'apache2::ssl' => apache2/recipes/ssl.rb

" Make gf work on Chef include_recipe lines
" Add all cookbooks/*/recipe dirs to Vim's path variable
setlocal path+=.,**1/recipes;cookbooks,**1;cookbooks

" make this case work:
" include_recipe 'apache2' => apache2/recipes/default.rb
setlocal suffixesadd+=/recipes/default.rb

" TODO: Add Berkshelf support
" require 'berkshelf'
" cbs = Berkshelf.cookbook_store
" cbs.storage_path.to_path
