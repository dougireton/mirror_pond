" only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" specify 2-space indent for Vim files
 setlocal expandtab
 setlocal tabstop=2 shiftwidth=2 softtabstop=2

" 'K' on a Vim keyword brings up Vim help
set keywordprg=":help"
