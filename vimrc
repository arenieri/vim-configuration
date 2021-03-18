" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl --create-dirs -kfLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" install plugins using vim-plug
call plug#begin('~/.vim/plugged')
    " vim-configuration plugin
    Plug 'arenieri/vim-configuration'
    Plug 'arenieri/vim-plugin-minibufexpl'
    "Plug 'fholgado/minibufexpl.vim'
    Plug 'scrooloose/nerdtree',     { 'on':  'NERDTreeToggle' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'mbbill/undotree'
    Plug 'vim-scripts/mru.vim'
    " Note: dev is the default branch for vim-perl
    Plug 'vim-perl/vim-perl',       { 'branch': 'dev' }
    Plug 'majutsushi/tagbar',       { 'on': 'TagbarToggle' }
    Plug 'tpope/vim-fugitive'
    Plug 'luochen1990/rainbow'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'antoinemadec/vim-verilog-instance'
    Plug 'powerman/vim-plugin-AnsiEsc'

    " PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
    "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    " Both options are optional. You don't have to install fzf in ~/.fzf
    " and you don't have to run the install script if you use fzf only in Vim.
    " fzf only for vim
    Plug 'junegunn/fzf'

    " Enhanced fzf vim plugin
    Plug 'junegunn/fzf.vim'

    "Start Screen
    Plug 'mhinz/vim-startify'

    " Some graphical improvement
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " In case of problems with airline you can try lightline
    "Plug 'itchyny/lightline.vim'
    Plug 'istepura/vim-toolbar-icons-silk'

    " Beautify nerdtree (keep this at the end)
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    "Some colorschemes
    "Plug 'lifepillar/vim-wwdc16-theme'
    "Plug 'lifepillar/vim-gruvbox8'
    "Plug 'lifepillar/vim-solarized8'
    "Plug 'Rigellute/rigel'

    " Plugin to create custom colorschemes
    "Plug 'lifepillar/vim-colortemplate'

" Add plugins to &runtimepath
call plug#end()

" source main configuration file
" The file is located in vim-configuration
runtime my_config.vim

" Uncomment for dark blue colorscheme
"colorscheme mydarkblue
"let g:airline_theme = 'light'

"------------------------------------------
" Override Colorscheme and Airline theme
"colorscheme rigel
"let g:airline_theme = 'rigel'

"if g:airline_theme == 'rigel'
"    " Change Rigel colors
"    hi Cursor guifg=NONE ctermfg=NONE guibg=#c43060 ctermbg=209 gui=NONE cterm=NONE
"    hi FoldColumn guifg=#77929e ctermfg=246 guibg=#01384d ctermbg=235 gui=NONE cterm=NONE
"endif

"" Change Airline Theme
"let g:airline_theme_patch_func = 'AirlineThemePatch'
"function! AirlineThemePatch(palette)
"    if g:airline_theme == 'rigel'
"        " Patch rigel airline palette
"        let a:palette.inactive['airline_c'] = [ "#77929e", "#002E3E", 246, 235 ]
"    endif
"endfunction

"------------------------------------------
" Force cursor blinking
"set guicursor-=a:blinkon0

