#
# Data Arena Global Exports for - Terminal & Non-Terminal Shells
#
# These are environment variables consider useful for all users
#
# Note: unlike ../profile.d/da_exports.sh 
# settings here are available in shells without an attached terminal.
# (eg. "survey ls" runs 'ls' on a remote host in a non-terminal shell)
# Settings set here will be seen in such a shell. [ben 10Nov14]
#

# Set the Data Arena Hostname
export DA_HOST=`/bin/hostname -s`

# Set DA_IG_NUM if this host is an image generator (ig)
case $DA_HOST in
	ig*)
		export DA_IG_NUM=`echo $DA_HOST|sed -e 's/ig//'`
		;;
esac


# Data directory for OpenSceneGraph examples
# [Darren 22May14]
## Removed [Darren 3Aug15]
##export OSG_FILE_PATH=/da/sw/osg/OpenSceneGraph-Data


# Set definitions file for bc(1)
if [ -f $HOME/etc/bc.defs ]; then
	export BC_ENV_ARGS=$HOME/etc/bc.defs
fi



