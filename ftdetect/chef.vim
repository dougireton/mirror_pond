autocmd BufNewFile,BufRead */cookbooks/*/\(attributes\|definitions\|libraries\|providers\|recipes\|resources\)/*.rb set filetype=chef.ruby

autocmd BufNewFile,BufRead */cookbooks/*/templates/*/*.erb set filetype=chef.eruby
autocmd BufNewFile,BufRead */cookbooks/*/readme.md set filetype=chef.markdown
autocmd BufNewFile,BufRead */cookbooks/*/metadata.rb set filetype=chef.ruby

autocmd BufNewFile,BufRead */chef-repo/environments/*.rb set filetype=chef.ruby
autocmd BufNewFile,BufRead */chef-repo/roles/*.rb set filetype=chef.ruby
