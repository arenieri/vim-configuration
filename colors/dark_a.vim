" Name:         Dark_A
" Description:  Dark A colorscheme
" Author:       Myself <myself@somewhere.org>
" Maintainer:   Myself <myself@somewhere.org>
" Website:      https://me.org
" License:      Public domain
" Last Updated: Sat Jun 11 09:52:57 2022

" Generated by Colortemplate v2.2.0

set background=dark

hi clear
let g:colors_name = 'dark_a'

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 1
let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running')

hi! link QuickFixLine Search
hi! link Character Constant
hi! link Conditional Statement
hi! link Define PreProc
hi! link Debug PreProc
hi! link Delimiter Special
hi! link Float Constant
hi! link Keyword Statement
hi! link Label Statement
hi! link Macro PreProc
hi! link Number Constant
hi! link Operator Statement
hi! link PreCondit PreProc
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StorageClass Type
hi! link Structure Type
hi! link Tag Special
hi! link Typedef Type
hi! link lCursor Cursor

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#000000', '#ff0000', '#00ff00', '#ffff00', '#0000ff', '#ff00ff', '#00ffff', '#ebebeb', '#d2d2d2', '#ff6400', '#64ff00', '#ffff64', '#0064ff', '#ff64ff', '#64ffff', '#ffffff']
endif
if get(g:, 'dark_transp_bg', 0) && !has('gui_running')
  hi Normal guifg=#e6e6dc guibg=NONE gui=NONE cterm=NONE
  hi Terminal guifg=#e6e6dc guibg=NONE gui=NONE cterm=NONE
else
  hi Normal guifg=#e6e6dc guibg=#002635 gui=NONE cterm=NONE
  hi Terminal guifg=#e6e6dc guibg=#002635 gui=NONE cterm=NONE
