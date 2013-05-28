" Vim syntax file
" Language:	VHDL Addon
" Maintainer:	Alessandro Renieri <alrenier@tin.it>
"
if exists("b:current_syntax")
  finish
endif

" use vhdl syntax
" use source instead of runtime to avoid loops
" runtime! syntax/vhdl.vim
source $VIMRUNTIME/syntax/vhdl.vim

syn keyword vhdlTodo      contained TODO FIXME XXX
syn region  vhdlComment   start="--" end="$" contains=vhdlTodo keepend
syn region  vhdlPSL       start="--\s*psl\>" end=";$" keepend

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_vhms_syntax_inits")
  if version < 508
    let did_vhms_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink vhdlTODO         Todo
  HiLink vhdlPSL          Special
  "Hilink vhdlComment      Comment
    
  delcommand HiLink

endif

let b:current_syntax = "vhdl"
