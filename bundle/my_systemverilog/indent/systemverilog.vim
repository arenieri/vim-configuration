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
setlocal indentkeys=!^F,o,O,0),0},0{
setlocal indentkeys+==begin,=end,=fork,=join,=endcase,=join_any,=join_none,=else
setlocal indentkeys+==endmodule,=endfunction,=endtask,=endspecify
setlocal indentkeys+==endclass,=endpackage,=endsequence,=endclocking
setlocal indentkeys+==endinterface,=endgroup,=endprogram,=endproperty
setlocal indentkeys+==`else,=`endif,.
" indent when pressing return
setlocal indentkeys+=*<return>

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

" Search for the matching regular expression (excluding comments and strings)
function! SearchPairNoComment(regexp_start,regexp_mid,regexp_end) "{{{
    let match_line_num = searchpair(a:regexp_start,a:regexp_mid,a:regexp_end,'bW',
          \" synIDattr(synID(line('.'),col('.'),1),'name') =~? '\\(Comment\\|String\\)$'")
    return match_line_num
endfunction "}}}

" Get line with comments and spaces at the beginning removed
function! GetLineStrip(lnum) "{{{
    let this_line_type  = s:comment_line_type(a:lnum)
    let this_line       = s:removecommment(getline(a:lnum),this_line_type)
    " remove the blanks at the beginning of the line
    "let this_line_strip = substitute(this_line,'^\s*','','')
    "return this_line_strip
    return this_line
endfunction "}}}


function! GetVerilog_SystemVerilogIndent()

  if exists('b:verilog_indent_width')
    let offset = b:verilog_indent_width
  else
    let offset = &sw
  endif

  " offset for 'begin'/'end' identifiers
  let offset_be = offset/2

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

  " remove comments from current line and return only the code
  let curr_line  = GetLineStrip(v:lnum)

  " remove comments from current line and return only the code
  let prev_line_type = s:comment_line_type(prevlnum)
  let prev_line_s    = s:removecommment(getline(prevlnum),prev_line_type)
  let prev_line      = substitute(prev_line_s,'^\s*','','')

  " -----------------------------------------------------------
  " curr_line has the meaningful content of the line on
  " which we have to decide indentation

  " IMPORTANT: if the previous line is an end of a block we remove indentation
  " and we avoid to search matching strings
  " In realta' la cosa corretta da fare sarebbe ignorare tutto cio' che sta'
  " all' interno del blocco begin end
  " Esempio
  " if (a=1)
  "   begin
  "     if ()
  "     else if ()
  "   end
  " else if ()
  "
  " L'ultimo else if, senza le linee di codice qui sotto, verrebbe allineato
  " all' else if all' interno del begin end
  " Un' eccezione `e rappresentata da end che deve essere indentato come il
  " begin con cui fa coppia e non in base all' end che lo precede.
  " Es.
  "     begin
  "       if ()
  "         begin
  "           ...
  "         end
  "       else if ()
  "         begin
  "           ...
  "         end
  "     end "<- This is the exception

  if ( prev_line =~ '\<end\>' && (curr_line !~ '\<end\>' || curr_line !~ '\<endmodule\>')
    echo "First line after block end"
    let ind = ind - offset_be
    return ind
  endif
  " ================================================================
  "  Calculate indentation according to the content of current line
  " ================================================================
  let regexp_str = '\<\(end\%(case\|task\|function\|clocking\|interface\|module\|program\|class\|specify\|package\|sequence\|group\|property\)\|end\|else\|join\|join_any\|join_none\)\>\|^\s*}\|`endif\|`else'

  let match_result = matchstr(curr_line, regexp_str)
  let matchpos_result = match(curr_line, regexp_str)

  "let msg1 = " " . match_result . " ".matchpos_result." ".col(".")
  "let msg1 = msg1 . synIDattr(synID(line("."), col("."), 0), "name")
  "let msg1 = msg1 . synIDattr(synID(line("."), matchpos_result, 0), "name")

  " TODO: regexp must be searched 2 times: one to find the string and the other to find the position inside the line.
  "       This should be done only one time.
  if synIDattr(synID(line("."), matchpos_result, 0), "name") =~? "String"
    " Matched result is inside a string and must be ignored
    let match_result = ""
  end

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
      let match_start = '\<\%(disable\s\+\)\@<!fork\>'
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
      let msg = "<anything> ... end<anything>"
    endif


    "if msg !~ "" "if message is not empty we have found a match
    " Place the cursor in position 1 of the line
    call cursor(v:lnum,1)

    let match_line_num = SearchPairNoComment(match_start,match_mid,match_end)

    " Return indent id found
    if match_line_num > 0
      let ind = indent(match_line_num)
      echo msg." (matching line ".match_line_num.")"
      return ind
    endif

  endif " len(match_result) > 0

  " ================================================================
  "  Calculate indentation according to the content of current line
  "                         SPECIAL CASES
  " ================================================================
  "----------------------
  " Indent begin
  "----------------------
  let regexp_begin = '^\s*\%(\h\w*\s*:\s*\)\=\<begin\>\%(\s*:\s*\h\w*\)\='

  " This line matches "id:begin", "begin:id" and "begin" in a line
  if curr_line =~ regexp_begin
    let msg = "Found begin"
    " check if we are inside a fork..join
    let fork_match_line_num = SearchPairNoComment('\<\%(disable\s\+\)\@<!fork\>','','\<\%(join\|join_none\|join_any\)\>')
    " check if we are inside a case..endcase
    let case_match_line_num = SearchPairNoComment('\<case\>','','\<endcase\>')
    "Be sure that the cursor is in position 1
    call cursor(v:lnum,1)
    let inner_begin_line_num = SearchPairNoComment('\<begin\>','','\<end\>')

    if (fork_match_line_num > inner_begin_line_num)
      " we are inside a fork..join
      let ind = indent(fork_match_line_num)+offset_be
      let msg = msg." inside fork..join at line ".fork_match_line_num
    elseif (case_match_line_num > inner_begin_line_num)
      " we are inside a case..endcase
      let ind = indent(case_match_line_num)+offset_be
      let msg = msg." inside case..endcase at line ".case_match_line_num
    else
      " we are in a fork..join but this is an inner begin..end block
      " or we are not in a fork..join, case..endcase
      let ind = indent(prevlnum)+offset_be
    endif

    echo msg." (matching line ".v:lnum.")"
    return ind
  endif

  "------------------------------
  " Indent default (inside case)
  "------------------------------
  if curr_line =~ '^\s*default\>'
    let msg = "Found default"
    let case_match_line_num = SearchPairNoComment('\<case\>','','\<endcase\>')
    let ind = indent(case_match_line_num)+offset_be
    echo msg." inside case..endcase at line ".case_match_line_num
    return ind
  endif

  "------------------------
  " Indent port assignment
  "------------------------
  " line starts with .something
  "if curr_line =~ '^\s*\.\w\+'
  if curr_line =~ '^\s*\.'
    let msg = "Found port assignment"
    if getline(prevlnum) =~ '^\s*\.\w\+'
      let ind = indent(prevlnum)
    else
      let ind = indent(prevlnum)+offset
    endif
  else
  "-------------------------------------------
  " DeIndent after instance (port assignment)
  "-------------------------------------------
    if getline(prevlnum) =~ '^\s*\.\w\+'
      let msg = "Found statement after port assignment"
      let ind = indent(prevlnum)-offset
    endif
  endif





  " =================================================================
  "  Calculate indentation according to the content of previous line
  " =================================================================


  " if previous line is a begin of a block
  " This line matches "id:begin", "begin:id" and "begin" in a line
  if ( prev_line =~ regexp_begin )
    let msg = "First line after block begin"
    let ind = ind + offset_be

    " if previous line is the end of a block
    " Indentazione dopo un end e' la stessa di end se il corrispondente begin e' su una linea insieme a altre keyword
    " altrimenti si deve togliere un livello di indentazione
  elseif ( prev_line =~ '\<end\>' )
    let msg = "First line after block end"
    " move cursor to the previous line (Important: set the cursor to column 1)
    " save current position
    "let save_pos = getpos('.')
    call setpos('.', [0, prevnonblank(prevlnum-1), 1, 0])
    " Search the line of the matching begin
    let begin_line_num = SearchPairNoComment('\<begin\>','','\<end\>')
    let this_line = GetLineStrip(begin_line_num)
    " Check if the begin keyword is the only keyword in the line and de-dent
    if (this_line =~ regexp_begin)
      let ind = ind - offset_be
    endif
    " restore position
    "call setpos('.', save_pos)
    " otherwise, if it is preceded by some other keyword [if()begin style]
    " indentation is the same
    "let msg = "|".prevnonblank(prevlnum-1)." ".begin_line_num."|".msg

    " if previous line is the beginning of a block (begin or fork) or an expression
  elseif ( prev_line =~ '\<\%(module\)\>' ||
         \ prev_line =~ '\<\%(disable\s\+\)\@<!fork\>' )
    let msg = "module|fork detected"
    let ind = ind + offset

    " Indent after if/else/for/case/always/initial/specify/fork blocks
    " .*\(\(;\)\@!.\)$ means "not followed by ; before the end of the line
  elseif ( prev_line =~ '`\@<!\<\(if\|else\)\>.*;\@!.*$' ||
         \ prev_line =~ '\<\%(initial\|final\|forever\|always\|always_comb\|always_ff\|always_latch\|constraint\)\>' ||
         \ prev_line =~ '\<\%(disable\s\+\)\@<!fork\>' ||
         \ prev_line =~ '\<\%(for/s*\(\|foreach\|repeat\|while\|do\)\>' ||
         \ prev_line =~ ':\s*$')
    let msg = "if|always|for detected"
    let ind = ind + offset

  elseif ( prev_line =~ '\<\%(case\%[[zx]]\|interface\|class\|clocking\|randcase\|package\|specify\)\>' ||
         \ prev_line =~ '\%(extern\s\+\|extern\s\+virtual\s\+\|end\|\S\)\@<!\%(task\|function\|program\)\>' ||
         \ prev_line =~ '^\s*\(\w\+\s*:\)\=\s*\<covergroup\>')
    let msg = "task|function detected"
    let ind = ind + offset

  elseif ( prev_line =~ '{' && prev_line !~ '}' )
    let msg = "{ detected in previous line"
    let ind = ind + offset

  endif

  " =================================================================
  "  Calculate indentation according to the content of previous line
  "                         EXCEPTIONS
  " =================================================================

  " Remove previous indentation in case of interface instance
  if (prev_line =~ '\<\(interface\)\s\+\w\+\s\+\w\+\s*;')
    let msg ="interface instance"
    let ind = ind - offset
  endif

  " Calculate indentation for single line commands outside a begin/end block
  " Eg. if (something)
  "         command;
  let prevlnum2 = s:prevnonblanknoncomment(prevlnum - 1)
  if (prevlnum2 >= 0)
    " if line-1 and line-2 does not contain a begin then deindent line
    let prev2_line_type = s:comment_line_type(prevlnum2)
    let prev2_line_s    = s:removecommment(getline(prevlnum2),prev2_line_type)
    let prev2_line      = substitute(prev2_line_s,'^\s*','','')

    " TODO questa linea dovrebbe fare il match di tutti i comandi che possono prevedere
    " un comando singolo subito dopo. Le regexp sono gia' utilizzate quando si fa' l' indentazione
    " Assegnare le regexp a delle variabili per eviare duplicazioni
    if (  prev2_line =~ '`\@<!\<\(if\|else\)\>.*;\@!.*$')
      if ( (prev_line !~ '\<begin\>') && (prev2_line !~ '\<begin\>') )
        let ind = ind - offset
        let msg = "Single line command after if"
      endif
    endif
  endif



  " Return the indention
  echo msg." indent calculated from line: ". prevlnum
  return ind

endfunction

" vim:sw=2
