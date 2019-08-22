if !exists("g:did_minibufexplorer_syntax_inits")
" Define highlight for MiniBufExplore"

function s:SetMBEColors()
    if g:airline_theme == 'light'
        " Set minibufexplorer colors for the 'light' airline theme
        "                               Changed             Visible             Active
        hi MBENormal                    guifg=#80a0ff                           gui=italic          ctermbg=darkblue
        hi MBEChanged                   guifg=Orange                            gui=italic          ctermbg=darkblue
        hi MBEVisibleNormal             guifg=#80a0ff       guibg=#004080                           ctermbg=darkblue
        hi MBEVisibleChanged            guifg=Orange        guibg=#004080                           ctermbg=darkblue
        hi MBEVisibleActiveNormal       guifg=#80a0ff       guibg=#004080       gui=underline,bold  ctermbg=darkblue
        hi MBEVisibleActiveChanged      guifg=Orange        guibg=#004080       gui=underline,bold  ctermbg=darkblue

    else
        " Chose the colors for minibufexplorer with the same theme used by airline
        let MBENormal_hi_cmd               = "hi MBENormal               guifg=". g:airline#themes#{g:airline_theme}#palette.inactive['airline_c'][0] ." guibg=". g:airline#themes#{g:airline_theme}#palette.inactive['airline_c'][1] ." gui=italic"
        let MBEChanged_hi_cmd              = "hi MBEChanged              guifg=". g:airline#themes#{g:airline_theme}#palette.visual['airline_a'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.visual['airline_a'][1]   ." gui=italic"
        let MBEVisibleNormal_hi_cmd        = "hi MBEVisibleNormal        guifg=". g:airline#themes#{g:airline_theme}#palette.normal['airline_b'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.normal['airline_b'][1]
        let MBEVisibleChanged_hi_cmd       = "hi MBEVisibleChanged       guifg=". g:airline#themes#{g:airline_theme}#palette.insert['airline_b'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.insert['airline_b'][1]
        let MBEVisibleActiveNormal_hi_cmd  = "hi MBEVisibleActiveNormal  guifg=". g:airline#themes#{g:airline_theme}#palette.normal['airline_a'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.normal['airline_a'][1] ." gui=underline,bold"
        let MBEVisibleActiveChanged_hi_cmd = "hi MBEVisibleActiveChanged guifg=". g:airline#themes#{g:airline_theme}#palette.insert['airline_a'][0]   ." guibg=". g:airline#themes#{g:airline_theme}#palette.insert['airline_a'][1] ." gui=underline,bold"

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
