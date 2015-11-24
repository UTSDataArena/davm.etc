#!/bin/bash
#
# Data Arena Helper Functions 
#
# (named '01*' so it will load first)
# Based on some neat functions found here:
# http://www.linuxfromscratch.org/blfs/view/svn/postlfs/profile.html
#
# pathappend() etc won't add the dir if it's already in the PATH.
# You can pass a 2nd arg which is the path, so it can be used to
# update LD_LIBRARY_PATH too!
#
# Note: If you want to update $LD_LIBRARY_PATH then don't spec the '$'
# in the function call. it's just "LD_LIBRARY_PATH", eg: 
#
#	pathappend /blah/dir/thing LD_LIBRARY_PATH
#
# [ben 13Feb14]
#

# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)
pathremove () {
        local IFS=':'
        local NEWPATH
        local DIR
        local PATHVARIABLE=${2:-PATH}
        for DIR in ${!PATHVARIABLE} ; do
                if [ "$DIR" != "$1" ] ; then
                  NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
                fi
        done
        export $PATHVARIABLE="$NEWPATH"
}

pathprepend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
}

pathappend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
}

