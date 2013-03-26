#! /bin/tcsh -f

set LIST = "others git-bundle"

foreach L  ($LIST)
    pushd $L

    foreach pluginDir (*)
        if (! -d $pluginDir) then
            # if it is not a dir go to nex element
            continue
        endif
        pushd $pluginDir
        git pull
        popd
    end
    popd
end




