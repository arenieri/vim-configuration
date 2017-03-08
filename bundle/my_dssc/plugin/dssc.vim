" DesignSync Commands
"

" Skip this plugin in Windows
if has('win32')
    finish
endif

if exists('loaded_dssc')
    finish
endif
let loaded_dssc=1

if v:version < 700
    finish
endif

" Specify that the shell used to execute commands (with :!{cmd}) is
" tcsh started in fast mode
"set shell=/bin/tcsh
set shellcmdflag=-fc

"let s:module_cmd = "cad modules; module load sync;"
let s:module_cmd = ""

function s:DSSCcommand(cmd_opt)
    " get the full path of the current buffer
    let this_buf_filename = expand("%:p")
    " build the command
    let dssc_cmd = "dssc ".a:cmd_opt." ".this_buf_filename
    exec "! ".s:module_cmd." ".dssc_cmd
endfunction

function s:DSSCcommand_chmod_w(cmd_opt)
    " Execute a dssc command followed by a chmod u+w
    call s:DSSCcommand(a:cmd_opt)
    let lnx_cmd = "chmod u+w ".expand("%:p")
    exec "! ".lnx_cmd
endfunction

" Commands for file based environment
command DSSCget     call s:DSSCcommand_chmod_w("co -get -nocomment")
command DSSClock    call s:DSSCcommand("co -lock -nocomment")
command DSSCmerge   call s:DSSCcommand("co -merge")
command DSSCci      call s:DSSCcommand("ci")

" Commands for module based environment
command DSSCmodget     call s:DSSCcommand_chmod_w("pop -get -unify")
command DSSCmodmerge   call s:DSSCcommand("pop -merge")
command DSSCmodlock    call s:DSSCcommand("pop -lock")
command DSSCmodci      call s:DSSCcommand("ci -nonew -iflock")



" Commands valid in both module and non module environment
command DSSCls              call s:DSSCcommand("ls -report status")
command DSSClstags          call s:DSSCcommand("ls -report PRGSUV")
command DSSCvhist           call s:DSSCcommand("vhist -report verbose+G")
command DSSCdiff            call s:DSSCcommand("diff")
command DSSCdiffgui         call s:DSSCcommand("diff -gui")
command DSSCdiffLatest      call s:DSSCcommand("diff -version Latest")
command DSSCdiffLatestgui   call s:DSSCcommand("diff -version Latest -gui")

command DSSCcancel          call s:DSSCcommand("cancel")
command DSSCcancelforce     call s:DSSCcommand("cancel -force")
command DSSCpopunify        call s:DSSCcommand("pop -unify")
command DSSCpopunifyforce   call s:DSSCcommand("pop -unify -force")



amenu DSSC.File.get             :DSSCget<CR>
amenu DSSC.File.lock            :DSSClock<CR>
amenu DSSC.File.merge           :DSSCmerge<CR>
amenu DSSC.File.commit          :DSSCci<CR>

amenu DSSC.module\ get          :DSSCmodget<CR>
amenu DSSC.module\ merge        :DSSCmodmerge<CR>
amenu DSSC.module\ lock         :DSSCmodlock<CR>
amenu DSSC.module\ commit       :DSSCmodci<CR>

amenu DSSC.-sep1-               :
amenu DSSC.ls                   :DSSCls<CR>
amenu DSSC.ls\ tags             :DSSClstags<CR>
amenu DSSC.vhist                :DSSCvhist<CR>
"amenu DSSC.diff                 :DSSCdiff<CR>
amenu DSSC.diff\ gui            :DSSCdiffgui<CR>
"amenu DSSC.diff\ Latest         :DSSCdiffLatest<CR>
"amenu DSSC.diff\ Latest\ gui    :DSSCdiffLatestgui<CR>

amenu DSSC.-sep2-           :
amenu DSSC.cancel           :DSSCcancel<CR>
amenu DSSC.cancel\ -force   :DSSCcancelforce<CR>

amenu DSSC.-sep3-           :
amenu DSSC.pop\ -unify      :DSSCpopunify<CR>
amenu DSSC.pop\ -unify\ -force  :DSSCpopunifyforce<CR>

