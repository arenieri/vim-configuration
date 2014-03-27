"-----------------------"
" Plugins Configuration "
"-----------------------"

"---------------
" NERDCommenter
"---------------
nmap <silent> <C-SPACE>       <plug>NERDCommenterInvert
vmap <silent> <C-SPACE>       <plug>NERDCommenterInvert
imap <silent> <C-SPACE> <Esc> <plug>NERDCommenterInvert i
smap <silent> <C-SPACE> <C-G> <plug>NERDCommenterInvert<CR>

nmap <silent> <C-K>           <plug>NERDCommenterComment
vmap <silent> <C-K>           <plug>NERDCommenterAlignLeft
imap <silent> <C-K>     <Esc> <plug>NERDCommenterComment i
smap <silent> <C-K>     <C-G> <plug>NERDCommenterAlignLeft<CR>

nmap <silent> <C-L>           <plug>NERDCommenterUncomment
vmap <silent> <C-L>           <plug>NERDCommenterUncomment
imap <silent> <C-L>     <Esc> <plug>NERDCommenterUncomment i
smap <silent> <C-L>     <C-G> <plug>NERDCommenterUncomment<CR>

"-------------
" IndentGuide
"-------------
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
"let g:indent_guides_enable_on_vim_startup = 1

"---------------------
" Rainbow parentheses
"---------------------
let g:rainbow_active = 1

"-------
" CTAGS
"-------
if has('unix')
    let g:Tlist_Ctags_Cmd     = '/users/arenieri/bin/ctags'
    let g:tagbar_ctags_bin  = '/users/arenieri/bin/ctags'
endif


" Configuration for TAGLIST
" Configure CTAGS for systemverilog
"let tlist_systemverilog_settings = 'systemverilog;m:module;c:class;t:task;f:function' .
"            \ 'm:module;p:program;i:interface;e:typedef;d:define;v:variable'

let tlist_systemverilog_settings = 'systemverilog;a:access;b:always;c:assertion;' .
                        \ 'd:case;e:clocking;f:chandle;g:checker;h:config;i:constant;' .
                        \ 'j:constraint;l:covergroup;m:coverpoint;n:coverbin;o:class;' .
                        \ 'p:enum;q:event;r:final;s:fork;t:function;u:generate;v:imexport;' .
                        \ 'w:implementation;x:include;y:inheritance;z:initial;A:interface;' .
                        \ 'B:int_atomic;C:int_vector;E:lifetime;F:linkage;G:module;H:net;' .
                        \ 'I:non-integral;J:package;K:port;L:primitive;M:program;N:property;' .
                        \ 'O:qualifier;P:randsequence;Q:seqblk;R:sequence;S:specify;T:string;' .
                        \ 'U:strunion;V:table;W:task;X:timespec;Y:typedef;Z:void'

" Configuration for TAGBAR

let g:tagbar_type_systemverilog = {
    \ 'ctagstype': 'Systemverilog',
    \ 'kinds': [
        \ 'a:access', 'b:always', 'c:assertion', 'd:case', 'e:clocking', 'f:chandle', 'g:checker',
        \ 'h:config', 'i:constant', 'j:constraint', 'k:controlstatement', 'l:covergroup', 'm:coverpoint',
        \ 'n:coverbin', 'o:class', 'p:enum', 'q:event', 'r:final', 's:fork', 't:function', 'u:generate',
        \ 'v:imexport', 'w:implementation', 'x:include', 'y:inheritance', 'z:initial', 'A:interface',
        \ 'B:int_atomic', 'C:int_vector', 'D:libraries', 'E:lifetime', 'F:linkage', 'G:module', 'H:net',
        \ 'I:non-integral', 'J:package', 'K:port', 'L:primitive', 'M:program', 'N:property',
        \ 'O:qualifier', 'P:randsequence', 'Q:seqblk', 'R:sequence', 'S:specify', 'T:string',
        \ 'U:strunion', 'V:UDPtable', 'W:task', 'X:timespec', 'Y:typedef', 'Z:void'
    \]
\}

"---------
" Airline
"---------
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
