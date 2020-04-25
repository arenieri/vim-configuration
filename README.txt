To Start
- Copy this minimal vimrc in ~/.vim/vimrc

    " Load vim-plug
    if empty(glob("~/.vim/autoload/plug.vim"))
        execute '!curl --create-dirs -kfLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    endif

    " install plugins using vim-plug
    call plug#begin('~/.vim/plugged')
        Plug 'arenieri/vim-configuration'
    call plug#end()

    " source main configuration file 
    " The file is located in vim-configuration
    runtime my_config.vim

- The first time only:
    start gvim              - plug.vim script will be downloaded
    close and restart gvim  - type :PlugInstall

- additional plugins can be found in 
    ~/.vim/plugged/vim-configuration/vimrc

- Use the following command to install/update/remove plugins
    :PlugInstall (Installs new plugins added in vimrc)
    :PlugUpdate  (Updates installed plugins)
    :PlugClean   (Removes plugins removed from vimrc)
    :PlugUpgrade (Upgrades vimplug plugin)
    
    if you edit vimrc to add or remove plugins you have to restart gvim and type 
    :PlugInstall/:PlugUpdate/:PlugClean to update the plugins

    Additional info at https://github.com/junegunn/vim-plug

- To install HackNerd font and/or Hack0 font (Suggested)
    * Linux
        cp ˜/.vim/plugged/vim-configuration/fonts/HackNerd  ˜/.fonts
    * Mac
        Open 'Font Book' and drag&drop files from Finder
      
    Information about Nerd fonts can be found here https://www.nerdfonts.com
    Information about Hack font can be found here https://sourcefoundry.org/hack/

- To install other powerline/airline fonts (Optional)
    * Linux
        mkdir ~/.fonts
        cd ~/.fonts
        git clone git://github.com/Lokaltog/powerline-fonts.git


=============================================================
NOTE: If you are behind a firewall you could need to disable SSL verification.
To do this simply add to ~/.gitconfig the following section

[http]
        sslVerify = false

=============================================================
.gitconfig example
This file is intended to be in ~ directory

[user]
	name = Your Name
	email = my.email@gmail.com
[core]
	editor = `which gvim` -f
[push]
        default = simple

; HTTP
[http]
        sslVerify = false

