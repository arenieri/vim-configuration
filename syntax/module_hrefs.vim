" Vim syntax file
" Language:  syntax highlight for module_hrefs file (Design Sync hrefs description file)

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "module_hrefs"

" case insensitive
syntax case ignore

syntax keyword mhStatement   name realpath url
syntax keyword mhLatest      Latest

" matches from ; to "
syntax match   mhTag            /;\@<=\w[a-z0-9_.]\+\ze"/
" matches from ; to : (branch name)
syntax match   mhBranch         /;\@<=\w[a-z0-9_.]\+\ze:/
" matches from : to " (tag or version after branch name)
syntax match   mhBranchTag      /:\@<=[a-z0-9_.]\+\ze"/

highlight link mhStatement      Statement
highlight link mhBranchTag      Identifier
highlight link mhBranch         PreProc
highlight link mhTag            Special
highlight link mhLatest         Todo
