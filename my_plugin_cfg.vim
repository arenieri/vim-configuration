"-----------------------"
" Plugins Configuration "
"-----------------------"

"----------
" Startify
"----------
" Use relative paths
let g:startify_relative_path = 1

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

" Disable rainbow parentheses for some filetype
let g:rainbow_conf = {
\   'separately': {
\       'nerdtree' : 0,
\            'tt2' : 0,
\.           'log' : 0,
\   }
\}

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

"---------------------------
" NERDTree Syntax Highlight
"---------------------------
" Configuration of vim-nerdtree-syntax-highlight plugin
" Help: https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

" Initialize some arrays
" "{{{
" Extension
if !exists('g:NERDTreeExtensionHighlightColor')
  let g:NERDTreeExtensionHighlightColor = {}
endif
if !exists('g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols')
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
endif
" Exact match
if !exists('g:NERDTreeExactMatchHighlightColor')
  let g:NERDTreeExactMatchHighlightColor = {}
endif
if !exists('g:WebDevIconsUnicodeDecorateFileNodesExactSymbols')
  let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
endif
" Pattern match
if !exists('g:NERDTreePatternMatchHighlightColor')
  let g:NERDTreePatternMatchHighlightColor = {}
endif
if !exists('g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols')
  let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
endif
"}}}

let g:NERDTreeExtensionHighlightColor['sv'] = s:lightGreen " sets the color of sv files
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sv'] =  ''

let g:NERDTreeExtensionHighlightColor['svh'] = s:lightGreen " sets the color of sv files
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['svh'] =  ''

let g:NERDTreeExtensionHighlightColor['v'] = s:lightGreen " sets the color of sv files
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['v'] =  ''


"let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
"let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

"let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
"let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

" Enable the highlight of the full name
let g:NERDTreeFileExtensionHighlightFullName  = 1
let g:NERDTreeExactMatchHighlightFullName     = 1
let g:NERDTreePatternMatchHighlightFullName   = 1

if ! has("gui_running")
  " Assume that terminal does not have special characters of NerdHack font and
  " disable webdevicons
  let g:webdevicons_enable          = 0
  let g:webdevicons_enable_nerdtree = 0
  let g:webdevicons_enable_startify = 0
endif

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


