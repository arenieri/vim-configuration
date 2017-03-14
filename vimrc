
" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -kfLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" install plugins using vim-plug
call plug#begin('~/.vim/plugged')
    " vim-configuration plugin
    Plug 'arenieri/vim-configuration'
    Plug 'scrooloose/nerdtree',     { 'on':  'NERDTreeToggle' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'mbbill/undotree'
    Plug 'bling/vim-airline'
    Plug 'luochen1990/rainbow'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'fholgado/minibufexpl.vim'
    Plug 'vim-scripts/mru.vim'
    " Note: dev is the default branch for vim-perl
    Plug 'vim-perl/vim-perl',       { 'branch': 'dev' }
    Plug 'majutsushi/tagbar'
    "Plug 'tpope/vim-fugitive'

" Add plugins to &runtimepath
call plug#end()

" source main configuration file 
" The file is located in vim-configuration
runtime my_config.vim

