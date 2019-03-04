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
amenu Misc.Remove\ Trailing\ Spaces\ (RTS)  :RTS<CR>
amenu Misc.-Sep1-                           <Nop>
amenu Misc.Increase\ Font\ Size             :SetLargerFont<CR>
amenu Misc.Decrease\ Font\ Size             :SetSmallerFont<CR>
amenu Misc.Reset\ Font\ Size                :ResetFontSize<CR>
amenu Misc.-Sep2-                           <Nop>
amenu Misc.Open\ Configuration\ Files       :NERDTree $HOME/.vim/plugged/vim-configuration/<CR>

"amenu Misc.Matrix                          :Matrix<CR>

" MacBook Touchbar
if has("touchbar")
    amenu  TouchBar.-flexspace1-   <Nop>
    "amenu icon=twotone_label_white_48dp    TouchBar.NTree          :NERDTreeToggle %:p:h<CR>
    amenu   TouchBar.NTree          :NERDTreeToggle %:p:h<CR>
    amenu   TouchBar.UndoTree       :UndotreeToggle<CR>
    amenu   TouchBar.TagBar         :TagbarToggle<CR>
    amenu   TouchBar.CurLine        :set cursorline!<CR>
    amenu   TouchBar.IndGuide       :IndentGuidesToggle<CR>
    amenu   TouchBar.RTS            :RTS<CR>
    ":amenu  TouchBar.MRU            :MRU<CR>
    amenu   TouchBar.-flexspace2-   <Nop>

endif

