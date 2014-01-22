" Title:        Verilog HDL/SystemVerilog HDVL indent file
" Maintainer:
"
" Buffer Variables:
"     b:verilog_indent_width   : indenting width(default value: shiftwidth)
"
" Install:
"     Drop it to ~/.vim/indent 
" Known Limitations:
"     This indent file can not work well, when you break the long line into
"     multi-line manually, such as:
"      always @(posedge a or posedge b 
"          or posedge c ) begin
"         //...
"      end 
"     Recommend to use the coding style(wraped by vim automatically) as following:
"       always @(posedge a or posedge b or posedge c ) begin
"         //...
"       end 

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  ""finish
endif
let b:did_indent = 1

" Only define the function once.
"if exists("*GetVerilog_SystemVerilogIndent")
"  finish
"endif


setlocal indentexpr=GetVerilog_SystemVerilogIndent()
setlocal indentkeys=!^F,o,O,0),0},0{,=begin,=end,=fork,=join,=endcase,=join_any,=join_none,=else
setlocal indentkeys+==endmodule,=endfunction,=endtask,=endspecify
setlocal indentkeys+==endclass,=endpackage,=endsequence,=endclocking
setlocal indentkeys+==endinterface,=endgroup,=endprogram,=endproperty
setlocal indentkeys+==`else,=`endif


set cpo-=C

" s:comment_line_type(lnum)
" returns:
" -1 : line comment ('//') or a line of block comment
"  1 : comment ends before the end of the line ( '/* comment */ code;' )
"  0 : comment starts after the start of the line ( 'code; // comment' )
"  2 : the line is not a comment
"  3 : not a comment (not clear)
function! s:comment_line_type(lnum) "{{{
  let line = getline(a:lnum)

  " check if current ine is a complete line comment ('//') 
  if line =~ '^\s*\/\/'
    return -1
  endif

  " find the position of first non blank
  let firstPos = match(line,'\S') + 1
  if firstPos == 0
    return -1
  endif

  " find the position of end of line
  let endPos   = match(line,'\s*$') 

  let flag1 = 0
  let flag2 = 0
  " set flag1 if first position is inside a comment or string (using syntax highlight as helper)
  if (synIDattr(synID(a:lnum, firstPos, 1), "name") =~? '\(Comment\|String\)$')
    let flag1 = 1
  endif

  " set flag2 if last position is inside a comment or string (using syntax highlight as helper)
  if (synIDattr(synID(a:lnum, endPos, 1), "name") =~? '\(Comment\|String\)$' )
    let flag2 = 1
  endif


  " if the line is a complete comment line from the beginning to the end ...
  if ((1 == flag1)&&(1 == flag2))
    " ... find position of last block comment character ('/' of '... */')
    let firstPos = match(line,'\*\/') + 2


    " if it is a comment return -1 else return 3
    if (synIDattr(synID(a:lnum, firstPos, 1), "name") =~? '\(Comment\|String\)$')
      return -1
    else
      return 3
    endif
  endif

  " the line starts with a comment and ends with code -> return 1
  if (1 == flag1)
    return 1
  endif

  " the line ends with a comment -> return 0
  if (1 == flag2)
    return 0
  endif

  " if the line is not a comment return 2
  return 2

endfunction "}}}

"------------------------------------------------
" s:prevnonblanknoncomment(lnum)
" return the first no comment and noblank line
function! s:prevnonblanknoncomment(lnum) "{{{
  let lnum = prevnonblank(a:lnum)

  while lnum > 0
    if (-1 != s:comment_line_type(lnum)) " this means: if the line contains some code
      break
    endif
    let lnum = prevnonblank(lnum - 1)
  endwhile
  return lnum
endfunction "}}}

" This function remove comments present in a line that contains also some code
" and returns only the code portion of the line 
function! s:removecommment(line,comment_line_type) "{{{

  " not a comment line
  if (a:comment_line_type ==  2)
    return a:line
  endif

  " line comment (remove)
  if (a:comment_line_type == -1)
    return ""
  endif

  " comment before the end of the line
  if (a:comment_line_type == 1)
    return substitute(a:line,'^.\{-}\*\/',"","")
  endif

  if (a:comment_line_type == 3)
    return substitute(a:line,'^.\{-}\*\/',"","")
  endif


  return substitute(a:line,'\/\(\/\|\*\).*$',"","")

endfunction "}}}


function! GetVerilog_SystemVerilogIndent()

  if exists('b:verilog_indent_width')
    let offset = b:verilog_indent_width
  else
    let offset = &sw
  endif

  " offset for 'begin'/'end' identifiers
  let offset_be = 4

  let msg = ""

  " Find a non-blank and valid line above the current line.
  let prevlnum = s:prevnonblanknoncomment(v:lnum - 1)

  " At the start of the file use zero indent.
  if prevlnum == 0
    echo "Start of file"
    return 0
  endif

  " Set default indentation (the same of previous line)
  let ind  = indent(prevlnum)

  let curr_line_type = s:comment_line_type(v:lnum)
  "if curr_line_type == -1
  " This will indent comments to the first column (no indentation)
  "  return ind
  "endif

  " remove comments from current line and return only the code
  let curr_line  = s:removecommment(getline(v:lnum),curr_line_type)
  " remove the blank at the beginning of the line
  let curr_line_strip = substitute(curr_line,'^\s*','','')

  " -----------------------------------------------------------
  " curr_line_strip has the meaningful content of the line on
  " which we have to decide indentation

  " ================================================================
  "  Calculate indentation according to the content of current line
  " ================================================================
  let match_result = matchstr(curr_line_strip,'\<\(end\%(case\|task\|function\|clocking\|interface\|module\|class\|specify\|package\|sequence\|group\|property\)\|end\|else\|join\|join_any\|join_none\)\>\|^}\|`endif\|`else')
 
  "let match_found = 0
  if len(match_result) > 0
  if match_result =~ '\<end\>'
    let match_start = '\<begin\>'
    let match_mid   = ''
    let match_end   = '\<end\>'
    let msg = "begin ... end"

  elseif match_result =~ '\<else\>'
    let match_start = '\<if\>'
    let match_mid   = ''
    let match_end   = '\<else\>'
    let msg = "if ... else"

  elseif match_result =~ 'join'
    let match_start = '\<fork\>'
    let match_mid   = ''
    let match_end   = '\<\(join\|join_none\|join_any\)\>'
    let msg = "fork ... join"

  elseif match_result =~ '}'
    let match_start = '{'
    let match_mid   = ''
    let match_end   = '}'
    let msg = "{ ... }"

  elseif match_result =~ '\(`endif\|`elsif\|`else\)'
    let match_start = '\(`ifdef\|`ifndef\)'
    let match_mid   = ''
    let match_end   = '\(`endif\|`elsif\|`else\)'
    let msg = "`ifdef ... `endif"

    "    elseif match_result =~ '\<begin\>'
    "      let match_start = '\<\(module\|task\|function\|if\|else\)'
    "      let match_mid   = ''
    "      let match_end   = '\<begin\>'
    "      let msg = "module|task ... begin"

  else
    " match <anything> with end<anything>
    let match_start = substitute(match_result,'^end','','')
    let match_start = '\<' . match_start . '\>'
    let match_mid   = ''
    let match_end   = '\<' . match_result. '\>'
    let msg = "begin ... end"
  endif


  "if msg !~ "" "if message is not empty we have found a match
    " Place the cursor in position 1 of the line
    call cursor(v:lnum,1)
    " Search for the matching character (excluding comments)
    let match_line_num = searchpair(match_start,match_mid,match_end,'bW',
          \" synIDattr(synID(line('.'),col('.'),1),'name')"
          \. "=~? '\\(Comment\\|String\\)$'")

    " Return indent id found
    if match_line_num > 0
      let ind = indent(match_line_num)
      echo msg." (matching line ".match_line_num.")"
      return ind
    endif

  "endif
  endif
 
  "echo curr_line_strip

  " This line matches "id:begin", "begin:id" and "begin" in a line
  "if curr_line =~ '^\s*\<begin\>'
  "  "\%(\h\w*\s*:\s*\)\=\<begin\>\%(\s*:\s*\h\w*\)\="
  "  " indent as previous line +2
  "  let ind = indent(prevlnum)+offset_be
  "  let msg = "Found begin"
  "  echo msg." (matching line ".v:lnum.")"
  "  return ind
  "endif
  
  " =================================================================
  "  Calculate indentation according to the content of previous line
  " =================================================================

  let prev_line_type = s:comment_line_type(prevlnum)
  let prev_line_s    = s:removecommment(getline(prevlnum),prev_line_type)
  let prev_line      = substitute(prev_line_s,'^\s*','','')


  " if previous line is a begin of a block
  if prev_line =~ '\<begin\>'
    let msg = "First line after block begin"
    let ind = ind + offset_be

  " if previous line is the end of a block
  "elseif prev_line =~ '\<end\>'
  "  let msg = "First line after block end"
  "  let ind = ind - offset_be

  " if previous line is the beginning of a block (begin or fork) or an expression
  elseif prev_line =~ '\<\%(module\|fork\)\>'
    let msg = "module|fork|{|( detected"
    let ind = ind + offset

  " Indent after if/else/for/case/always/initial/specify/fork blocks
  " .*\(\(;\)\@!.\)$ means "not followed by ; before the end of the line
  elseif (prev_line =~ '`\@<!\<\(if\|else\)\>.*\(\(;\)\@!.\)$' ||
        \ prev_line =~ '\<\(initial\|final\|always\|always_comb\|always_ff\|always_latch\|constraint\)\>' ||
        \ prev_line =~ '\<\%(disable\@!fork\)\>' ||
        \ prev_line =~ '\<\(for\|foreach\|repeat\|while\|do\)\>' ||
        \ prev_line =~ ':\s*$')
    let msg = "if|always|for detected"
    let ind = ind + offset

  elseif (prev_line =~ '\<\(case\%[[zx]]\|class\|interface\|clocking\|randcase\|package\|specify\)\>' || 
        \ prev_line =~ '\%(extern\s\+\|extern\s\+virtual\s\+\|end\|\S\)\@<!\%(task\|function\)\>' ||
        \ prev_line =~ '^\s*\(\w\+\s*:\)\=\s*\<covergroup\>')
    let msg = "task|function"
    let ind = ind + offset

  endif

  " =================================================================
  "  Calculate indentation according to the content of previous line
  "                         EXCEPTIONS
  " =================================================================
  
  if (prev_line =~ '\<\(interface\)\s\+\w\+\s\+\w\+\s*;')
    " This matches interface instance and remove previous indentation
    let msg ="interface instance"
    let ind = ind - offset
  endif


  " Return the indention
  echo msg." indent calculated from line: ". prevlnum
  return ind

endfunction

" vim:sw=2
