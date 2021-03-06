# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Source the Data Arena bashrc files in /etc/bash/bashrc.d/
if [ -d /etc/bash/bashrc.d ]; then
    for sh in /etc/bash/bashrc.d/*.sh ; do
        [ -r "$sh" ] && . "$sh"
    done
fi
unset sh

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

# adding gitlab deploy keys
if [ -f $HOME/.ssh/id_rsa_gitlab_deploy -a -x /usr/bin/keychain ]; then
    ssh-add $HOME/.ssh/id_rsa_gitlab_deploy &> /dev/null
fi