" Vim syntax file
" Language:     SystemVerilog (includes Verilog)
" Maintainer:   
" Last Update:  Thu Jul 27 12:54:08 IST 2006
" Version: 1.1

if exists("b:current_syntax")
   finish
endif
let b:current_syntax = "systemverilog"

syn sync lines=1000

" Set the local value of the 'iskeyword' option.
" NOTE: '?' was added so that verilogNumber would be processed correctly when
"       '?' is the last character of the number.
setlocal iskeyword=@,48-57,63,_,192-255

"##########################################################
"       Verilog Syntax
"##########################################################
syn keyword verilogStatement   always and assign automatic buf
syn keyword verilogStatement   bufif0 bufif1 cell cmos
syn keyword verilogStatement   config deassign defparam design
syn keyword verilogStatement   disable edge endconfig
syn keyword verilogStatement   endfunction endgenerate endmodule
syn keyword verilogStatement   endprimitive endspecify endtable endtask
syn keyword verilogStatement   event force function
syn keyword verilogStatement   generate genvar highz0 highz1 ifnone
syn keyword verilogStatement   incdir include initial inout input
syn keyword verilogStatement   instance integer large liblist
syn keyword verilogStatement   library localparam macromodule medium
syn keyword verilogStatement   module nand negedge nmos nor
syn keyword verilogStatement   noshowcancelled not notif0 notif1 or
syn keyword verilogStatement   output parameter pmos posedge primitive
syn keyword verilogStatement   pull0 pull1 pulldown pullup
syn keyword verilogStatement   pulsestyle_onevent pulsestyle_ondetect
syn keyword verilogStatement   rcmos real realtime reg release
syn keyword verilogStatement   rnmos rpmos rtran rtranif0 rtranif1
syn keyword verilogStatement   scalared showcancelled signed small
syn keyword verilogStatement   specify specparam strong0 strong1
syn keyword verilogStatement   supply0 supply1 table task time tran
syn keyword verilogStatement   tranif0 tranif1 tri tri0 tri1 triand
syn keyword verilogStatement   trior trireg unsigned use vectored wait
syn keyword verilogStatement   wand weak0 weak1 wire wor xnor xor
syn keyword verilogLabel       begin end fork join
syn keyword verilogConditional if else case casex casez default endcase
syn keyword verilogRepeat      forever repeat while for

syn keyword verilogTodo contained TODO
syn match   verilogTodo contained "FIXME\(:[a-zA-Z0-9_]*\)*"

syn match   verilogOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  verilogComment start="/\*" end="\*/" contains=verilogTodo,@Spell
syn match   verilogComment "//.*" contains=verilogTodo,@Spell

syn match   verilogGlobal "`[a-zA-Z0-9_]\+\>"
syn match   verilogGlobal "`celldefine"
syn match   verilogGlobal "`default_nettype"
syn match   verilogGlobal "`define"
syn match   verilogGlobal "`else"
syn match   verilogGlobal "`elsif"
syn match   verilogGlobal "`endcelldefine"
syn match   verilogGlobal "`endif"
syn match   verilogGlobal "`ifdef"
syn match   verilogGlobal "`ifndef"
syn match   verilogGlobal "`include"
syn match   verilogGlobal "`line"
syn match   verilogGlobal "`nounconnected_drive"
syn match   verilogGlobal "`resetall"
syn match   verilogGlobal "`timescale"
syn match   verilogGlobal "`unconnected_drive"
syn match   verilogGlobal "`undef"
syn match   verilogGlobal "$[a-zA-Z0-9_]\+\>"

