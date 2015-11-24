#!/bin/bash
#
# Data Arena File Paths
#
# Add additional directories which everyone should know
# Uses pathappend() defined in: 01_helperFunctions.sh
# Directories on seperate lines are easier to manage, but look out
# for the trailing " on a line by itself at the end of each list.
# [ben 13Feb14]
#

## echo Set paths

# Adding omegalib paths
# [Darren 10Apr14]
#
# Order is important, as it would otherwise find the wrong build of osg

## Moving equalizer includes to a symlink
## [Darren 8May14]

## Added paths to /da/sw/osg
## [Darren 22May14]

## osg now in /da/sw/osg/install
## omegalib symlink is /da/sw/omegalib/bin now links to /da/sw/omegalib/install/omegalib/bin
## Added osg-related paths
## [Darren 27May14]

## removing the omegalib paths, since we are using a wrapper to set them when different
## versions are running now
## [Darren 4Jul14]

#
# Add these directories to the front, or the end, of the Standard Data Arena User PATH
# Files in directories at the front are favoured to any that appear later.
# "first in best dressed". Look out the the trailing quote-char on it's own line!
# the: "
# 
# Also - paths in the PATH_PRE_LIST are pre-pended one at a time, so end up appearing
# in the PATH in the reverse order listed below..
#
##PATH_PRE_LIST="\
##/opt/vmware/bin	\
##/da/sw/equalizer/bin \
##/usr/local/bin \
##/mnt/central/bin \
PATH_PRE_LIST="\
$HOME/bin \
"

##PATH_POST_LIST="\
##/usr/lib64/misc/xscreensaver \
##/opt/bin \
##/opt/visit/bin \
##/da/sw/osg/install/bin \
##/da/demo/bin \
##/da/bin
PATH_POST_LIST="\
/local/omegalib/install/omegalib/bin \
"
# was before /da/sw/osg/install/bin:
# /da/sw/omegalib/bin

# add to front of PATH
for P in $PATH_PRE_LIST ; do
	if [ -d $P ]; then
		pathprepend $P
	fi
done

# add to end of PATH
for P in $PATH_POST_LIST ; do
	if [ -d $P ]; then
		pathappend $P
	fi
done


# - - - - - - - - - - - - - - - - - - - - - - - - - - -

#
# Define LD_LIBRARY_PATH
#
# put /usr/local/ in front, so any lib there will override [ben 7Apr15]
#
##LD_PATH_LIST="\
##/usr/local/lib \
##/usr/local/lib64 \
##/lib \
##/lib64 \
##/usr/lib \
##/usr/lib64 \
##/usr/lib64/opengl/xorg-x11/lib \
LD_PATH_LIST="\
/local/omegalib/install/omegalib/bin \
/local/omegalib/install/omegalib/bin/osgPlugins-3.3.8 \
"
#/da/sw/equalizer/lib \
#"
# was before /da/sw/osg/install/lib:
# /da/sw/omegalib/bin \
# /da/sw/omegalib/bin/osg \
# /da/sw/omegalib/bin/osg/osgPlugins-3.3.0 \

# before equalizer/lib
# /da/sw/osg/install/lib \
# /da/sw/osg/install/lib/osgPlugins-3.3.1 \

# append dirs to LD_LIBRARY_PATH
for P in $LD_PATH_LIST ; do
	if [ -d $P ]; then
		# note: pathappend is to "LD_LIBRARY_PATH" not "$LD_LIBRARY_PATH"
		pathappend $P LD_LIBRARY_PATH
	fi
done

## Additional OSG paths:
##OSG_FILE_PATH=/da/sw/osg/OpenSceneGraph-Data
##OSG_ROOT=/da/sw/osg/install/


# - - - - - - - - - - - - - - - - - - - - - - - - - - -

