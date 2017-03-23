"configuration file to be sourced in .vimrc with
" runtime my_config.vim

set nocompatible
runtime mswin.vim
behave mswin


if exists('g:loaded_plug')
    exe 'set runtimepath^=' . expand('<sfile>:p:h') . '/bundle/my_dssc'
    exe 'set runtimepath^=' . expand('<sfile>:p:h') . '/bundle/my_systemverilog'
    exe 'set runtimepath^=' . expand('<sfile>:p:h') . '/bundle/my_vhdl'
endif

syntax on
filetype plugin indent on

runtime my_commands.vim

" Fonts
" Use different font on different platforms
if has("gui_running")
    if has("gui_gtk2")
        if isdirectory($HOME."/.fonts/powerline-fonts/Hack/")
            " Use Hack font if available
            set guifont=Hack\ 10
        else
            " Otherwise use courier
            set guifont=Courier\ 10\ Pitch\ 11
        endif
        "set guifont=Monospace\ 10
    elseif has("x11")
        set guifont=-misc-fixed-medium-r-semicondensed-*-*-120-*-*-c-*-iso8859-8,-misc-fixed-medium-r-semicondensed-*-*-120-*-*-c-*-iso8859-1
    elseif has("win32")
        set guifont=Lucida_Console:h9:cANSI:qDRAFT
    else
        set guifont=Courier:h9:cANSI
    endif
endif


" Color
colorscheme mydarkblue


" Configuration
set textwidth=0     " Text width (A longer line will be broken after white space. 0 means disabled)
set tabstop=8       " Number of spaces that a <Tab> in the file counts for (!!! do not modify this !!!)
set softtabstop=4   " Number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
set expandtab       " Convert tab into spaces
set showtabline=1   " Show tabs (0: do not show tabs; 1: show tabs only if present; 2: always show tabs)
set scrolloff=1     " Start to scroll text when cursor reaches n lines from border
set laststatus=2    " show status line (0: never; 1: if more than one window; 2: always)
set columns=130     " Editor width
set nowrap          " Wrap long lines
set number          " Show line numbers
set hlsearch        " Highlight search patterns

set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching

set encoding=utf-8   " Set character encoding
" encoding=utf-8 is required by powerline when gvim is started from inside certain applications (Eg. vmanager)

" Folding
set foldmethod=marker
set foldcolumn=3


" Show orizontal slide bar
setlocal guioptions+=b

" Window title
set titlestring=%t\ %M\ %<(%F)\ -\ %{v:servername}
"set titlestring=%t\ %M\ %<(%{expand(\"%:~:h\")})
"set titlestring=%t\ %m\ %r


" The following line enables virtualedit in block mode to edit several lines
" beyond the last character when the editor is in block mode
set virtualedit+=block,onemore


" create and configure directories for backup, swap and undo files
if has('unix')
    if !isdirectory($HOME."/.vim-tmp/undo")
        if exists("*mkdir")
            echo "Created ~/.vim-tmp and ~/.vim-tmp/undo"
            call mkdir($HOME."/.vim-tmp/undo", "p")
        else
            echo "Please create directories ~/.vim-tmp and ~/.vim-tmp/undo"
        endif
    endif

    " Set directory for swap files
    set directory=~/.vim-tmp
    " Set directory for backup files
    set backupdir=~/.vim-tmp
    " Activate backup (default is off)
    set backup

    " Set directory for persistent undo
    if has("persistent_undo")
        set undodir=~/.vim-tmp/undo
        set undofile
    endif

endif

" configure for backup, swap and undo files
if has('win32')
    " Set directory for swap files
    set directory=$HOMEDRIVE\$HOMEPATH\vim-tmp
    " Set directory for backup files
    set backupdir=$HOMEDRIVE\$HOMEPATH\vim-tmp
    " Activate backup (default is off)
    set backup

    " Set directory for persistent undo
    if has("persistent_undo")
        set undodir=$HOMEDRIVE\$HOMEPATH\vim-tmp\undo
        set undofile
    endif
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" Load plugins configuration
runtime my_plugin_cfg.vim
" Load Menu
runtime my_menu.vim

