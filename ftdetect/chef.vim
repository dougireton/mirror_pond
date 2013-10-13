autocmd BufNewFile,BufRead */cookbooks/*/\(attributes\|definitions\|libraries\|providers\|recipes\|resources\)/*.rb set filetype=ruby.chef

autocmd BufNewFile,BufRead */cookbooks/*/templates/*/*.erb set filetype=eruby.chef
autocmd BufNewFile,BufRead */cookbooks/*/metadata.rb set filetype=ruby.chef

autocmd BufNewFile,BufRead */chef-repo/environments/*.rb set filetype=ruby.chef
autocmd BufNewFile,BufRead */chef-repo/roles/*.rb set filetype=ruby.chef
