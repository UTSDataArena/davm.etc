#
# Data Arena KeyChain
#
# https://wiki.gentoo.org/wiki/Keychain
#

export SSH_ASKPASS=/usr/bin/ksshaskpass

## if [ -f $HOME/.ssh/id_rsa -a -x /usr/bin/keychain ]; then

	## [ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
	## /usr/bin/keychain --quiet --agents ssh ~/.ssh/id_rsa
	## /usr/bin/keychain --agents ssh ~/.ssh/id_rsa
	## . $HOME/.keychain/$HOSTNAME-sh

	# Simpler call
	# http://www.funtoo.org/Keychain
	## eval `/usr/bin/keychain --quiet --noask --eval --agents ssh id_rsa`
 	## /usr/bin/keychain  --agents ssh id_rsa
## fi

if [ -f $HOME/.ssh/id_rsa -a -x /usr/bin/keychain ]; then
	## eval $(/usr/bin/keychain --quiet --nogui --confirm --eval --agents ssh $HOME/.ssh/id_rsa )
	## eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet $HOME/.ssh/id_rsa )
	## eval `/usr/bin/keychain --quiet --eval --agents ssh $HOME/.ssh/id_rsa`
	## eval `/usr/bin/keychain --nogui --confirm --quiet --eval --agents ssh $HOME/.ssh/id_rsa`
	## eval `/usr/bin/keychain --confirm --quiet --eval --agents ssh $HOME/.ssh/id_rsa`
	##eval `/usr/bin/keychain --eval --agents ssh $HOME/.ssh/id_rsa`
	eval `/usr/bin/keychain --quiet --eval --agents ssh $HOME/.ssh/id_rsa`
fi
