" Vim syntax file
" Language:	LIB (Lib file syntax)
" Maintainer:	Alessandro Renieri <a.renieri@gmail.com>
"
if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "lib"


syntax region libComment start="/\*" end="\*/"

syntax match  libNumeric "[0-9]"
syntax region libString start=/"/ end=/"/

syntax region libParen start=/(/ end=/)/

syntax keyword libConstants true false input output inout rising_edge falling_edge positive_unate negative_unate three_state_disable CMOS_SCHMITT clock TTL
syntax keyword libConstants setup_falling hold_falling setup_rising hold_rising

syntax keyword libGroups library type
syntax keyword libGroups input_voltage output_voltage operating_conditions wire_load wire_load_selection
syntax keyword libGroups cell pin ff test_cell timing statetable table bus
syntax keyword libGroups lu_table_template 

"syntax keyword libStatement area cell_footprint direction capacitance function intrinsic_rise intrinsic_fall rise_resistance fall_resistance slope_rise slope_fall related_pin 
"syntax keyword libStatement timing_type timing_sense signal_type next_state clocked_on clear preset internal_node pin_opposite latch enable data_in pad_cell is_pad hysteresis 
"syntax keyword libStatement drive_current three_state pad_type resistance slope fanout_length wire_load_from_area process temperature voltage tree_type



highlight link libComment    Comment
highlight link libNumeric    Constant
highlight link libString     Constant
highlight link libConstants  Constant
highlight link libGroups     Type

highlight link libParen      PreProc
"highlight link libStatement  Statement