endif
hi ColorColumn guifg=NONE guibg=#5a5a5a gui=NONE cterm=NONE
hi Conceal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Cursor guifg=NONE guibg=#c43060 gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#004453 gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#642252 gui=NONE cterm=NONE
hi CursorLineNr guifg=#b7cff9 guibg=#642252 gui=bold cterm=bold
hi DiffAdd guifg=#9cf087 guibg=#002635 gui=NONE cterm=NONE
hi DiffChange guifg=#00cccc guibg=#002635 gui=underline cterm=underline
hi DiffDelete guifg=#c43060 guibg=#002635 gui=NONE cterm=NONE
hi DiffText guifg=#e6e6dc guibg=NONE gui=NONE cterm=NONE
hi Directory guifg=#00ffff guibg=#002635 gui=NONE cterm=NONE
hi EndOfBuffer guifg=#e6e6dc guibg=#002635 gui=NONE cterm=NONE
hi ErrorMsg guifg=#c43060 guibg=NONE gui=NONE cterm=NONE
hi FoldColumn guifg=#77929e guibg=#00384d gui=NONE cterm=NONE
hi Folded guifg=#77929e guibg=#00384d gui=NONE cterm=NONE
hi IncSearch guifg=#002635 guibg=#ffcc1b gui=NONE cterm=NONE
hi LineNr guifg=#77929e guibg=#00384d gui=NONE cterm=NONE
hi MatchParen guifg=#002635 guibg=#00cccc gui=NONE cterm=NONE
hi ModeMsg guifg=#e6e6dc guibg=#002635 gui=bold cterm=bold
hi MoreMsg guifg=#2fef58 guibg=#002635 gui=bold cterm=bold
hi NonText guifg=#517f8d guibg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#e6e6dc guibg=#00384d gui=NONE cterm=NONE
hi PmenuSbar guifg=#e6e6dc guibg=#bebebe gui=NONE cterm=NONE
hi PmenuSel guifg=#00cccc guibg=#517f8d gui=NONE cterm=NONE
hi PmenuThumb guifg=#e6e6dc guibg=#ffffff gui=NONE cterm=NONE
hi Question guifg=#00ff00 guibg=#002635 gui=bold cterm=bold
hi Search guifg=#002635 guibg=#f06eff gui=NONE cterm=NONE
hi SignColumn guifg=#b7cff9 guibg=#002635 gui=NONE cterm=NONE
hi SpecialKey guifg=#00ffff guibg=#002635 gui=NONE cterm=NONE
hi SpellBad guifg=#77929e guibg=NONE guisp=#ff0000 gui=undercurl cterm=undercurl
hi SpellCap guifg=#77929e guibg=NONE guisp=#0000ff gui=undercurl cterm=undercurl
hi SpellLocal guifg=#77929e guibg=NONE guisp=#ff00ff gui=undercurl cterm=undercurl
hi SpellRare guifg=#77929e guibg=NONE guisp=#00ffff gui=reverse,undercurl cterm=reverse,undercurl
hi StatusLine guifg=#e6e6dc guibg=#00384d gui=NONE cterm=NONE
hi StatusLineNC guifg=#e6e6dc guibg=#517f8d gui=NONE cterm=NONE
hi StatusLineTerm guifg=#002635 guibg=#90ef8f gui=NONE cterm=NONE
hi StatusLineTermNC guifg=#002635 guibg=#90ef8f gui=NONE cterm=NONE
hi TabLine guifg=#77929e guibg=#00384d gui=NONE cterm=NONE
hi TabLineFill guifg=NONE guibg=#00384d gui=NONE cterm=NONE
hi TabLineSel guifg=#e6e6dc guibg=#1c8db2 gui=NONE cterm=NONE
hi Title guifg=#00cccc guibg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#517f8d guibg=#002635 gui=NONE cterm=NONE
hi Visual guifg=#e6e6dc guibg=#8968cd gui=NONE cterm=NONE
hi VisualNOS guifg=#e6e6dc guibg=#8968cd gui=bold cterm=bold
hi WarningMsg guifg=#ff0000 guibg=#002635 gui=NONE cterm=NONE
hi WildMenu guifg=#e6e6dc guibg=#517f8d gui=NONE cterm=NONE
hi Comment guifg=#77929e guibg=NONE gui=italic cterm=italic
hi Constant guifg=#e18248 guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#c43060 guibg=NONE gui=NONE cterm=NONE
hi Exception guifg=#c43060 guibg=NONE gui=NONE cterm=NONE
hi Function guifg=#6d9eb3 guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#e18248 guibg=NONE gui=NONE cterm=NONE
hi Ignore guifg=#77929e guibg=NONE gui=NONE cterm=NONE
hi Include guifg=#00c8c8 guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#ff80ff guibg=NONE gui=NONE cterm=NONE
hi Special guifg=#ffbe00 guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#1c8db2 guibg=NONE gui=NONE cterm=NONE
hi String guifg=#9cf087 guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=#d04000 guibg=#ffcc1b gui=bold cterm=bold
hi Type guifg=#ff5a67 guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=#b7cff9 guibg=NONE gui=underline cterm=underline
hi Boolean guifg=#ff5a67 guibg=NONE gui=NONE cterm=NONE
hi CursorIM guifg=NONE guibg=fg gui=NONE cterm=NONE
hi ToolbarLine guifg=#e6e6dc guibg=#7f7f7f gui=NONE cterm=NONE
hi ToolbarButton guifg=#000000 guibg=#d3d3d3 gui=bold cterm=bold
if !s:italics
  hi Comment gui=NONE cterm=NONE
endif

