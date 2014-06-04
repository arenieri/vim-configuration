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

" Remove ',' as allowed character in filenames
" This is needed to correctly identify filenames in log files when using 'gf'
" to open filename under cursor.
setlocal isfname-=,

" gf -> go to file under cursor
" gF -> go to file under cursor at line after filename
" remap gf to gF
nnoremap gf gF

"-------------------------------------------------------------------------
" Syntax
syntax match beLogSourceStart       /^Start:\s\+Sourcing.*$/
syntax match beLogSourceStop        /^Finish:\s\+Sourcing.*$/

syntax match beLogDSourceStart      /.*Information:\s\+Starting\sscript.*$/
syntax match beLogDSourceStop       /.*Information:\s\+Finished\sscript.*$/
syntax match beLogDSourceOpt        /.*Information:\s\+Optional\sscript.*$/

syntax keyword beLogInformation     Information
syntax keyword beLogWarning         Warning
syntax keyword beLogError           Error
syntax match beLogSevereError       /Severe\sError\>/

syntax match cdsLogNote             /.*\*N,.*$/
syntax match cdsLogError            /.*\*E,.*$/
syntax match cdsLogWarning          /.*\*W,.*$/
syntax match cdsLogFatal            /.*\*F,.*$/


syntax keyword uvmInfo              UVM_INFO
syntax keyword uvmWarning           UVM_WARNING
syntax keyword uvmError             UVM_ERROR
syntax keyword uvmFatal             UVM_FATAL

syntax keyword genericInfo          INFO NOTE

syntax keyword simSuccess           SUCCESS


"-------------------------------------------------------------------------
" Highlight color definition
highlight beLogSourceStart_hi       guifg=LightGray     guibg=DarkGreen
highlight beLogSourceStop_hi        guifg=LightGray     guibg=DarkRed
highlight beLogSourceOpt_hi         guifg=LightGray     guibg=DarkCyan

highlight beLogInformation_hi       guifg=Cyan
highlight beLogWarning_hi           guifg=Orange
highlight beLogError_hi             guifg=Red


highlight cdsLogNote_hi             guifg=Cyan          guibg=Black
highlight cdsLogError_hi            guifg=Red           guibg=Black
highlight cdsLogWarning_hi          guifg=Orange        guibg=Black
highlight cdsLogFatal_hi            guifg=Magenta       guibg=Black

highlight uvmInfo_hi                guifg=Cyan
highlight uvmWarning_hi             guifg=Orange
highlight uvmError_hi               guifg=Red
highlight uvmFatal_hi               guifg=Magenta

highlight simSuccess_hi             guifg=green

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


highlight default link cdsLogNote           cdsLogNote_hi
highlight default link cdsLogWarning        cdsLogWarning_hi
highlight default link cdsLogError          cdsLogError_hi
highlight default link cdsLogFatal          cdsLogFatal_hi

highlight default link uvmInfo              uvmInfo_hi
highlight default link uvmWarning           uvmWarning_hi
highlight default link uvmError             uvmError_hi
highlight default link uvmFatal             uvmFatal_hi

highlight default link genericInfo          uvmInfo_hi

highlight default link simSuccess           simSuccess_hi

