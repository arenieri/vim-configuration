if !exists("g:did_minibufexplorer_syntax_inits")
" Define highlight for MiniBufExplore"

function s:SetMBEColors()
    if g:airline_theme == 'light'
        " `Set minibufexplorer colors for the 'light' airline theme
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

    else
        " Chose the colors for minibufexplorer with the same theme used by airline
        let MBENormal_hi_cmd               = "hi MBENormal_hi               guifg=". g:airline#themes#{g:airline_theme}#palette.inactive['airline_c'][0] ." guibg=". g:airline#themes#{g:airline_theme}#palette.inactive['airline_c'][1] ." gui=italic"
        let MBEChanged_hi_cmd              = "hi MBEChanged_hi              guifg=". g:airline#themes#{g:airline_theme}#palette.visual['airline_a'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.visual['airline_a'][1]   ." gui=italic"
        let MBEVisibleNormal_hi_cmd        = "hi MBEVisibleNormal_hi        guifg=". g:airline#themes#{g:airline_theme}#palette.normal['airline_b'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.normal['airline_b'][1]
        let MBEVisibleChanged_hi_cmd       = "hi MBEVisibleChanged_hi       guifg=". g:airline#themes#{g:airline_theme}#palette.insert['airline_b'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.insert['airline_b'][1]
        let MBEVisibleActiveNormal_hi_cmd  = "hi MBEVisibleActiveNormal_hi  guifg=". g:airline#themes#{g:airline_theme}#palette.normal['airline_a'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.normal['airline_a'][1] ." gui=underline,bold"
        let MBEVisibleActiveChanged_hi_cmd = "hi MBEVisibleActiveChanged_hi guifg=". g:airline#themes#{g:airline_theme}#palette.insert['airline_a'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.insert['airline_a'][1] ." gui=underline,bold"

        execute MBENormal_hi_cmd
        execute MBEChanged_hi_cmd
        execute MBEVisibleNormal_hi_cmd
        execute MBEVisibleChanged_hi_cmd
        execute MBEVisibleActiveNormal_hi_cmd
        execute MBEVisibleActiveChanged_hi_cmd
    endif
endfunction


" Set the MiniBufExplorer colors whenn the file is sourced
call s:SetMBEColors()

"command CMDSetMBEColors         call s:SetMBEColors()

" Set again MBE colors after the colorscheme is changed
"autocmd FileType minibufexpl            call s:SetMBEColors()
autocmd BufEnter -MiniBufExplorer-      call s:SetMBEColors()
" Set again MBE colors after the colorscheme is changed
"autocmd ColorScheme   *     call s:SetMBEColors()

" Tell MiniBufExplored script that syntax highlight is already defined
let g:did_minibufexplorer_syntax_inits = 1
endif
