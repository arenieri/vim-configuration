"Add tt2 syntax highlight in a Tcl file


unlet! b:current_syntax
syntax include @tt2Syn syntax/tt2.vim

syntax cluster TCLcluster contains=tcl.*
syntax cluster tt2tcl contains=@tt2_top_cluster add=@TCLcluster

syntax region tt2Reg matchgroup=tt2Headers  start="# pragma tt2_begin .*" end="##>> Start of tt2 inline generated code. .*" contains=test,testHeaders
syntax region test                          start="#"lc=1 end="$" contained contains=@tt2tcl


syntax match tt2Headers "## End of tt2 inline generated code! <<##"
syntax match tt2Headers "# pragma tt2_end"
highlight tt2Headers gui=bold guibg=DarkBlue guifg=Magenta

syntax match testHeaders "\(^ *\zs#\)\{1}" contained containedin=@tt2_top_cluster
highlight link testHeaders tt2Headers


