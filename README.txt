- To download the basic scripts
    git clone git://github.com/arenieri/vim-configuration.git

- To install all plugins run
    git-clone.csh

- To update all plugins run
    git-pull.csh

- To install powerline/airline fonts
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

