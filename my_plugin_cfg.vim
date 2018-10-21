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

" Pathch to disable rainbow parentheses on TT2 files
" (TT2 syntax highlight does not work properly)
autocmd BufEnter  *.tt2  :RainbowToggleOff
autocmd BufLeave  *.tt2  :RainbowToggleOn

"---------
" Airline
"---------
" Set g:airline_powerline_fonts = 1 when setting the font if the selected font
" contains the airline special characters (in my_config.vim)

" Select Airline theme
let g:airline_theme='light'

" Disable tabline
let g:airline#extensions#tabline#enabled = 0

" Shortcuts to change buffers
noremap <C-N> :bnext<CR>
noremap <C-B> :bprev<CR>

"let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
let g:airline#extensions#whitespace#checks = [ 'trailing' ]

"-----------------
" MiniBufExplorer
"-----------------
"let g:miniBufExplDebugLevel = 10

"-------
" Tagbar
"-------
" remove helpline at the top
let g:tagbar_compact = 1
" Ensure that the correct ctags is used (Universal Ctags)
" otherwise use the system default
if filereadable("˜/bin/ctags")
    let g:tagbar_ctags_bin = '~/bin/ctags'
endif
" Hierarchy definition
let g:tagbar_type_systemverilog = {
    \ 'ctagstype': 'SystemVerilog',
    \ 'kinds' : [
         \'A:assertions',
         \'C:classes',
         \'E:enumerators',
         \'I:interfaces',
         \'K:packages',
         \'M:modports',
         \'P:programs',
         \'Q:prototypes',
         \'R:properties',
         \'S:structs and unions',
         \'T:type declarations',
         \'V:covergroups',
         \'b:blocks',
         \'c:constants',
         \'e:events',
         \'f:functions',
         \'m:modules',
         \'n:net data types',
         \'p:ports',
         \'r:register data types',
         \'t:tasks',
     \],
     \ 'sro': '.',
     \ 'kind2scope' : {
        \ 'K' : 'package',
        \ 'C' : 'class',
        \ 'm' : 'module',
        \ 'P' : 'program',
        \ 'I' : 'interface',
        \ 'M' : 'modport',
        \ 'f' : 'function',
        \ 't' : 'task',
     \},
     \ 'scope2kind' : {
        \ 'package'   : 'K',
        \ 'class'     : 'C',
        \ 'module'    : 'm',
        \ 'program'   : 'P',
        \ 'interface' : 'I',
        \ 'modport'   : 'M',
        \ 'function'  : 'f',
        \ 'task'      : 't',
     \ },
     \}


