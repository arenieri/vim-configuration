"------------------------------------------------------
" Add custom types to systemverilog
syn keyword verilogCustomType   iwire realwire

highlight verilogCustomType_hi  guifg=lightgreen

highlight def link   verilogCustomType     verilogCustomType_hi

"------------------------------------------------------
" Add tt2 syntax highlight in a SystemVerilog file

unlet! b:current_syntax
syntax include @tt2Syn syntax/tt2.vim

syntax region tt2Reg matchgroup=tt2Headers  start="// pragma tt2_begin .*" end="////>> Start of tt2 inline generated code. .*" contains=tt2Line,tt2LineHeaders
syntax region tt2Line                       start="//"lc=2 end="$" contained contains=@tt2Syn,verilog.*

syntax match tt2Headers "//// End of tt2 inline generated code! <<////"
syntax match tt2Headers "// pragma tt2_end"
highlight tt2Headers gui=bold guibg=DarkBlue guifg=Magenta

syntax match tt2LineHeaders "\(^ *\zs//\)\{1}" contained containedin=@tt2Syn
highlight link tt2LineHeaders tt2Headers

