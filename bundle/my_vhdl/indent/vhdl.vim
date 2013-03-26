"  Maintainer	: Alessandro Renieri <a.renieri@gmail.com>
"  Revised on	: 8 Dec 2010
"  Language	: VHDL 

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif

let b:did_indent = 1

" indentkeys identifica le chiavi che attivano la funzione di indentazione
"setlocal indentkeys-=0#
setlocal indentkeys=!^F,o,O,0(,0),*<CR>,;

setlocal indentexpr=GetVHDLIndent()

setlocal indentkeys+=package,entity,architecture
setlocal indentkeys+=generic,port,map
setlocal indentkeys+=component,function,procedure,process
setlocal indentkeys+=record,begin,end,generate
setlocal indentkeys+=if,elsif,else,for,while,loop,=case,when
setlocal indentkeys+=assert,report,severity

" Only define the function once.
if exists("*GetVHDLIndent")
    finish
endif

let s:ALIGN_ASSIGN = 1

" Not a comment or string
let s:NCS='\%(--.*\|".*\)\@<!'
" Not end
" '\%(\<end\s\+\)\@<!match' <- cerca match non preceduto da end
let s:NE='\%(\<end\s\+\)\@<!'

" Regular expression to identify a block start
let s:BLOCK_START='\%(\<end\s\+\|--.*\|".*\)\@<!\<\%(package\|entity\|architecture\|process\|function\|procedure\|component\|record\|if\|loop\|case\|generate\)\>'
" regular expression to identify a block end
let s:BLOCK_END='\%(--.*\|".*\)\@<!\<end\>.*'
let s:BLOCK_SKIP='getline(".")=~''^\s*\%(\h\w*\s*:\s*\)\+\<\%(entity\)\>'''


" Cerca la coppia di keyword di inizio e fine a partire dalla
" linea lnum procedendo verso l'inizio del file. 
" Le coppie di keyword annidate vengono ignorate.
" Restituisce il numero di linea della keyword di inizio
function FindMatchingKeywordSkip(startkey,endkey,skipexpr) " {{{
	let l:lnum = searchpair(a:startkey,'',a:endkey.'\zs','bW',a:skipexpr)
	return l:lnum
endfunction 
" }}}
	
function FindMatchingKeyword(startkey,endkey) " {{{
	let l:lnum = searchpair(a:startkey,'',a:endkey.'\zs','bW')
	return l:lnum
endfunction