if s:t_Co >= 256
  if get(g:, 'dark_transp_bg', 0)
    hi Normal ctermfg=254 ctermbg=NONE cterm=NONE
    hi Terminal ctermfg=254 ctermbg=NONE cterm=NONE
  else
    hi Normal ctermfg=254 ctermbg=235 cterm=NONE
    hi Terminal ctermfg=254 ctermbg=235 cterm=NONE
  endif
  hi ColorColumn ctermfg=NONE ctermbg=240 cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=NONE ctermbg=161 cterm=NONE
  hi CursorColumn ctermfg=NONE ctermbg=23 cterm=NONE
  hi CursorLine ctermfg=NONE ctermbg=89 cterm=NONE
  hi CursorLineNr ctermfg=153 ctermbg=89 cterm=bold
  hi DiffAdd ctermfg=156 ctermbg=235 cterm=NONE
  hi DiffChange ctermfg=44 ctermbg=235 cterm=underline
  hi DiffDelete ctermfg=161 ctermbg=235 cterm=NONE
  hi DiffText ctermfg=254 ctermbg=NONE cterm=NONE
  hi Directory ctermfg=51 ctermbg=235 cterm=NONE
  hi EndOfBuffer ctermfg=254 ctermbg=235 cterm=NONE
  hi ErrorMsg ctermfg=161 ctermbg=NONE cterm=NONE
  hi FoldColumn ctermfg=66 ctermbg=24 cterm=NONE
  hi Folded ctermfg=66 ctermbg=24 cterm=NONE
  hi IncSearch ctermfg=235 ctermbg=220 cterm=NONE
  hi LineNr ctermfg=66 ctermbg=24 cterm=NONE
  hi MatchParen ctermfg=235 ctermbg=44 cterm=NONE
  hi ModeMsg ctermfg=254 ctermbg=235 cterm=bold
  hi MoreMsg ctermfg=47 ctermbg=235 cterm=bold
  hi NonText ctermfg=66 ctermbg=NONE cterm=NONE
  hi Pmenu ctermfg=254 ctermbg=24 cterm=NONE
  hi PmenuSbar ctermfg=254 ctermbg=250 cterm=NONE
  hi PmenuSel ctermfg=44 ctermbg=66 cterm=NONE
  hi PmenuThumb ctermfg=254 ctermbg=231 cterm=NONE
  hi Question ctermfg=46 ctermbg=235 cterm=bold
  hi Search ctermfg=235 ctermbg=207 cterm=NONE
  hi SignColumn ctermfg=153 ctermbg=235 cterm=NONE
  hi SpecialKey ctermfg=51 ctermbg=235 cterm=NONE
  hi SpellBad ctermfg=66 ctermbg=NONE cterm=undercurl
  hi SpellCap ctermfg=66 ctermbg=NONE cterm=undercurl
  hi SpellLocal ctermfg=66 ctermbg=NONE cterm=undercurl
  hi SpellRare ctermfg=66 ctermbg=NONE cterm=reverse,undercurl
  hi StatusLine ctermfg=254 ctermbg=24 cterm=NONE
  hi StatusLineNC ctermfg=254 ctermbg=66 cterm=NONE
  hi StatusLineTerm ctermfg=235 ctermbg=120 cterm=NONE
  hi StatusLineTermNC ctermfg=235 ctermbg=120 cterm=NONE
  hi TabLine ctermfg=66 ctermbg=24 cterm=NONE
  hi TabLineFill ctermfg=NONE ctermbg=24 cterm=NONE
  hi TabLineSel ctermfg=254 ctermbg=31 cterm=NONE
  hi Title ctermfg=44 ctermbg=NONE cterm=NONE
  hi VertSplit ctermfg=66 ctermbg=235 cterm=NONE
  hi Visual ctermfg=254 ctermbg=98 cterm=NONE
  hi VisualNOS ctermfg=254 ctermbg=98 cterm=bold
  hi WarningMsg ctermfg=196 ctermbg=235 cterm=NONE
  hi WildMenu ctermfg=254 ctermbg=66 cterm=NONE
  hi Comment ctermfg=66 ctermbg=NONE cterm=italic
  hi Constant ctermfg=173 ctermbg=NONE cterm=NONE
  hi Error ctermfg=161 ctermbg=NONE cterm=NONE
  hi Exception ctermfg=161 ctermbg=NONE cterm=NONE
  hi Function ctermfg=74 ctermbg=NONE cterm=NONE
  hi Identifier ctermfg=173 ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=66 ctermbg=NONE cterm=NONE
  hi Include ctermfg=44 ctermbg=NONE cterm=NONE
  hi PreProc ctermfg=213 ctermbg=NONE cterm=NONE
  hi Special ctermfg=214 ctermbg=NONE cterm=NONE
  hi Statement ctermfg=31 ctermbg=NONE cterm=NONE
  hi String ctermfg=156 ctermbg=NONE cterm=NONE
  hi Todo ctermfg=160 ctermbg=220 cterm=bold
  hi Type ctermfg=203 ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=153 ctermbg=NONE cterm=underline
  hi Boolean ctermfg=203 ctermbg=NONE cterm=NONE
  hi CursorIM ctermfg=NONE ctermbg=fg cterm=NONE
  hi ToolbarLine ctermfg=254 ctermbg=244 cterm=NONE
  hi ToolbarButton ctermfg=16 ctermbg=252 cterm=bold
  if !s:italics
    hi Comment cterm=NONE
  endif
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 8
  if get(g:, 'dark_transp_bg', 0)
    hi Normal ctermfg=LightGrey ctermbg=NONE cterm=NONE
    hi Terminal ctermfg=LightGrey ctermbg=NONE cterm=NONE
  else
    hi Normal ctermfg=LightGrey ctermbg=DarkBlue cterm=NONE
    hi Terminal ctermfg=LightGrey ctermbg=DarkBlue cterm=NONE
  endif
  hi ColorColumn ctermfg=NONE ctermbg=DarkGrey cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=NONE ctermbg=LightMagenta cterm=NONE
  hi CursorColumn ctermfg=NONE ctermbg=LightBlue cterm=NONE
  hi CursorLine ctermfg=NONE ctermbg=LightMagenta cterm=NONE
  hi CursorLineNr ctermfg=LightGrey ctermbg=LightMagenta cterm=bold
  hi DiffAdd ctermfg=LightGreen ctermbg=DarkBlue cterm=NONE
  hi DiffChange ctermfg=LightGreen ctermbg=DarkBlue cterm=underline
  hi DiffDelete ctermfg=LightMagenta ctermbg=DarkBlue cterm=NONE
  hi DiffText ctermfg=LightGrey ctermbg=NONE cterm=NONE
  hi Directory ctermfg=LightBlue ctermbg=DarkBlue cterm=NONE
  hi EndOfBuffer ctermfg=LightGrey ctermbg=DarkBlue cterm=NONE
  hi ErrorMsg ctermfg=LightMagenta ctermbg=NONE cterm=NONE
  hi FoldColumn ctermfg=LightGrey ctermbg=DarkBlue cterm=NONE
  hi Folded ctermfg=LightGrey ctermbg=DarkBlue cterm=NONE
  hi IncSearch ctermfg=DarkBlue ctermbg=LightYellow cterm=NONE
  hi LineNr ctermfg=LightGrey ctermbg=DarkBlue cterm=NONE
  hi MatchParen ctermfg=DarkBlue ctermbg=LightGreen cterm=NONE
  hi ModeMsg ctermfg=LightGrey ctermbg=DarkBlue cterm=bold
  hi MoreMsg ctermfg=DarkGreen ctermbg=DarkBlue cterm=bold
  hi NonText ctermfg=LightBlue ctermbg=NONE cterm=NONE
  hi Pmenu ctermfg=LightGrey ctermbg=DarkBlue cterm=NONE
  hi PmenuSbar ctermfg=LightGrey ctermbg=LightGrey cterm=NONE
  hi PmenuSel ctermfg=LightGreen ctermbg=LightBlue cterm=NONE
  hi PmenuThumb ctermfg=LightGrey ctermbg=LightGrey cterm=NONE
  hi Question ctermfg=DarkGreen ctermbg=DarkBlue cterm=bold
  hi Search ctermfg=DarkBlue ctermbg=LightMagenta cterm=NONE
  hi SignColumn ctermfg=LightGrey ctermbg=DarkBlue cterm=NONE
  hi SpecialKey ctermfg=LightBlue ctermbg=DarkBlue cterm=NONE
  hi SpellBad ctermfg=LightGrey ctermbg=NONE cterm=undercurl
  hi SpellCap ctermfg=LightGrey ctermbg=NONE cterm=undercurl
  hi SpellLocal ctermfg=LightGrey ctermbg=NONE cterm=undercurl
  hi SpellRare ctermfg=LightGrey ctermbg=NONE cterm=reverse,undercurl
  hi StatusLine ctermfg=LightGrey ctermbg=DarkBlue cterm=NONE
  hi StatusLineNC ctermfg=LightGrey ctermbg=LightBlue cterm=NONE
  hi StatusLineTerm ctermfg=DarkBlue ctermbg=LightGreen cterm=NONE
  hi StatusLineTermNC ctermfg=DarkBlue ctermbg=LightGreen cterm=NONE
  hi TabLine ctermfg=LightGrey ctermbg=DarkBlue cterm=NONE
  hi TabLineFill ctermfg=NONE ctermbg=DarkBlue cterm=NONE
  hi TabLineSel ctermfg=LightGrey ctermbg=LightBlue cterm=NONE
  hi Title ctermfg=LightGreen ctermbg=NONE cterm=NONE
  hi VertSplit ctermfg=LightBlue ctermbg=DarkBlue cterm=NONE
  hi Visual ctermfg=LightGrey ctermbg=LightMagenta cterm=NONE
  hi VisualNOS ctermfg=LightGrey ctermbg=LightMagenta cterm=bold
  hi WarningMsg ctermfg=DarkRed ctermbg=DarkBlue cterm=NONE
  hi WildMenu ctermfg=LightGrey ctermbg=LightBlue cterm=NONE
  hi Comment ctermfg=LightGrey ctermbg=NONE cterm=italic
  hi Constant ctermfg=LightRed ctermbg=NONE cterm=NONE
  hi Error ctermfg=LightMagenta ctermbg=NONE cterm=NONE
  hi Exception ctermfg=LightRed ctermbg=NONE cterm=NONE
  hi Function ctermfg=LightBlue ctermbg=NONE cterm=NONE
  hi Identifier ctermfg=LightRed ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=LightGrey ctermbg=NONE cterm=NONE
  hi Include ctermfg=LightBlue ctermbg=NONE cterm=NONE
  hi PreProc ctermfg=LightRed ctermbg=NONE cterm=NONE
  hi Special ctermfg=LightRed ctermbg=NONE cterm=NONE
  hi Statement ctermfg=LightBlue ctermbg=NONE cterm=NONE
  hi String ctermfg=LightGreen ctermbg=NONE cterm=NONE
  hi Todo ctermfg=DarkRed ctermbg=LightYellow cterm=bold
  hi Type ctermfg=LightMagenta ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=LightBlue ctermbg=NONE cterm=underline
  hi Boolean ctermfg=LightMagenta ctermbg=NONE cterm=NONE
  hi CursorIM ctermfg=NONE ctermbg=fg cterm=NONE
  hi ToolbarLine ctermfg=LightGrey ctermbg=LightGrey cterm=NONE
  hi ToolbarButton ctermfg=Black ctermbg=LightGrey cterm=bold
  if !s:italics
    hi Comment cterm=NONE
  endif
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 0
  hi Normal term=NONE
  hi ColorColumn term=reverse
  hi Conceal term=NONE
  hi Cursor term=NONE
  hi CursorColumn term=reverse
  hi CursorLine term=underline
  hi CursorLineNr term=bold,italic,reverse,underline
  hi DiffAdd term=reverse,underline
  hi DiffChange term=reverse,underline
  hi DiffDelete term=reverse,underline
  hi DiffText term=bold,reverse,underline
  hi Directory term=NONE
  hi EndOfBuffer term=NONE
  hi ErrorMsg term=bold,italic,reverse
  hi FoldColumn term=reverse
  hi Folded term=italic,reverse,underline
  hi IncSearch term=bold,italic,reverse
  hi LineNr term=reverse
  hi MatchParen term=bold,underline
  hi ModeMsg term=NONE
  hi MoreMsg term=NONE
  hi NonText term=NONE
  hi Pmenu term=reverse
  hi PmenuSbar term=NONE
  hi PmenuSel term=NONE
  hi PmenuThumb term=NONE
  hi PopupSelected term=reverse
  hi Question term=standout
  hi Search term=italic,underline
  hi SignColumn term=reverse
  hi SpecialKey term=bold
  hi SpellBad term=italic,underline
  hi SpellCap term=italic,underline
  hi SpellLocal term=italic,underline
  hi SpellRare term=italic,underline
  hi StatusLine term=bold,reverse
  hi StatusLineNC term=reverse
  hi TabLine term=italic,reverse,underline
  hi TabLineFill term=reverse,underline
  hi TabLineSel term=bold
  hi Title term=bold
  hi VertSplit term=reverse
  hi Visual term=reverse
  hi VisualNOS term=NONE
  hi WarningMsg term=standout
  hi WildMenu term=bold
  hi Comment term=italic
  hi Constant term=bold,italic
  hi Error term=reverse
  hi Identifier term=italic
  hi Ignore term=NONE
  hi PreProc term=italic
  hi Special term=bold,italic
  hi Statement term=bold
  hi Todo term=bold,underline
  hi Type term=bold
  hi Underlined term=underline
  hi CursorIM term=NONE
  hi ToolbarLine term=reverse
  hi ToolbarButton term=bold,reverse
  if !s:italics
    hi CursorLineNr term=bold,reverse,underline
    hi ErrorMsg term=bold,reverse
    hi Folded term=reverse,underline
    hi IncSearch term=bold,reverse
    hi Search term=underline
    hi SpellBad term=underline
    hi SpellCap term=underline
    hi SpellLocal term=underline
    hi SpellRare term=underline
    hi TabLine term=reverse,underline
    hi Comment term=NONE
    hi Constant term=bold
    hi Identifier term=NONE
    hi PreProc term=NONE
    hi Special term=bold
  endif
  unlet s:t_Co s:italics
  finish
