" Vim filetype plugin file
" Language:		VHDL
" Maintainer:	Alessandro Renieri <alrenier@tin.it>
" Last Change:	29/11/2010	

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" load default settings for vhdl file
source $VIMRUNTIME/ftplugin/vhdl.vim

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
"setlocal fo-=t fo+=croqlm1
setlocal formatoptions+=r1

" Set 'comments' to format dashed lists in comments.
setlocal comments=:--

setlocal textwidth=135

" emulate 4 characters tab
setlocal softtabstop=4

" mostra la barra di scorrimento orizzontale
setlocal guioptions+=b
" il testo non torna a capo a fine linea
setlocal nowrap
" evidenzia le parentesi corrispondenti
setlocal showmatch
" Case insensitive
setlocal ignorecase
"setlocal smartcase

" Folding
set foldmethod=marker
"setlocal foldmethod=expr
"setlocal foldexpr=FoldExpr()
"setlocal foldcolumn=2


"map <F5> <C-Q>I-- <ESC>
"map <F6> <C-Q>x<ESC> 

" vim: sw=4 ts=4
