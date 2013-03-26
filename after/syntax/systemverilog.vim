" load TT2 syntax
unlet b:current_syntax
runtime! syntax/tt2.vim

" redefine verilogComment
syn match   verilogComment "//.*" contains=verilogTodo,@Spell,@tt2_top_cluster
" The following should be the right command but doesn't work
"syn cluster verilogComment add=tt2_top_cluster

