" Vim syntax file
" Language:	VHDL AMS
" Maintainer:	Alessandro Renieri <alrenier@tin.it>
"
if ( exists("b:current_syntax") && (b:current_syntax!="vhdl") )
"if ( exists("b:current_syntax")  )
  finish
endif



syn keyword vhmsStatement   terminal quantity across through nature tolerance reference break
syn keyword vhmsNature	    electrical rotational translational translational_velocity rotational_velocity

"name		the name of the syntax item
"fg		foreground color (GUI: color name used to set the color, cterm: color number as a string, term: empty string)
"bg		background color (like fg)
"fg#		like fg, but for the GUI and the GUI is running the name in #RRGGBB form
"bg#		like fg# for bg
"bold		1 if bold
"italic		1 if italic
"reverse	1 if reverse
"inverse	1 if inverse (= reverse)
"underline	1 if underlined
		
"let b:test = synIDattr(synIDtrans(hlID("vhdlType")), "fg")
"hi vhmsStatement  gui=underline

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_vhms_syntax_inits")
  if version < 508
    let did_vhms_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink vhmsStatement    Identifier
  HiLink vhmsNature	  PreProc

  delcommand HiLink

endif

" use vhdl syntax
let b:coming_from_vhms = "yes"
runtime syntax/vhdl.vim

" let b:current_syntax = "vhms"
