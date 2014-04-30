" Vim syntax file
" Language:     Log files
" Maintainer:   Alessandro Renieri

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "vsif"

" case insensitive
"syntax case ignore

setlocal comments=://
setlocal commentstring=//%s

syntax match    vsifInclude    "^#.*"
syntax match    vsifKey        "^.*:"
syntax match    vsifEnvvar     "$[a-zA-Z0-9_()]\+"
syntax keyword  vsifSection    session group

syntax match    vsifComment    "//.*"

highlight default link vsifInclude      Include
highlight default link vsifKey          Type
highlight default link vsifEnvvar       Identifier
highlight default link vsifSection      Keyword
highlight default link vsifComment      Comment

