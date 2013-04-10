" only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" specify 4-space indent for PowerShell files
setlocal expandtab
setlocal tabstop=4 shiftwidth=4 softtabstop=4
