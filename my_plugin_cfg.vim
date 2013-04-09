"-----------------------"
" Plugins Configuration "
"-----------------------"

" Configuration for indent guide plugin
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
"let g:indent_guides_enable_on_vim_startup = 1

" Configuration for CTAGS
if has('unix')
    let g:Tlist_Ctags_Cmd     = '/users/arenieri/bin/ctags'
    let g:tagbar_ctags_bin  = '/users/arenieri/bin/ctags'
endif

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

