"configuration file to be sourced in .vimrc with
" runtime my_config.vim

set nocompatible
runtime mswin.vim
behave mswin

" install pathogen
execute pathogen#infect('bundle/{}', 'git-bundle/{}', '~/.vim/others/powerline/powerline/bindings/{}')
syntax on
filetype plugin indent on

runtime my_commands.vim
runtime my_menu.vim

" Font
" Use different font on different platforms
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Monospace\ 10
    elseif has("x11")
        set guifont=-misc-fixed-medium-r-semicondensed-*-*-120-*-*-c-*-iso8859-8,-misc-fixed-medium-r-semicondensed-*-*-120-*-*-c-*-iso8859-1
    elseif has("win32")
        set guifont=Courier:h9:cANSI,\ -adobe-courier-medium-r-normal-*-*-140-*-*-m-*-iso10646-1	
    else
        set guifont=Courier:h9:cANSI
    endif
endif 


" Color
colorscheme darkblue


" Configuration
set textwidth=120   " Text width
set tabstop=8	    " Number of spaces that a <Tab> in the file counts for (!!! do not modify this !!!)
set softtabstop=4   " Number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
set expandtab       " Convert tab into spaces
set showtabline=1   " Show tabs (0: do not show tabs; 1: show tabs only if present; 2: always show tabs)
set scrolloff=1     " Start to scroll text when cursor reaches n lines from border
set laststatus=2    " show status line (0: never; 1: if more than one window; 2: always)
set columns=125     " Editor width
set nowrap          " Wrap long lines
set number          " Show line numbers
set hlsearch        " Highlight search patterns

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching


" Folding
set foldmethod=marker
set foldcolumn=3


" Show orizontal slide bar
setlocal guioptions+=b

" Window title
set titlestring=%t\ %M\ %<(%F)\ -\ %{v:servername}
"set titlestring=%t\ %M\ %<(%{expand(\"%:~:h\")})
"set titlestring=%t\ %m\ %r

" Set directory for backup and swap files
set directory=~/.vim-tmp
set backupdir=~/.vim-tmp

" Set directory for persistent undo
if has("persistent_undo")
    set undodir=~/.vim-tmp/undo
    set undofile
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" Load plugins configuration
runtime my_plugin_cfg.vim
