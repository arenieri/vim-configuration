# vim-configuration
## How To Start
- Copy this minimal vimrc in ~/.vim/vimrc
  ```vim
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
  ```
- The first time only:
    * start gvim -> plug.vim script will be downloaded
    * close and restart gvim 
    * type :PlugInstall

- additional plugins to customize .vimrc can be found in 
    ~/.vim/plugged/vim-configuration/vimrc

- Use the following command to install/update/remove plugins
  ```
    :PlugInstall
    :PlugUpdate
    :PlugClean
  ```
    
    if you edit vimrc to add or remove plugins you have to restart gvim and type 
    :PlugInstall/:PlugUpdate/:PlugClean to update the plugins

    Additional info at https://github.com/junegunn/vim-plug

- To install Hack0 font (Suggested)
    * Linux
      ```
        cp ˜/.vim/plugged/vim-configuration/fonts/Hack0  ˜/.fonts
      ```
    * Mac
    
        Open 'Font Book' and drag&drop files from Finder
      

- To install other powerline/airline fonts (Optional)
    * Linux
      ```
        mkdir ~/.fonts
        cd ~/.fonts
        git clone git://github.com/Lokaltog/powerline-fonts.git
      ```

## Git Configuration
NOTE: If you are behind a firewall you could need to disable SSL verification.
To do this simply add to ~/.gitconfig the following section
```ini
[http]
        sslVerify = false
```

### .gitconfig Example
This file is intended to be in ~ directory
```ini
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
```

