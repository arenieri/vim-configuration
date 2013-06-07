" Detect file type

if exists("did_load_custom_filetypes")
    finish
endif
let did_load_custom_filetypes = 1

augroup filetypedetect
    au BufNewFile,BufRead *.vhms	setfiletype vhms 
    au BufNewFile,BufRead cds.lib	setfiletype cds
    au BufNewFile,BufRead hdl.var	setfiletype cds
    au BufNewFile,BufRead *.lib	        setfiletype lib
    au BufNewFile,BufRead *.f           setfiletype f
    au BufNewFile,BufRead *.ctl         setfiletype tcl
    au BufNewFile,BufRead *.log         setfiletype logfile
augroup END

