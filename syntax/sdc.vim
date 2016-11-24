" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn keyword sdcObjectsQuery     get_pins

syn keyword sdcObjectsInfo      get_timing_paths set_attribute set_disable_timing set_units set_clock_groups
syn keyword sdcObjectsInfo      set_operating_conditions

syn keyword sdcConstraints      set_case_analysis sey_max_transiton set_clock_gating_check set_min_pulse_width 
syn keyword sdcConstraints      set_clock_transition set_clock_sense set_driving_cell set_input_transition
syn keyword sdcConstraints      set_max_transition

syn keyword sdcNonIdealities    set_clock_uncertainty set_clock_latency set_timing_derate

syn keyword sdcCreateOperations create_generated_clock


source $VIMRUNTIME/syntax/sdc.vim

