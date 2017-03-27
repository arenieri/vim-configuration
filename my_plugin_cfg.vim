"-----------------------"
" Plugins Configuration "
"-----------------------"

" ---------
"  Matchit
" ---------
packadd! matchit

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

" Pathch to disable rainbow parentheses on TT2 files
" (TT2 syntax highlight does not work properly)
autocmd BufEnter  *.tt2  :RainbowToggleOff
autocmd BufLeave  *.tt2  :RainbowToggleOn

"---------
" Airline
"---------
if isdirectory($HOME."/.fonts/powerline-fonts")
    " Enable powerline fonts
    let g:airline_powerline_fonts = 1
else
    " Use ASCII characters
    let g:airline_powerline_fonts = 0
endif
let g:airline#extensions#tabline#enabled = 0

" Shortcuts to change buffers
noremap <C-N> :bnext<CR>
noremap <C-B> :bprev<CR>

"let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
let g:airline#extensions#whitespace#checks = [ 'trailing' ]

"-----------------
" MiniBufExplorer
"-----------------
let g:did_minibufexplorer_syntax_inits = 1
"let g:miniBufExplDebugMode  = 2
"let g:miniBufExplDebugLevel = 10

"                                   Changed             Visible             Active
hi MBENormal_hi                     guifg=#80a0ff                           gui=italic          ctermbg=darkblue
hi MBEChanged_hi                    guifg=Orange                            gui=italic          ctermbg=darkblue
hi MBEVisibleNormal_hi              guifg=#80a0ff       guibg=#004080                           ctermbg=darkblue
hi MBEVisibleChanged_hi             guifg=Orange        guibg=#004080                           ctermbg=darkblue
hi MBEVisibleActiveNormal_hi        guifg=#80a0ff       guibg=#004080       gui=underline,bold  ctermbg=darkblue
hi MBEVisibleActiveChanged_hi       guifg=Orange        guibg=#004080       gui=underline,bold  ctermbg=darkblue

hi def link MBENormal                MBENormal_hi
hi def link MBEChanged               MBEChanged_hi
hi def link MBEVisibleNormal         MBEVisibleNormal_hi
hi def link MBEVisibleChanged        MBEVisibleChanged_hi
hi def link MBEVisibleActiveNormal   MBEVisibleActiveNormal_hi
hi def link MBEVisibleActiveChanged  MBEVisibleActiveChanged_hi

"-------
" CTAGS
"-------
"if has('unix')
"    let g:Tlist_Ctags_Cmd   = $HOME.'/bin/ctags'
"    let g:tagbar_ctags_bin  = $HOME.'/bin/ctags'
"endif


" Configuration for TAGLIST
" Configure CTAGS for systemverilog
"let tlist_systemverilog_settings = 'systemverilog;c:class;t:task;f:function' .
"            \ 'm:module;p:program;i:interface;e:typedef;P:property'

"let tlist_systemverilog_settings = 'systemverilog;a:access;b:always;c:assertion;' .
"                        \ 'd:case;e:clocking;f:chandle;g:checker;h:config;i:constant;' .
"                        \ 'j:constraint;l:covergroup;m:coverpoint;n:coverbin;o:class;' .
"                        \ 'p:enum;q:event;r:final;s:fork;t:function;u:generate;v:imexport;' .
"                        \ 'w:implementation;x:include;y:inheritance;z:initial;A:interface;' .
"                        \ 'B:int_atomic;C:int_vector;E:lifetime;F:linkage;G:module;H:net;' .
"                        \ 'I:non-integral;J:package;K:port;L:primitive;M:program;N:property;' .
"                        \ 'O:qualifier;P:randsequence;Q:seqblk;R:sequence;S:specify;T:string;' .
"                        \ 'U:strunion;V:table;W:task;X:timespec;Y:typedef;Z:void'

" Configuration for TAGBAR
"let g:tagbar_type_systemverilog = {
"    \ 'ctagstype'   : 'systemverilog',
"    \ 'kinds'       : [
"        \ 'c:class','t:task','f:function','m:module','p:program','i:interface','e:typedef','P:property'
"        \ ],
"    \ 'sro'         : '::',
"    \ 'kind2scope' : {
"        \ 'class'       : 'c',
"        \ 'task'        : 't',
"        \ 'function'    : 'f',
"        \ 'module'      : 'm',
"        \ 'program'     : 'p',
"        \ 'interface'   : 'i',
"        \ 'typedef'     : 'e',
"        \ 'property'    : 'P'
"        \ },
"    \ 'scope2kind' : {
"        \ 'c' : 'class'    ,
"        \ 't' : 'task'     ,
"        \ 'f' : 'function' ,
"        \ 'm' : 'module'   ,
"        \ 'p' : 'program'  ,
"        \ 'i' : 'interface',
"        \ 'e' : 'typedef'  ,
"        \ 'P' : 'property'
"        \ }
"    \}

"let g:tagbar_type_systemverilog = {
"    \ 'ctagstype': 'Systemverilog',
"    \ 'kinds': [
"        \ 'a:access', 'b:always:0:0', 'c:assertion', 'd:case:0:0', 'e:clocking', 'f:chandle', 'g:checker',
"        \ 'h:config', 'i:constant:0:0', 'j:constraint', 'k:controlstatement:0:0', 'l:covergroup', 'm:coverpoint',
"        \ 'n:coverbin', 'o:class', 'p:enum', 'q:event', 'r:final', 's:fork', 't:function', 'u:generate',
"        \ 'v:imexport', 'w:implementation', 'x:include', 'y:inheritance', 'z:initial', 'A:interface',
"        \ 'B:int_atomic', 'C:int_vector', 'D:libraries', 'E:lifetime', 'F:linkage', 'G:module', 'H:net',
"        \ 'I:non-integral', 'J:package', 'K:port', 'L:primitive', 'M:program', 'N:property',
"        \ 'O:qualifier', 'P:randsequence', 'Q:seqblk', 'R:sequence', 'S:specify', 'T:string',
"        \ 'U:strunion', 'V:UDPtable', 'W:task', 'X:timespec', 'Y:typedef', 'Z:void'
"    \]
"\}

