" Menu

" Assign funcion keys to specific functions
noremap <F6>  :RainbowToggle<CR>
noremap <F7>  :NERDTreeToggle<CR>
noremap <F9>  :TagbarToggle<CR>
noremap <F10> :TlistToggle<CR>
noremap <F11> :UndotreeToggle<CR>
noremap <F12> :IndentGuidesToggle<CR>


" Add Menu
amenu Misc.Rainbow\ Parentheses<Tab>F6  :RainbowToggle<CR>
amenu Misc.NERD\ Tree<Tab>F7            :NERDTreeToggle<CR>
amenu Misc.Tagbar<Tab>F9                :TagbarToggle<CR>
amenu Misc.Tag\ List<Tab>F10            :TlistToggle<CR>
amenu Misc.Undo\ Tree<Tab>F11           :UndotreeToggle<CR>
amenu Misc.Indent\ Guide<Tab>F12        :IndentGuidesToggle<CR>
amenu Misc.Matrix                       :Matrix<CR>

