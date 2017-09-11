#
# Data Arena config for Troen 
#

function troen() {

        PWD=`pwd`

        command cd /local/Troen/build 
        command ./startTroen.sh
        command cd $PWD

        unset PWD 
}

