" Vim filetype plugin file
" Language:     SystemVerilog

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Behaves just like Verilog
runtime! ftplugin/verilog.vim

if exists("loaded_matchit")
  let b:match_ignorecase=0
  let b:match_words=
    \ '\%(\<disable\s\+\)\@<!\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
    \ '\<program\>:\<endprogram\>,' .
    \ b:match_words
endif


" Win32 can filter files in the browse dialog
"if has("gui_win32") && !exists("b:browsefilter")
if has("gui_win32")
  let b:browsefilter = "Systemverilog Source Files (*.v *.sv *.svi *.svh)\t*.v;*.sv;*.svi;*svh\n" .
	\ "All Files (*.*)\t*.*\n"
endif

