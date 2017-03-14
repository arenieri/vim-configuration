To Start
- Copy this minimal vimrc in ~/.vim/vimrc

    " Load vim-plug
    if empty(glob("~/.vim/autoload/plug.vim"))
        execute '!curl -kfLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    endif

    " install plugins using vim-plug
    call plug#begin('~/.vim/plugged')
        Plug 'arenieri/vim-configuration'
    call plug#end()

    " source main configuration file 
    " The file is located in vim-configuration
    runtime my_config.vim

- start gvim and type :PlugInstall

- additional plugins can be found in 
    ~/.vim/plugged/vim-configuration/vimrc

- Use the following command to install/update/remove plugins
    :PlugInstall
    :PlugUpdate
    :PlugClean
    
    Additional info at https://github.com/junegunn/vim-plug

- To install powerline/airline fonts (Optional)
    mkdir ~/.fonts
    cd ~/.fonts
    git clone git://github.com/Lokaltog/powerline-fonts.git


NOTE: If you are behind a firewall you could need to disable SSL verification.
To do this simply add to ~/.gitconfig the following section

[http]
        sslVerify = false


=============================================================
.gitconfig example
This file is intended to be in ~ directory

[user]
	name = Alessandro Renieri
	email = my.email@gmail.com
[core]
	editor = `which gvim` -f
[push]
        default = simple

; HTTP
[http]
        sslVerify = false

