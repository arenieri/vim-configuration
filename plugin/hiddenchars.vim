"
" Automatically enable/disable hidden characters for specific filetypes
" when a buffer is read

if exists("loaded_showhidden")
    finish
endif
let loaded_showhidden = 1


"Show trailing spaces with ASCII middle dot (dec183),
"     tabs with double angle quotes (dec187)
function! s:showhiddenchars()
    " Use these echos for debug
    "echo &ft
    "echo index(g:nohiddenchars_ftypes, &ft)
    if index(g:nohiddenchars_ftypes, &ft) < 0
        if index(g:showtrailspacesonly_ftypes, &ft) >= 0
            set listchars=tab:\ \ ,trail:·
        else
            set listchars=tab:»·,trail:·
        endif
        set list
    else
        set nolist
    endif
endfunction

" filetypes for which only the trailing spaces are shown
let g:showtrailspacesonly_ftypes    = ['make',]

" filetypes for which hidden chars are not shown
let g:nohiddenchars_ftypes          = ['log', 'text', 'help', 'gitcommit']

autocmd! BufNewFile,BufRead  *  call s:showhiddenchars()


" Color background of non-ascii caracters in red, independently from other
" syntax highligt rules
highlight nonascii guibg=Red ctermbg=1 term=standout
au BufReadPost * syntax match nonascii "[^\u0000-\u007F]"


