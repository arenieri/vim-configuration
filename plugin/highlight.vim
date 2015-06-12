" highlight current word (same as *) but don't jump to the next match
nnoremap <silent> h         :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" configure CursorLine colors
hi CursorLine guibg=darkblue guifg=white
map <F3> :set cursorline!<CR>

