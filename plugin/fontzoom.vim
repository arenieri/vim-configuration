" Vim plugin for quickly changing GUI font size.
"
" Maintainer: Alessandro Renieri
"             Based on guifont++ Alexander Anderson <a.anderson@utoronto.ca>
"
" Description:
" This plugin defines key mappings to quickly make the GUI font larger or
" smaller. The default mappings are "+" to make the font larger by 1 point
" and "-" to make the font smaller by 1 point. The original font size can
" be restored with "=" key at any time. CTRL+wheel is also supported.
"
" This plugin should work on Unix and Win32 but it will work only with
" certain patterns of 'guifont' option, namely:
"
"  - on Unix, 'guifont' should be set to the X Logical Font Description
"    (XLFD) name, for example:
"
"       set guifont=-*-lucidatypewriter-bold-*-*-*-15-*-*-*-*-*-*-*
"
"  - on Unix with GTK gui guifont is expected to be in the format:
"    <font name> <size>
"
"    set guifont=Hack\ 10
"
"  - on Win32, 'guifont' should include 'hXX' font option, for example:
"
"       set guifont=Lucida_Console:h8:cANSI
"
"
" Installation:
" Simply copy this plugin into your plugin directory. (See 'plugin' in the
" Vim User Manual.) Additionally, you may choose to override one of the
" following global variables, which are used by this plugin, in your vimrc
" file:
"
"  - fontzoom_size_increment         (default: 1)
"       The number of points by which to make the font size smaller or
"       larger.
"

if exists("loaded_fontzoom") || !exists("&guifont")
    finish
endif
let loaded_fontzoom = 1

let s:fontzoom_size_increment = 1

if exists("g:fontzoom_size_increment")
    let s:fontzoom_size_increment = g:fontzoom_size_increment
endif


let s:originalFontSize = 0

let s:decimalpat    = '[1-9][0-9]*'
let s:fontpat_x11   = '^\(\(-[^-]\+\)\{6}-\)\(' . s:decimalpat . '\)'
let s:fontpat_win32 = '\(:h\)\(' . s:decimalpat . '\)\(:\|,\|$\)'
let s:fontpat_gtk   = '^\(.*\s\)\(' . s:decimalpat . '\)'

function! s:GetFontSize()
    if has("gui_gtk")
        let sizealmost = matchstr(&guifont, s:fontpat_gtk)
        let size = matchstr(sizealmost, s:decimalpat . '$')
    elseif has("gui_win32")
        let sizealmost = matchstr(&guifont, s:fontpat_win32)
        let size = matchstr(sizealmost, s:decimalpat)
    elseif has("x11")
        let sizealmost = matchstr(&guifont, s:fontpat_x11)
        let size = matchstr(sizealmost, s:decimalpat . '$')
    else
        echoerr "This works only with Unix or Win32 version of Vim"
        return
    endif
    if size == ""
        echoerr "Cannot match your 'guifont' to a known pattern"
    endif
    if s:originalFontSize == 0
        let s:originalFontSize = size
    endif
    return size
endfunction

function! s:SetFontSize(size)
    if has("gui_gtk")
        let guifont = substitute(&guifont, s:fontpat_gtk, '\1' . a:size, "")
    elseif has("win32")
        let guifont = substitute(&guifont, s:fontpat_win32, '\1' . a:size . '\3', "")
    elseif has("x11")
        let guifont = substitute(&guifont, s:fontpat_x11, '\1' . a:size, "")
    endif

    let &guifont = guifont
endfunction

function! s:SetLargerFont()
    let size = s:GetFontSize()
    if size
        call s:SetFontSize(size + s:fontzoom_size_increment)
    endif
endfunction

function! s:SetSmallerFont()
    let size = s:GetFontSize()
    if size && size > 1
        call s:SetFontSize(size - s:fontzoom_size_increment)
    endif
endfunction

function! s:SetOriginalFont()
    if s:originalFontSize != 0
        call s:SetFontSize(s:originalFontSize)
    else
        echoerr "Original font size is unknown"
    endif
endfunction


map <silent> -          : call <SID>SetSmallerFont()<CR>
map <silent> +          : call <SID>SetLargerFont()<CR>
map <silent> 0          : call <SID>SetOriginalFont()<CR>

" map CTRL+mousewheel
nnoremap <silent> <C-MouseUp>    : call <SID>SetSmallerFont()<CR>
nnoremap <silent> <C-MouseDown>  : call <SID>SetLargerFont()<CR>

