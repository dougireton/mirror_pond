" pretty print JSON buffer
if executable('python')
  setlocal equalprg=python\ -m\ json.tool
endif
