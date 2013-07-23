" Vim syntax file
" Language:	Log files
" Maintainer:	Alessandro Renieri
"
if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "log"

" case insensitive
syntax case ignore

"-------------------------------------------------------------------------
" Syntax
syntax match beLogSourceStart       /^Start:\s\+Sourcing.*$/
syntax match beLogSourceStop        /^Finish:\s\+Sourcing.*$/

syntax match beLogDSourceStart      /.*Information:\s\+Starting\sscript.*$/
syntax match beLogDSourceStop       /.*Information:\s\+Finished\sscript.*$/
syntax match beLogDSourceOpt        /.*Information:\s\+Optional\sscript.*$/

syntax match beLogInformation       /Information\>/
syntax match beLogWarning           /Warning\>/
syntax match beLogError             /Error\>/
syntax match beLogSevereError       /Severe\sError\>/

syntax match cdsLogError                 /.*\*E,.*$/


"-------------------------------------------------------------------------
" Highlight color definition
highlight beLogSourceStart_hi       guifg=LightGray     guibg=DarkGreen
highlight beLogSourceStop_hi        guifg=LightGray     guibg=DarkRed
highlight beLogSourceOpt_hi         guifg=LightGray     guibg=DarkCyan

highlight beLogInformation_hi       guifg=Cyan
highlight beLogWarning_hi           guifg=Orange
highlight beLogError_hi             guifg=Red

highlight cdsLogError_hi            guifg=Red           guibg=Black


"-------------------------------------------------------------------------
" Highlight definition
highlight default link beLogSourceStart     beLogSourceStart_hi
highlight default link beLogDSourceStart    beLogSourceStart_hi
highlight default link beLogSourceStop      beLogSourceStop_hi
highlight default link beLogDSourceStop     beLogSourceStop_hi
highlight default link beLogDSourceOpt      beLogSourceOpt_hi
highlight default link beLogInformation     beLogInformation_hi
highlight default link beLogWarning         beLogWarning_hi
highlight default link beLogError           beLogError_hi
highlight default link beLogSevereError     beLogError_hi

highlight default link cdsLogError          cdsLogError_hi

