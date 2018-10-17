#
# Data Arena config for Houdini
#

export OLD_PS1=$PS1
# define henv

function set_henv() {
        #
        # Choose which version of Houdini to source (or default to latest)
        #
        case $1 in
        16*)
                # Houdini 16
                HOUDINI_INSTALL_LOCATION=/opt/hfs16.5.536
                ;;
        *)
                # Default Latest Version
                # HOUDINI_INSTALL_LOCATION=/opt/hfs14.0.359
                Latest=`( ls -1d /opt/hfs* 2> /dev/null || echo none ) | tail -n1`
                if [[ "$Latest" == "none" ]]
                then
                    echo "No versions of Houdini found in /opt."
                    unset Latest
                    return
                else
                    HOUDINI_INSTALL_LOCATION=$Latest
                    unset Latest
                fi
                ;;
        esac

        #
        # Do it. cd to the install-dir, source it, and return.
        #
        CurrentDirectory=`pwd`
        command cd $HOUDINI_INSTALL_LOCATION
        source houdini_setup_bash
        command cd $CurrentDirectory
        unset CurrentDirectory
}

function henv() {
    set_henv $*;
    PS1="\[\e[0;31m\](H ${HFS#/opt/hfs}) $OLD_PS1"
}
