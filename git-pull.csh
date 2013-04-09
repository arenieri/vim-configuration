#! /bin/tcsh -f

set LIST = "others git-bundle"

foreach L  ($LIST)
    echo "============================================================"
    echo "Updating plugins in $L"
    pushd $L > /dev/null

    foreach pluginDir (*)
        if (! -d $pluginDir) then
            # if it is not a dir go to nex element
            continue
        endif
        echo "------------------------------------------------------------"
        echo "Updating $pluginDir"
        pushd $pluginDir > /dev/null
        git pull
        popd > /dev/null
    end
    popd > /dev/null
end




