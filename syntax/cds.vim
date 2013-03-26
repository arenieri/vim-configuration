" Vim syntax file
" Language:	Cadence Design System ini files
" Maintainer:	Alessandro Renieri <a.renieri@gmail.com>
"
if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "cds"

" case insensitive
:syntax case ignore

syntax keyword cdsStatement DEFINE SOFTDEFINE INCLUDE SOFTINCLUDE UNDEFINE
syntax match   cdsVar		 "\$\w*"
syntax match   cdsVar		 "\$(.*)"
syntax match   cdsVar		 "\${.*}"

" Comments
syntax match cdsComment  /^#.*/
syntax match cdsComment  /^--.*/
syntax match cdsComment  /^\/\/.*/

highlight link cdsComment Comment
highlight link cdsStatement Statement
highlight link cdsString String
highlight link cdsVar Identifier


