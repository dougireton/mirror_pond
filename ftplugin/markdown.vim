" ftplugin/markdown
" Copyright 2013 Doug Ireton

" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at

"     http://www.apache.org/licenses/LICENSE-2.0

" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

" wrap lines at 80
setlocal textwidth=80

" override tabs for Markdown files.
" To produce a code block in Markdown, simply indent every line of the
" block by at least 4 spaces or 1 tab.
setlocal tabstop=4
setlocal softtabstop=4

" Enable spellchecking for Markdown
setlocal spell