endif

" Background: dark
" Color: black          rgb(  0,   0,   0)        ~         Black
" Color: red            rgb(255,   0,   0)        ~         DarkRed
" Color: green          rgb(  0, 255,   0)        ~         DarkGreen
" Color: yellow         rgb(255, 255,   0)        ~         DarkYellow
" Color: blue           rgb(  0,   0, 255)        ~         DarkBlue
" Color: magenta        rgb(255,   0, 255)        ~         DarkMagenta
" Color: cyan           rgb(  0, 255, 255)        ~         DarkCyan
" Color: white          rgb(235, 235, 235)        ~         LightGrey
" Color: brightblack    rgb(210, 210, 210)        ~         DarkGrey
" Color: brightred      rgb(255, 100,   0)        ~         LightRed
" Color: brightgreen    rgb(100, 255,   0)        ~         LightGreen
" Color: brightyellow   rgb(255, 255, 100)        ~         LightYellow
" Color: brightblue     rgb(  0, 100, 255)        ~         LightBlue
" Color: brightmagenta  rgb(255, 100, 255)        ~         LightMagenta
" Color: brightcyan     rgb(100, 255, 255)        ~         LightCyan
" Color: C01_DarkGreen  rgb(  0,  26,  37)        ~         DarkGreen
" Color: C02_Orange     rgb(225, 130,  72)        ~         LightRed
" Color: C03_LightGray  rgb(183, 207, 249)        ~         LightGrey
" Color: C04_LightGreen rgb(156, 240, 135)        ~         LightGreen
" Color: C05_DarkBlue   rgb(  0,  38,  53)        ~         DarkBlue
" Color: C06_LightGreen rgb(  0, 204, 204)        ~         LightGreen
" Color: C07_Magenta    rgb(196,  48,  96)        ~         LightMagenta
" Color: C08_LightGrey  rgb(230, 230, 220)        ~         LightGrey
" Color: C09_Grey       rgb(119, 146, 158)        ~         LightGrey
" Color: C10_GreenBlue  rgb(  0,  56,  77)        ~         DarkBlue
" Color: C11_Yellow     rgb(255, 204,  27)        ~         LightYellow
" Color: C12_PastelBlue rgb( 81, 127, 141)        ~         LightBlue
" Color: C13_LightBlue  rgb( 28, 141, 178)        ~         LightBlue
" Color: C14_Red        rgb(100,  34,  82)        ~         LightMagenta
" Color: C15_Pink       rgb(255,  90, 103)        ~         LightMagenta
" Color: C16_Grey       rgb(183, 207, 249)        ~         LightBlue
" Color: C17_DustyGrey  rgb(127, 127, 127)        ~         LightGrey
" Color: C18_Orange3    rgb(255, 190,   0)        ~         LightRed
" Color: C19_Pink1      rgb(255, 128, 255)        ~         LightRed
" Color: C20_Cyan       rgb(  0, 255, 255)        ~         LightBlue
" Color: C21_Green      rgb( 47, 239,  88)        ~         DarkGreen
" Color: C22_White      rgb(230, 230, 220)        ~         LightGrey
" Color: C23_Green      rgb(  0, 255,   0)        ~         DarkGreen
" Color: C24_Red        rgb(255,   0,   0)        ~         DarkRed
" Color: C25_Grey       rgb(190, 190, 190)        ~         LightGrey
" Color: C26_White      rgb(255, 255, 255)        ~         LightGrey
" Color: C27_Grey       rgb(211, 211, 211)        ~         LightGrey
" Color: C28_Black      rgb(  0,   0,   0)        ~         Black
" Color: C29_Blue       rgb(109, 158, 179)        ~         LightBlue
" Color: C30_Red        rgb(196,  48,  96)        ~         LightRed
" Color: C31_Blue       rgb(  0, 200, 200)        ~         LightBlue
" Color: C32_Green      rgb(144, 239, 143)        ~         LightGreen
" Color: C33_Blue       rgb(  0,  68,  83)        ~         LightBlue
" Color: C34_Grey       rgb( 90,  90,  90)        ~         DarkGrey
" Color: C35_Orange     rgb(223,  95,   0)        ~         LightRed
" Color: C36_Orange     rgb(208,  64,   0)        ~         DarkRed
" Color: C37_White      rgb(230, 230, 220)        ~         LightGrey
" Color: C38_Magenta    rgb(240, 110, 255)        ~         LightMagenta
" Color: C39_Orchid     rgb(137, 104, 205)        ~         LightMagenta
" Color: brightwhite    #ffffff                  231        White
" Term colors: black red green yellow blue magenta cyan white
" Term colors: brightblack brightred brightgreen brightyellow
" Term colors: brightblue brightmagenta brightcyan brightwhite
" vim: et ts=2 sw=2
