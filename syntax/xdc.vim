" Vim syntax file
" Language:     Vivado syntax highlight (tcl syntax + something)
" Maintainer:   Alessandro Renieri <a.renieri@gmail.com>
"
if exists("b:current_syntax")
  finish
endif

runtime! syntax/tcl.vim


unlet b:current_syntax
let b:current_syntax = "xdc"


syntax keyword xdcStatement     set_disable_timing set_property define_global_attribute
syntax keyword xdcStatement     create_clock create_generated_clock set_clock_groups
syntax keyword xdcStatement     set_false_path set_input_delay set_output_delay
syntax keyword xdcStatement     get_nets get_ports get_clocks

syntax keyword xdcBoolean       true false

syntax match xdcSwitch          /-\{1}[A-Za-z0-9_]\+/

highlight link xdcStatement     Statement
highlight link xdcSwitch        Special
highlight link xdcBoolean       Boolean

