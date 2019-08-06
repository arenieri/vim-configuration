"
" Highlight in a different color the line with the cursor
"

if exists("loaded_colorcursorline")
    finish
endif
let loaded_colorcursorline = 1

" highlight current word (same as *) but don't jump to the next match
nnoremap <silent> h         :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" configure CursorLine colors
hi CursorLine guibg=darkblue guifg=white
map <F3> :set cursorline!<CR>

