#
# Data Arena config for Houdini
#

# define henv

function henv() {
        #
        # Choose which version of Houdini to source (or default to latest)
        #
        case $1 in
        12*)
                # Houdini 12.5
                HOUDINI_INSTALL_LOCATION=/opt/hfs12.5.483
                ;;
        134*)
                # Houdini 13
                HOUDINI_INSTALL_LOCATION=/opt/hfs13.0.401
		;;
        13*)
                # Houdini 13
                # HOUDINI_INSTALL_LOCATION=/opt/hfs13.0.163
                # HOUDINI_INSTALL_LOCATION=/opt/hfs13.0.224
                # HOUDINI_INSTALL_LOCATION=/opt/hfs13.0.283
                # HOUDINI_INSTALL_LOCATION=/opt/hfs13.0.314
                # HOUDINI_INSTALL_LOCATION=/opt/hfs13.0.376
                # HOUDINI_INSTALL_LOCATION=/opt/hfs13.0.401
                HOUDINI_INSTALL_LOCATION=/opt/hfs13.0.547
                ;;
        1402)
                # Houdini 14.0.201.13
		HOUDINI_INSTALL_LOCATION=/opt/hfs14.0.201.13
		;;
        14*)
                # Houdini 14
                # HOUDINI_INSTALL_LOCATION=/opt/hfs14.0.116
                # HOUDINI_INSTALL_LOCATION=/opt/hfs14.0.132.11
                # HOUDINI_INSTALL_LOCATION=/opt/hfs14.0.132.40
                # HOUDINI_INSTALL_LOCATION=/opt/hfs14.0.201.13
                HOUDINI_INSTALL_LOCATION=/opt/hfs14.0.359
		;;
        15*)
                # Houdini 15
                # HOUDINI_INSTALL_LOCATION=/opt/hfs15.0.179.25
                HOUDINI_INSTALL_LOCATION=/opt/hfs15.0.244.16
		;;
        *)
                # Default Latest Version
                # HOUDINI_INSTALL_LOCATION=/opt/hfs12.5.483
                # HOUDINI_INSTALL_LOCATION=/opt/hfs13.0.376
                # HOUDINI_INSTALL_LOCATION=/opt/hfs13.0.401
                # HOUDINI_INSTALL_LOCATION=/opt/hfs13.0.547
                # HOUDINI_INSTALL_LOCATION=/opt/hfs14.0.116
                # HOUDINI_INSTALL_LOCATION=/opt/hfs14.0.132.11
                # HOUDINI_INSTALL_LOCATION=/opt/hfs14.0.132.40
                # HOUDINI_INSTALL_LOCATION=/opt/hfs14.0.201.13
                # HOUDINI_INSTALL_LOCATION=/opt/hfs14.0.359
                HOUDINI_INSTALL_LOCATION=/opt/hfs15.0.244.16
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