syn match   verilogConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[bB]\s*[0-1_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[oO]\s*[0-7_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[dD]\s*[0-9_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   verilogNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  verilogString start=+"+ skip=+\\"+ end=+"+ contains=verilogEscape,@Spell
syn match   verilogEscape +\\[nt"\\]+ contained
syn match   verilogEscape "\\\o\o\=\o\=" contained

" Directives
syn match   verilogDirective   "//\s*synopsys\>.*$"
syn region  verilogDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  verilogDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   verilogDirective   "//\s*\$s\>.*$"
syn region  verilogDirective   start="/\*\s*\$s\>" end="\*/"
syn region  verilogDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"##########################################################
"       SystemVerilog Syntax
"##########################################################


" IEEE1800-2005
syn keyword systemverilogStatement   always_comb always_ff always_latch
syn keyword systemverilogStatement   class endclass new
syn keyword systemverilogStatement   virtual local const protected
syn keyword systemverilogStatement   package endpackage
syn keyword systemverilogStatement   rand randc constraint randomize
syn keyword systemverilogStatement   with inside dist
syn keyword systemverilogStatement   sequence endsequence randsequence 
syn keyword systemverilogStatement   srandom
syn keyword systemverilogStatement   logic bit byte
syn keyword systemverilogStatement   int longint shortint
syn keyword systemverilogStatement   struct packed
syn keyword systemverilogStatement   final
syn keyword systemverilogStatement   import export
syn keyword systemverilogStatement   context pure 
syn keyword systemverilogStatement   void shortreal chandle string
syn keyword systemverilogStatement   clocking endclocking iff
syn keyword systemverilogStatement   interface endinterface modport
syn keyword systemverilogStatement   cover covergroup coverpoint endgroup
syn keyword systemverilogStatement   property endproperty
syn keyword systemverilogStatement   program endprogram
syn keyword systemverilogStatement   bins binsof illegal_bins ignore_bins
syn keyword systemverilogStatement   alias matches solve static assert
syn keyword systemverilogStatement   assume super before expect bind
syn keyword systemverilogStatement   extends null tagged extern this
syn keyword systemverilogStatement   first_match throughout timeprecision
syn keyword systemverilogStatement   timeunit type union 
syn keyword systemverilogStatement   uwire var cross ref wait_order intersect
syn keyword systemverilogStatement   wildcard within

syn keyword systemverilogTypeDef     typedef enum

syn keyword systemverilogConditional randcase
syn keyword systemverilogConditional unique priority

syn keyword systemverilogRepeat      return break continue
syn keyword systemverilogRepeat      do foreach

syn keyword systemverilogLabel       join_any join_none forkjoin

" IEEE1800-2009 add
syn keyword systemverilogStatement   checker endchecker
syn keyword systemverilogStatement   accept_on reject_on
syn keyword systemverilogStatement   sync_accept_on sync_reject_on
syn keyword systemverilogStatement   eventually nexttime until until_with
syn keyword systemverilogStatement   s_always s_eventually s_nexttime s_until s_until_with
syn keyword systemverilogStatement   let untyped
syn keyword systemverilogStatement   strong weak
syn keyword systemverilogStatement   restrict global implies

syn keyword systemverilogConditional unique0

" IEEE1800-2012 add
syn keyword systemverilogStatement   implements
syn keyword systemverilogStatement   interconnect soft nettype

"" The following regexp matches '// pragma' but does not match commented pragmas '//// pragma'
syn match  verilogPragma       "\%(//\)\@<!//\s*pragma.*$"

"--------------------
"     HighLights
"--------------------

" Color definition for Pragmas
highlight verilogPragma_hi      guifg=#80A0FF   guibg=DarkMagenta
highlight BeginEnd_hi           guifg=Green     gui=italic,bold

" Verilog default highlighting.
hi def link verilogCharacter            Character
hi def link verilogConditional          Conditional
hi def link verilogRepeat               Repeat
hi def link verilogString               String
hi def link verilogTodo                 Todo
hi def link verilogComment              Comment
hi def link verilogConstant             Constant
"hi def link verilogLabel                Label
hi     link verilogLabel                BeginEnd_hi
hi def link verilogNumber               Number
hi def link verilogOperator             Special
hi def link verilogStatement            Statement
hi def link verilogGlobal               Define
hi def link verilogDirective            SpecialComment
hi def link verilogEscape               Special

" SystemVerilog default highlighting.
hi def link systemverilogStatement      Statement
hi def link systemverilogTypeDef        TypeDef
hi def link systemverilogConditional    Conditional
hi def link systemverilogRepeat         Repeat
"hi def link systemverilogLabel          Label
hi     link systemverilogLabel          BeginEnd_hi
hi def link systemverilogGlobal         Define
hi def link systemverilogNumber         Number

" Pragmas
hi def link verilogPragma               verilogPragma_hi

" vim: ts=8
