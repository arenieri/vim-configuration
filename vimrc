
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
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " In case of problems with airline you can try lightline
    "Plug 'itchyny/lightline.vim'
    Plug 'luochen1990/rainbow'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'vim-scripts/mru.vim'
    " Note: dev is the default branch for vim-perl
    Plug 'vim-perl/vim-perl',       { 'branch': 'dev' }
    Plug 'antoinemadec/vim-verilog-instance'
    Plug 'majutsushi/tagbar',       { 'on': 'TagbarToggle' }
    Plug 'tpope/vim-fugitive'
    Plug 'istepura/vim-toolbar-icons-silk'

    "Start Screen
    Plug 'mhinz/vim-startify'
    "Beautify nerdtree (keep this at the end)
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    "Some colorschemes
    Plug 'lifepillar/vim-wwdc16-theme'
    Plug 'lifepillar/vim-gruvbox8'
    Plug 'lifepillar/vim-solarized8'
    Plug 'Rigellute/rigel'

    " PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
    Plug 'junegunn/fzf'
    "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    " Both options are optional. You don't have to install fzf in ~/.fzf
    " and you don't have to run the install script if you use fzf only in Vim.

" Add plugins to &runtimepath
call plug#end()

" source main configuration file 
" The file is located in vim-configuration
runtime my_config.vim


"Uncomment to change colorscheme
colorscheme rigel
let g:airline_theme = 'rigel'

