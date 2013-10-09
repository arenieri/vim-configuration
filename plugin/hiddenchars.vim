"Show trailing spaces with ASCII middle dot (dec183), tabs with double angle quotes (dec187)

function s:showhiddenchars()
    set listchars=tab:»·,trail:·
    set list
endfunction

autocmd BufNewFile,BufRead  *.sv,*.vim   call s:showhiddenchars()

