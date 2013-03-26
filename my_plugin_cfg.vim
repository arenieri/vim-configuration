"-----------------------"
" Plugins Configuration "
"-----------------------"

" Configuration for indent guide plugin
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
"let g:indent_guides_enable_on_vim_startup = 1

" Configuration for CTAGS
if has('unix')
    let Tlist_Ctags_Cmd = '/users/arenieri/bin/ctags'
endif

" Configure CTAGS for systemverilog
let tlist_systemverilog_settings = 'systemverilog;m:module;c:class;t:task;f:function' .
            \ 'm:module;p:program;i:interface;e:typedef;d:define;v:variable'