function GetVHDLIndent() " {{{
	
	" imposta il valore della tabulazione
	if &softtabstop != 0 
		let l:shift = &softtabstop
	else
		let l:shift = &shiftwidth
	endif
	
    " Find a non-blank non-comment line above the current line.
    let l:lnum1 = prevnonblank(v:lnum - 1)
	while getline(l:lnum1) =~ '^\s*--' && l:lnum1!=0
		let l:lnum1 = prevnonblank(l:lnum1 - 1)
	endwhile	

	" Pulisce la status line
	echo '' 
	" Hit the start of the file, use zero indent.
    if l:lnum1 == 0
		echo "Inizio File"
		return 0
    endif
    
    " indentazione della linea sopra al cursore
	let l:ind_prev = indent(l:lnum1)
	" Indentazione di default come la linea precedente
	let l:ind = l:ind_prev
	"--------------------------------------------------------------------
    " Indentazione in base al contenuto della linea precedente
	" line è la linea sopra al cursore
	" Indentazione da dare quando si preme 'ENTER'
    let l:line1 = getline(l:lnum1)
    " Riconosce la parola chiave preceduta da spazi e da un eventale etichetta (p01 : process)
	" o record non preceduto da end 
    " L'else seguito da ';' viene indentato con una regola diversa
    if (l:line1 =~ '^\s*\%(\h\w*\s*:\s*\)\=\<\%(package\|entity\|architecture\|port\|generic\|component\|function\|procedure\|begin\|process\|if\|elsif\|else\|case\|when\|generate\|for\|while\|loop\)\>' || line1 =~ s:NE.'\<\(record\)\>') && l:line1 !~ s:NCS.'\<else\>.*;' 
        if l:line1 =~ 'function.*return.*;'
            " Eccezione: dichiarazione della funzione su una sola linea
            let l:ind = l:ind_prev
            let l:msg = ' Ecc.'
        else
            let l:ind = l:ind_prev + l:shift
            let l:msg = ' Std.'
        endif
		echo "Riferimento Linea: " . "Precedente" . "   Indentazione " . l:ind . " (1p)".l:msg

    " tolgliere l'indentazione dopo severity
	elseif l:line1 =~ s:NCS.'\<\%(severity\)\>' 
		let l:ind = l:ind_prev - l:shift
		echo "Riferimento Linea: " . "Precedente" . "   Indentazione " . l:ind . " (2p)"

    " togliere l'indentazione dopo return
	elseif l:line1 =~ s:NCS.'\<return\>'
		let l:ind = l:ind_prev - l:shift
		echo "Riferimento Linea: " . "Precedente" . "   Indentazione " . l:ind . " (3p)"

    " indentazione di 
    "     with Command select 
    "	  DataOut <= InA and InB when 0,
    "	       	 	 InA or InB when 2,
    "                 'Z' when others;
    " e di
    "     sigA <= sigB when Enable = '1' 
    "             else sigC;  
    "     
    " se la linea precedente ha '<=' ma non finisce con ';'
    elseif l:line1 =~ s:NCS.'<=' && l:line1 !~ s:NCS.'<=.*;'
        if s:ALIGN_ASSIGN
            let [l:line,l:col] = searchpos('<=\zs','bW')
            let l:ind = l:col
        else
            let l:ind = l:ind_prev + l:shift
        endif
        echo "Riferimento Linea: " . "Precedente" . "   Indentazione " . l:ind . " (4p)"

    " diminuisce l'indentazione dopo l' 'else'
    elseif l:line1 =~ s:NCS.'\%(\<when\>.*\)\@<!'.'\<else\>.*;' || l:line1 =~ s:NCS.'\%(<=.*\)\@<!'.'\<when\>.*;'
        " else seguito da ';' e non preceduto da when
        " o when non precedutoda '<='
        if s:ALIGN_ASSIGN
            let l:klnum = search('<=','bW')
            let l:ind = indent(l:klnum)
        else
            let l:ind = l:ind_prev - l:shift
        endif
        echo "Riferimento Linea: " . "Precedente" . "   Indentazione " . l:ind . " (5p)"
	endif
	
	"--------------------------------------------------------------------
	" Queste keyword devono essere indentate nel momento in cui vengono
	" scritte
	
    " line è la linea su cui si trova il cursore
    let l:line = getline(v:lnum)
	
	" le linee di commento hanno l'indentazione della linea precedente
	if  l:line =~ '^\s*--'
		"let l:ind = l:ind_prev
		"echo "Riferimento Linea: " . "Precedente" . "   Indentazione " . l:ind . " (1a)"

	" indentazione relativa alla linea precedente
	" rientro di un tab 
	elseif l:line =~ '^\s*\%(elsif\|else\)\>' && l:line !~ s:NCS.';'
		let l:ind = l:ind_prev - l:shift
		echo "Riferimento Linea: " . "Precedente" . "   Indentazione " . l:ind . " (2a)"

	" end e begin con la stessa indentazione della keyword di inizio blocco
	elseif l:line =~ s:NCS.'\<\%(begin\|end\)\>'
        if l:line =~ s:NCS.'\<end\s\+package\>'
            " handle special case for 'end package'
            let l:klnum = FindMatchingKeyword('^\s*package.*is', '^\s*end\spackage')
            let l:msg = ' Ecc.'
        else
		    let l:klnum = FindMatchingKeywordSkip(s:BLOCK_START, s:BLOCK_END, s:BLOCK_SKIP)
            let l:msg = ' Std.'
        endif
        let l:ind = indent(l:klnum)	
		echo "Riferimento Linea: " . l:klnum . "   Indentazione " . l:ind . " (3a)".l:msg

	" indentazione relativa ad un'altra keyword
	" process preceduto da un'etichetta
	elseif l:line=~'^\s*\%(\h\w*\s*:\s*\)\=\<process\>'
        let l:klnum = FindMatchingKeyword(s:NE.s:NCS.'\<\%(architecture\|generate\)\>', s:NCS.'\<end\>.*')
		"let l:ind = l:shift
		echo "Riferimento Linea: " . l:klnum . "   Indentazione " . l:ind . " (4a)"

	elseif l:line =~ '^\s*\%(procedure\|function\)\>'
 		let l:klnum = search('^\s*\(architecture\|^\s*\%(\h\w*\s*:\s*\)\=process\|package\)\>', "bW")
		let l:ind = indent(l:klnum) + l:shift
		echo "Riferimento Linea: " . l:klnum . "   Indentazione " . l:ind . " (5a)"

    " when indentato rispetto a case
	elseif l:line =~ '^\s*when\>'
		let l:klnum = FindMatchingKeyword('^\s*case\>','^\s*end\s\+case\>')
		let l:ind = indent(l:klnum) + l:shift
		echo "Riferimento Linea: " . l:klnum . "   Indentazione " . l:ind . " (6a)"

	" 'port' e 'generic' indentati rispetto ad 'entity' nella dichiarazione
	" o a 'component' nell' architettura
	elseif l:line =~ '\<\%(port\|generic\)\>'&& l:line!~'map'
 		let l:klnum = search('\s*\(entity\|component\)\>', "bW")
		let l:ind = indent(l:klnum) + l:shift
		echo "Riferimento Linea: " . l:klnum . "   Indentazione " . l:ind . " (7a)"

	" tutti i port map e i generic map vengono indentati della stessa quantità
	elseif l:line =~ '\<\%(port\|generic\)\s\+map\>'
		let l:klnum = search('^\s*\%(\h\w*\s*:\s*\)', "bW")
		let l:ind = indent(l:klnum)
		echo "Riferimento Linea: " . l:klnum . "   Indentazione " . l:ind . " (8a)"

	" end of component port map
	elseif l:line =~ '^\s*)\s*;'
		let l:ind = l:ind_prev - l:shift
		echo "Riferimento Linea: " . "Precedente" . "   Indentazione " . l:ind . " (9a)"

	" indentazione per gli assert
	elseif l:line =~ '^\s*\%(report\|severity\)' 
		let l:klnum = search('^\s*\(assert\)\>', "bW")
		let l:ind = indent(l:klnum) + l:shift
		echo "Riferimento Linea: " . l:klnum . "   Indentazione " . l:ind . " (10a)"   
	endif


    "echo "Indentazione: " . l:ind
	return l:ind
endfunction
" }}}

" vim: ts=4 sw=4
