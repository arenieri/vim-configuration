
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
    Plug 'majutsushi/tagbar',       { 'on': 'TagbarToggle' }
    Plug 'tpope/vim-fugitive'
    Plug 'istepura/vim-toolbar-icons-silk'
    "Beautify nerdtree (keep this at the end)
    Plug 'ryanoasis/vim-devicons'

" Add plugins to &runtimepath
call plug#end()

" source main configuration file 
" The file is located in vim-configuration
runtime my_config.vim

