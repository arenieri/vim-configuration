" Vim syntax file
" Language:	Cadence Design System option script files (tcl syntax + something)
" Maintainer:	Alessandro Renieri <a.renieri@gmail.com>
"
if exists("b:current_syntax")
  finish
endif

runtime! syntax/tcl.vim

setlocal comments=:#
setlocal commentstring=#%s

unlet b:current_syntax
let b:current_syntax = "f"

syntax match ffileComment  /\/\/.*/

highlight link ffileComment Comment

