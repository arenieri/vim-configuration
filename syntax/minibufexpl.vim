if !exists("g:did_minibufexplorer_syntax_inits")
" Define highlight for MiniBufExplore"

function s:SetMBEColors()
    " Chose the colors for minibufexplorer with the same theme used by airline
    let s:MBENormal_hi_cmd               = "hi MBENormal_hi               guifg=". g:airline#themes#{g:airline_theme}#palette.inactive['airline_c'][0] ." guibg=". g:airline#themes#{g:airline_theme}#palette.inactive['airline_c'][1] ." gui=italic"
    let s:MBEChanged_hi_cmd              = "hi MBEChanged_hi              guifg=". g:airline#themes#{g:airline_theme}#palette.visual['airline_a'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.visual['airline_a'][1]   ." gui=italic"
    let s:MBEVisibleNormal_hi_cmd        = "hi MBEVisibleNormal_hi        guifg=". g:airline#themes#{g:airline_theme}#palette.normal['airline_b'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.normal['airline_b'][1]
    let s:MBEVisibleChanged_hi_cmd       = "hi MBEVisibleChanged_hi       guifg=". g:airline#themes#{g:airline_theme}#palette.insert['airline_b'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.insert['airline_b'][1]
    let s:MBEVisibleActiveNormal_hi_cmd  = "hi MBEVisibleActiveNormal_hi  guifg=". g:airline#themes#{g:airline_theme}#palette.normal['airline_a'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.normal['airline_a'][1] ." gui=underline,bold"
    let s:MBEVisibleActiveChanged_hi_cmd = "hi MBEVisibleActiveChanged_hi guifg=". g:airline#themes#{g:airline_theme}#palette.insert['airline_a'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.insert['airline_a'][1] ." gui=underline,bold"

    execute s:MBENormal_hi_cmd
    execute s:MBEChanged_hi_cmd
    execute s:MBEVisibleNormal_hi_cmd
    execute s:MBEVisibleChanged_hi_cmd
    execute s:MBEVisibleActiveNormal_hi_cmd
    execute s:MBEVisibleActiveChanged_hi_cmd
endfunction


if g:airline_theme == 'light'
    "                                   Changed             Visible             Active
    hi MBENormal_hi                     guifg=#80a0ff                           gui=italic          ctermbg=darkblue
    hi MBEChanged_hi                    guifg=Orange                            gui=italic          ctermbg=darkblue
    hi MBEVisibleNormal_hi              guifg=#80a0ff       guibg=#004080                           ctermbg=darkblue
    hi MBEVisibleChanged_hi             guifg=Orange        guibg=#004080                           ctermbg=darkblue
    hi MBEVisibleActiveNormal_hi        guifg=#80a0ff       guibg=#004080       gui=underline,bold  ctermbg=darkblue
    hi MBEVisibleActiveChanged_hi       guifg=Orange        guibg=#004080       gui=underline,bold  ctermbg=darkblue
else
    call s:SetMBEColors()
endif

hi  link MBENormal                MBENormal_hi
hi  link MBEChanged               MBEChanged_hi
hi  link MBEVisibleNormal         MBEVisibleNormal_hi
hi  link MBEVisibleChanged        MBEVisibleChanged_hi
hi  link MBEVisibleActiveNormal   MBEVisibleActiveNormal_hi
hi  link MBEVisibleActiveChanged  MBEVisibleActiveChanged_hi


" Tell MiniBufExplored script that syntax highlight is already defined
let g:did_minibufexplorer_syntax_inits = 1
endif
