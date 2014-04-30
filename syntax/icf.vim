" Vim syntax file
" Language:     Log files
" Maintainer:   Alessandro Renieri

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "icf"

" case insensitive
"syntax case ignore

setlocal comments=:#
setlocal commentstring=#%s

syntax match    icfComment      "#.*$"

syntax keyword  icfStatement    undo_mark
syntax keyword  icfStatement    mark
syntax match    icfOption       /-instance/
syntax match    icfOption       /-ignore/
syntax match    icfOption       /-covered/
syntax match    icfOption       /-b/
syntax match    icfOption       /-e/
syntax match    icfNumber       "-\=\<\d\+\>"

highlight default link icfComment       Comment
highlight default link icfStatement     Statement
highlight default link icfOption        Special
highlight default link icfNumber        ColorColumn
"highlight default link icfNumber        CursorLine
