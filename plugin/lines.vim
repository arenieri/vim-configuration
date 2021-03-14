"
" Various key mappings to work with lines
"

if exists("loaded_lines")
    finish
endif
let loaded_lines = 1

" Move lines with Alt + Up/Down
nnoremap <silent> <C-Down> :m .+1<CR>==
nnoremap <silent> <C-Up>   :m .-2<CR>==
inoremap <silent> <C-Down> <Esc>:m .+1<CR>==gi
inoremap <silent> <C-Up>   <Esc>:m .-2<CR>==gi
vnoremap <silent> <C-Down> :m '>+1<CR>gv=gv
vnoremap <silent> <C-Up>   :m '<-2<CR>gv=gv

" Duplicate lines
nnoremap <silent> <C-D>      :t.<CR>
inoremap <silent> <C-D> <C-O>:t.<CR>
vnoremap <silent> <C-D>      :t'><CR>gv

" Erase lines
nnoremap <silent> <C-E>      :d<CR>
inoremap <silent> <C-E> <C-O>:d<CR>
vnoremap <silent> <C-E>      :d<CR>

" Erase line content
nnoremap <silent> <C-W>       0D
inoremap <silent> <C-W> <Esc> 0Di
vnoremap <silent> <C-W>       0Dv

" Indent lines
nnoremap <silent> <C-Tab>    :><CR>
nnoremap <silent> <C-S-Tab>  :<<CR>
vnoremap <silent> <C-Tab>    :><CR>gv
vnoremap <silent> <C-S-Tab>  :<<CR>gv

" Remove trailing spaces
command! -range=% RTS <line1>,<line2>s/\s\+$//|norm!``
map <F2> :RTS<CR>

" Search and replace current selection
vnoremap <silent> <C-R>     "hy:%s/\<<C-R>h\>//gc<Left><Left><Left>
