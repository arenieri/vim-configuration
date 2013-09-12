" Title:        Verilog HDL/SystemVerilog HDVL indent file
" Maintainer:	Mingzhi Li <limingzhi05@mail.nankai.edu.cn>
" Last Change:	2007-12-16 20:10:57 CST
"
" Buffer Variables:
"     b:verilog_indent_width   : indenting width(default value: shiftwidth)
"
" Install:
"     Drop it to ~/.vim/indent 
"
" URL:
"    http://www.vim.org/scripts/script.php?script_id=2091
"
" Revision Comments:
"     Mingzhi Li  2012-03-13 23:15:39 CST Version 1.3
"        Bug fixes
"     Mingzhi Li  2007-12-16 20:09:39 CST Version 1.2      
"        Bug fixes
"     Mingzhi Li  2007-12-13 23:47:54 CST Version 1.1      
"        Bug fix, improve performance and add introductions
"     Mingzhi Li  2007-12-7  22:16:41 CST Version 1.0  
"        Initial version
"       
" Known Limited:
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
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetVerilog_SystemVerilogIndent()
setlocal indentkeys=!^F,o,O,0),0},0{,=begin,=end,=fork,=join,=endcase,=join_any,=join_none
setlocal indentkeys+==endmodule,=endfunction,=endtask,=endspecify
setlocal indentkeys+==endclass,=endpackage,=endsequence,=endclocking
setlocal indentkeys+==endinterface,=endgroup,=endprogram,=endproperty
setlocal indentkeys+==`else,=`endif

" Only define the function once.
if exists("*GetVerilog_SystemVerilogIndent")
  finish
endif

set cpo-=C

" s:comment_ind(lnum)
" returns:
" -1 : line comment ('//') or a line of block comment
"  1 : comment ends before the end of the line ( '/* comment */ code;' )
"  0 : comment starts after the start of the line ( 'code; // comment' )
"  2 : the line is not a comment
"  3 : not a comment (not clear)
function s:comment_ind(lnum)
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

endfunction

"------------------------------------------------

function s:prevnonblanknoncomment(lnum)
  let lnum = prevnonblank(a:lnum)

  while lnum > 0
    if (-1 != s:comment_ind(lnum))
      break
    endif
    let lnum = prevnonblank(lnum - 1)
  endwhile
  return lnum
endfunction

function s:removecommment(line,comment_ind)

  " not a comment line
  if (a:comment_ind ==  2)
    return a:line
  endif

  " line comment (remove)
  if (a:comment_ind == -1)
    return ""
  endif

  " comment before the end of the line
  if (a:comment_ind == 1)
    return substitute(a:line,'^.\{-}\*\/',"","")
  endif

  if (a:comment_ind == 3)
    return substitute(a:line,'^.\{-}\*\/',"","")
  endif


  return substitute(a:line,'\/\(\/\|\*\).*$',"","")

endfunction


function GetVerilog_SystemVerilogIndent()

  if exists('b:verilog_indent_width')
    let offset = b:verilog_indent_width
  else
    let offset = &sw
  endif


  " Find a non-blank and valid line above the current line.
  let lnum = s:prevnonblanknoncomment(v:lnum - 1)

  " At the start of the file use zero indent.
  if lnum == 0
    return 0
  endif

  " indent is the same of previous non blank no comment line
  let ind  = indent(lnum)

  let curr_line_ind = s:comment_ind(v:lnum)
  "if curr_line_ind == -1
  "  return ind
  "endif

  let curr_line  = s:removecommment(getline(v:lnum),curr_line_ind)
  " remove the blank at the beginning of the line
  let curr_line2 = substitute(curr_line,'^\s*','','')

  let match_result = matchstr(curr_line2,'^\<\(end\|else\|end\(case\|task\|function\|clocking\|interface\|module\|class\|specify\|package\|sequence\|group\|property\)\|join\|join_any\|join_none\)\>\|^}\|`endif\|`else')


    if len(match_result) > 0
      if match_result =~ '\<end\>'
        let match_start = '\<begin\>'
        let match_mid   = ''
        let match_end   = '\<end\>'

      elseif match_result =~ '\<else\>'
        let last_line_ind = s:comment_ind(lnum)
        let last_line  = s:removecommment(getline(lnum),last_line_ind)

        if last_line =~ '^\s*end\|^\s*}'
          return indent(lnum)
        else
          let match_start = '\<if\>'
          let match_mid   = ''
          let match_end   = '\<else\>'
        endif

      elseif match_result =~ 'join'
        let match_start = '\<fork\>'
        let match_mid   = ''
        let match_end   = '\<\(join\|join_none\|join_any\)\>'

      elseif match_result =~ '}'
        let match_start = '{'
        let match_mid   = ''
        let match_end   = '}'

      elseif match_result =~ '`else'
        let match_start = '`if'
        let match_mid   = ''
        let match_end   = '`else'

      elseif match_result =~ '`endif'
        let match_start = '`if'
        let match_mid   = '`else'
        let match_end   = '`endif'

      else
        let match_start = substitute(match_result,'^end','','')
        let match_start = '\<' . match_start . '\>'
        let match_mid   = ''
        let match_end   = '\<' . match_result. '\>'
      endif


      " Place the cursor in position 1 of the line
      call cursor(v:lnum,1)
      " Search for the matching character (excluding comments)
      let match_line = searchpair(match_start,match_mid,match_end,'bW',
            \" synIDattr(synID(line('.'),col('.'),1),'name')"
            \. "=~? '\\(Comment\\|String\\)$'")

      " Return indent id found
      if match_line > 0
        return indent(match_line)
      endif

    endif


  " If current line is not matched we calculate indentation from previous line
  let last_line_ind = s:comment_ind(lnum)
  let last_line  = s:removecommment(getline(lnum),last_line_ind)
 
  let indent0 = 0
  let indent1 = 0
  let indent2 = 0

  let de_indent0 = 0

  let pat0 = '[{(]\s*$'
  let pat1 = '\<\(begin\|fork\)\>\s*\(:\s*\w\+\s*\)\=\s*$'
  let pat2 = '`\@<!\<\(if\|else\)\>'
  let pat3 = '\<\(always\|initial\|for\|foreach\|always_comb\|always_ff\|always_latch\|final\|repeat\|while\|constraint\|do\)\>'
  let pat5 = '\<\(case\%[[zx]]\|class\|interface\|clocking\|randcase\|package\|specify\)\>'
  let pat5a = '\%(extern\s\+\|end\|\S\)\@<!\%(task\|function\)\>' 
  let pat6 = '^\s*\(\w\+\s*:\)\=\s*\<covergroup\>'
  let pat7 = '^\s*\<\(begin\|fork\)\>\s*\(:\s*\w\+\s*\)\='
  let pat8 = '^\s*`\<\(else\|endif\)\>'

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " if previous line is the beginning of a block (begin or fork) or an expression
  if last_line =~ pat0 || last_line =~ pat1
    let indent0 = 1
  endif

  " Indent after if/else/for/case/always/initial/specify/fork blocks
  if (last_line =~ pat2 ||  last_line =~ pat3 || last_line =~ ':\s*$') && (last_line !~ ';\s*$')
    let indent1 = 1

  elseif  last_line =~ pat5 || last_line =~ pat5a ||last_line =~ pat6
    "echo 'Match pat5||pat5a||pat6'
    let indent2 = 1
    

  "elseif last_line =~ '^\s*`\<\(ifdef\|else\|ifndef\)\>'
  "  return ind + offset
  endif

  let indent_or = indent0 || indent1 || indent2

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if (curr_line =~ pat7 || curr_line =~ pat8 || curr_line =~ '^\s*{')
    let de_indent0 = 1
  endif

  if (indent_or == 0) && (last_line !~ '^\s*end\|\<begin\>') &&
        \ (curr_line =~ ')\s*;\s*$') && 
        \ (last_line =~ ',\s*$' || last_line =~ '\w\s*$\|]\s*$\|)\s*$')
    return ind - offset
  endif

  if indent0 || indent1 || de_indent0
    let lnum2 = s:prevnonblanknoncomment(lnum - 1)
    let last_line2_ind = s:comment_ind(lnum2)
    let last_line2 = s:removecommment(getline(lnum2),last_line2_ind)

    if ((last_line2 !~ pat0 && last_line2 !~ pat1) && 
          \ (last_line2 =~ pat2 || last_line2 =~ pat3 || last_line2 =~ ':\s*$') &&
          \ (last_line =~ ';\s*$'))
      return indent(lnum2)
    endif
  endif
  

  " Return the indention
  if (indent0 == 0 && indent1 == 1 && de_indent0 == 1)
    return ind
  elseif  indent_or
    return ind + offset
  elseif  de_indent0
    return ind - offset
  else
    return ind
  endif 

endfunction

" vim:sw=2
