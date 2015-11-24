#
# Data Arena Functions
#

#
# cd which puts previous directories onto a stack.
# the alias "po" pops you back to previous dir.
#
# Do not define this function unless we are in an interactive Shell.
# as the pushd produces output, which is bad for non-interactive shells.
# (interactive shells have $PS1 defined)
#
if [[ -n "$PS1" ]]; then
	function cd() {
	    if [ -z "$1" ]
	    then
		pushd ~
	    else
		pushd "$*"
	    fi
	}
	alias po="popd"
fi

#
# long ls
#
function l()   {
    /bin/ls -la --color=auto $*
}

#
# long ls piped into less
#
function ll()  {
    /bin/ls -la --color=auto $* | less
}

function lls() {
    /bin/ls -Sla --color=auto $* | less
}

function lth()  {
    /bin/ls -t --color=auto $* | head
}

#
# Umm will find files, based on a partial filename provided.
# eg. try "umm sh"
#
function umm() {
    find . \( -type f -o -type d -o -type l \) -iname "*${1}*" -print 2> /dev/null | grep -i --color $1
}

#
# proc will grep ps(1) and return the match in colour
#
## function proc() {
##    ps -ef | /bin/grep -v grep | grep -v "bash -c proc" | /bin/grep -i --color "$*"
##}
#
# change '-ef' common flag to include 'ni' (niceness priority)
# therefore need to explicitly list all other args, via '-o' [ben 23Mar15]
#
function proc() {
    ps -eo user,pid,ppid,pgrp,priority,ni,state,tname,time,cmd | /bin/grep -v grep | grep -v "bash -c proc" | /bin/grep -i --color "$*"
}

