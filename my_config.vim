"configuration file to be sourced in .vimrc with
" runtime my_config.vim

set nocompatible
runtime mswin.vim
behave mswin

" Add some additional package to runtimepath
"exe 'set runtimepath^=' . expand('<sfile>:p:h') . '/bundle/my_dssc'
exe 'set runtimepath^=' . expand('<sfile>:p:h') . '/bundle/my_systemverilog'
exe 'set runtimepath^=' . expand('<sfile>:p:h') . '/bundle/my_vhdl'

if version < 800
    " in givim 7.x the ftdetect file needs to be sourced explicitly
    exe 'source ' . expand('<sfile>:p:h') . '/bundle/my_systemverilog/ftdetect/systemverilog.vim'
endif

" Add Matchit package
if version < 800
    " gvim version 7.x and below
    runtime! macros/matchit.vim
else
    " gvim version 8.x and above
    packadd! matchit
endif

syntax on
filetype plugin indent on

runtime my_commands.vim

" Fonts
" Use different font on different platforms
if has("gui_running")
    if has("gui_gtk2")
        if isdirectory($HOME."/.fonts/HackNerd/")
            " Use Hack Nerd font if available
            set guifont=Hack\ Nerd\ Font\ 10
            " Enable powerline fonts
            let g:airline_powerline_fonts = 1
        elseif isdirectory($HOME."/.fonts/Hack0/")
            " Use Hack font if available
            set guifont=Hack0\ 10
            " Enable powerline fonts
            let g:airline_powerline_fonts = 1
        else
            " Otherwise use courier
            set guifont=Courier\ 10\ Pitch\ 11
        endif
    elseif has("gui_macvim")
        "set guifont=Menlo\ Regular:h11
        "set guifont=Hack0\ Regular:h11
        set guifont=HackNerdFontComplete-Regular:h11
        let g:airline_powerline_fonts = 1
    elseif has("win32")
        set guifont=Consolas:h9:cANSI:qDRAFT
    elseif has("x11")
        set guifont=-misc-fixed-medium-r-semicondensed-*-*-120-*-*-c-*-iso8859-8,-misc-fixed-medium-r-semicondensed-*-*-120-*-*-c-*-iso8859-1
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

    " 'backup' 'writebackup'    action
    "  off      off             no backup made
    "  off      on              backup current file, deleted afterwards (default)
    "  on       off             delete old backup, backup current file
    "  on       on              delete old backup, backup current file
    " Activate backup only while editing
    "set nobackup
    "set writebackup

    " If vim is compiled with persistent undo option
    if has("persistent_undo")
        " Set directory for persistent undo
        set undodir=~/.vim-tmp/undo
        " Activate persistent undo
        set undofile
    endif

endif

" Configure directories for backup, swap and undo files
" Folders have to be created manually
if has('win32')
    " Set directory for swap files
    set directory=$HOMEDRIVE\$HOMEPATH\vim-tmp
    " Set directory for backup files
    set backupdir=$HOMEDRIVE\$HOMEPATH\vim-tmp

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

