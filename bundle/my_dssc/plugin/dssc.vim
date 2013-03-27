" DesignSync Commands
"
if exists('loaded_dssc')
    finish
endif
let loaded_dssc=1

if v:version < 700
    finish
endif

let s:module_cmd = "cad modules; module load sync;"

function s:DSSCcommand(cmd_opt)
    " get the full path of the current buffer
    let this_buf_filename = expand("%:p")
    " build the command
    let dssc_cmd = "dssc ".a:cmd_opt." ".this_buf_filename
    exec "! ".s:module_cmd." ".dssc_cmd
endfunction


command DSSCget     call s:DSSCcommand("co -get -nocomment")
command DSSClock    call s:DSSCcommand("co -lock -nocomment")
command DSSCmerge   call s:DSSCcommand("co -merge")
command DSSCci      call s:DSSCcommand("ci")

command DSSCls      call s:DSSCcommand("ls -report status")
command DSSCvhist   call s:DSSCcommand("vhist")
command DSSCdiff    call s:DSSCcommand("diff")

command DSSCcancel          call s:DSSCcommand("cancel")
command DSSCcancelforce     call s:DSSCcommand("cancel -force")
command DSSCpopunify        call s:DSSCcommand("pop -unify")
command DSSCpopunifyforce   call s:DSSCcommand("pop -unify -force")



amenu DSSC.get              :DSSCget<CR>
amenu DSSC.lock             :DSSClock<CR>
amenu DSSC.merge            :DSSCmerge<CR>
amenu DSSC.commit           :DSSCci<CR>

amenu DSSC.-sep1-           :
amenu DSSC.ls               :DSSCls<CR>
amenu DSSC.vhist            :DSSCvhist<CR>
amenu DSSC.diff             :DSSCdiff<CR>

amenu DSSC.-sep2-           :
amenu DSSC.cancel           :DSSCcancel<CR>
amenu DSSC.cancel\ -force   :DSSCcancelforce<CR>

amenu DSSC.-sep3-           :
amenu DSSC.pop\ -unify      :DSSCpopunify<CR>
amenu DSSC.pop\ -unify\ -force  :DSSCpopunifyforce<CR>

