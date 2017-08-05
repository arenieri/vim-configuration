 if !exists("g:did_minibufexplorer_syntax_inits")
" Define highlight for MiniBufExplored 
"                                   Changed             Visible             Active
hi MBENormal_hi                     guifg=#80a0ff                           gui=italic          ctermbg=darkblue
hi MBEChanged_hi                    guifg=Orange                            gui=italic          ctermbg=darkblue
hi MBEVisibleNormal_hi              guifg=#80a0ff       guibg=#004080                           ctermbg=darkblue
hi MBEVisibleChanged_hi             guifg=Orange        guibg=#004080                           ctermbg=darkblue
hi MBEVisibleActiveNormal_hi        guifg=#80a0ff       guibg=#004080       gui=underline,bold  ctermbg=darkblue
hi MBEVisibleActiveChanged_hi       guifg=Orange        guibg=#004080       gui=underline,bold  ctermbg=darkblue


hi def link MBENormal                MBENormal_hi
hi def link MBEChanged               MBEChanged_hi
hi def link MBEVisibleNormal         MBEVisibleNormal_hi
hi def link MBEVisibleChanged        MBEVisibleChanged_hi
hi def link MBEVisibleActiveNormal   MBEVisibleActiveNormal_hi
hi def link MBEVisibleActiveChanged  MBEVisibleActiveChanged_hi

" Tell MiniBufExplored script that syntax highlight is already defined
let g:did_minibufexplorer_syntax_inits = 1
endif
