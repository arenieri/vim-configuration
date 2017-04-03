" Menu

" Assign funcion keys to specific functions
noremap <F6>  :RainbowToggle<CR>
noremap <F7>  :NERDTreeToggle %:p:h<CR>
noremap <F9>  :TagbarToggle<CR>
noremap <F11> :UndotreeToggle<CR>
noremap <F12> :IndentGuidesToggle<CR>


" Add Menu
amenu Misc.Highlight\ Cursor\ Line<Tab>F3   :set cursorline!<CR>
amenu Misc.Rainbow\ Parentheses<Tab>F6      :RainbowToggle<CR>
amenu Misc.NERD\ Tree<Tab>F7                :NERDTreeToggle<CR>
amenu Misc.Tagbar<Tab>F9                    :TagbarToggle<CR>
amenu Misc.Undo\ Tree<Tab>F11               :UndotreeToggle<CR>
amenu Misc.Indent\ Guide<Tab>F12            :IndentGuidesToggle<CR>
amenu Misc.MRU                              :MRU<CR>
amenu Misc.Reset\ Font\ Size                :ResetFontSize<CR>
"amenu Misc.Matrix                          :Matrix<CR>

