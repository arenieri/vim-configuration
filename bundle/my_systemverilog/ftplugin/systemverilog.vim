" Vim filetype plugin file
" Language:     SystemVerilog

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

setlocal textwidth=120

" Behaves just like Verilog
runtime! ftplugin/verilog.vim

if exists("loaded_matchit")
  let b:match_ignorecase=0
  let b:match_words=
    \ '\%(\<disable\s\+\)\@<!\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
    \ '\<begin\>:\<end\>,' .
    \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
    \ '\<module\>:\<endmodule\>,' .
    \ '\<if\>:\<else\>,' .
    \ '\<function\>:\<endfunction\>,' .
    \ '`ifdef\>\|`ifndef\>:`else\>:`endif\>,' .
    \ '\<task\>:\<endtask\>,' .
    \ '\<specify\>:\<endspecify\>' .
    \ '\<program\>:\<endprogram\>,' .
    \ '\<class\>:\<endclass\>'
endif

" Auxiliary function to strip white spaces at the beginning of the string
function! Strip(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction


" Search for variable declaration and open a balloon
function! BalloonExpr()
    " Skip syntax highlighted elements
    let l:synhighlight = synIDattr(synID(v:beval_lnum, v:beval_col, 1), "name")
    if (l:synhighlight != '' && l:synhighlight !~? 'Rainbow' && l:synhighlight !~? 'Constant' )
        let msg = synIDattr(synID(v:beval_lnum, v:beval_col, 1), "name")
        return msg
    endif

    let l:regexp_decl = '^\s*\<\%(input\|output\|inout\|bit\|byte\|shortint\|int\|longint\|reg\|logic\|integer\|time\|shortreal\|real\|realtime\|typedef\)\>'
    " Place the cursor at the beginning of the file
    let l:save_pos = getpos(".")
    call setpos('.',[0,1,1,0])
    let l:found = 1
    let l:lnum = search(v:beval_text)
    " save the line number of the first match
    let l:lnum_first = l:lnum

    " continue to search if the matched line is a comment or it is a portmap
    " and does not contain the variable type
    while ( match(getline(l:lnum), l:regexp_decl) == -1 )
        call setpos('.',[0,l:lnum+1,1,0])
        let l:lnum = search(v:beval_text)
        "echo l:lnum_first ." ". l:lnum . " " . getline(l:lnum)
        "sleep 2
        if l:lnum == l:lnum_first
            " First match found again.
            " This means that the declaration line was not found
            let l:found = 0
            break
        endif
    endwhile

    if (l:found == 1)
        let msg = v:beval_text ."\n". Strip(getline(l:lnum)) . " (Line: " . l:lnum . ")"
    else
        "let msg = v:beval_text ."\n". "First Match (Line: ". l:lnum . "): ".Strip(getline(l:lnum_first))
        let msg = v:beval_text ."\n". Strip(getline(l:lnum_first) . " (Line: ". l:lnum . " - First Match) ")
    endif
    call setpos('.',l:save_pos)
    return msg
endfunction

set balloonexpr=BalloonExpr()
set ballooneval


" Win32 can filter files in the browse dialog
"if has("gui_win32") && !exists("b:browsefilter")
if has("gui_win32")
  let b:browsefilter = "Systemverilog Source Files (*.v *.sv *.svi *.svh)\t*.v;*.sv;*.svi;*svh\n" .
	\ "All Files (*.*)\t*.*\n"
endif

