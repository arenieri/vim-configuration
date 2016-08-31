" Vim syntax file
" Language:  syntax highlight for module_hrefs file (Design Sync hrefs description file)

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "module_hrefs"

setlocal comments=:#
setlocal commentstring=#%s

" case insensitive
syntax case ignore

syn keyword mhTodo contained   TODO
syn region  mhComment      start="^\s*\#" skip="\\$" end="$" contains=mhTodo

syntax keyword mhStatement   name relpath url
syntax keyword mhLatest      Latest

" matches from ; to "
syntax match   mhTag            /;\@<=\w[a-z0-9_.]\+\ze"/
" matches from ; to : (branch name)
syntax match   mhBranch         /;\@<=\w[a-z0-9_.]\+\ze:/
" matches from : to " (tag or version after branch name)
syntax match   mhBranchTag      /:\@<=[a-z0-9_.]\+\ze"/


highlight link mhTodo           Todo
highlight link mhComment        Comment
highlight link mhStatement      Statement
highlight link mhBranchTag      Identifier
highlight link mhBranch         PreProc
highlight link mhTag            Special
highlight link mhLatest         Todo

