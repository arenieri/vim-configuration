" Vim filetype plugin file
" Language:	SystemVerilog (superset extension of Verilog)
" Maintainer:	Amit Sethi <amitrajsethi@yahoo.com>
" Last Change:	Tue Jun 26 08:56:34 IST 2006
" Version: 1.0

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Behaves just like Verilog
runtime! ftplugin/verilog.vim

" Win32 can filter files in the browse dialog
"if has("gui_win32") && !exists("b:browsefilter")
if has("gui_win32")
  let b:browsefilter = "Systemverilog Source Files (*.v *.sv *.svi *.svh)\t*.v;*.sv;*.svi;*svh\n" .
	\ "All Files (*.*)\t*.*\n"
endif

