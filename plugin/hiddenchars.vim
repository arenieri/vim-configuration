"Show trailing spaces with ASCII middle dot (dec183), tabs with double angle quotes (dec187)
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
    endif
endfunction

" filetypes for which only the trailing spaces are shown
let g:showtrailspacesonly_ftypes    = ['make',]

" filetypes for which hidden chars are not shown
let g:nohiddenchars_ftypes          = ['log', 'text', 'help', 'gitcommit']

autocmd! BufNewFile,BufRead  *  call s:showhiddenchars()

