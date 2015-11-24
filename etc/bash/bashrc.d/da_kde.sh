#
# Data Arena KDE4 Settings for all Shells - Terminal & Non-Terminal
#

#
# $KDEHOME
#
# Set the top-level KDEHOME directory to be specific to this host
#
# ie KDEHOME = ~/.kde4.solo   instead of ~/.kde4
#
# Instead of the usual ~/.kde4 which means there is one set of display-settings 
# for all hosts, now users have a seperate set for each different DA host.
# If the user wants a common set, then they can use ~/.kde4 and make links from
# their host-specific dir to this common one.  eg:
#
# $ cd
# $ ln -s ~/.kde/env/thing.sh ~/.kde4.solo/env/thing.sh
#
#
# DISCUSSION:
# We *could* test for the existence of this host-specific file and fall back
# to a plain .kde4 if it does not exist, but then we will make no progress in
# having different settings for different machines. Just not sure..
# Perhaps the best thing would be to prompt user in this case and ASK.
# but this is hard to do when KDE hasn't started!!  :) hmmm. 
# so. make a choice. make the hostfile, and err that way. [ben 27Jan15]
#

# OK. Changed this to test for the existence of ~/.kde4.<hostname>
# and otherwise use ~/.kde4  [ben 28Jan15]

#
# agh! "$USER_HOST_KDE_DIR" doesn't expand properly. "-d" test fails!
# Use explicit hostname call twice for now. [ben 28Jan15]
#
### USER_HOST_KDE_DIR="~/.kde4.`/bin/hostname -s`"     

if [ -d ~/.kde4.`/bin/hostname -s` ]; then
	export KDEHOME=~/.kde4.`/bin/hostname -s`
else
	export KDEHOME="~/.kde4"
fi
# echo KDEHOME is $KDEHOME


# /root is local to every host anyway, so this probably isn't needed.
# and certainly a hostname-suffix to .kde4 is not needed.
export KDEROOTHOME="/root/.kde4"


