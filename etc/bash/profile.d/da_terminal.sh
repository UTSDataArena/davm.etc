#
# Data Arena Terminal Settings
#
# These are terminal settings considered useful for all users
#

# Turn off beeps in the terminal (esp virtual terminals)
# - only set this if we are in an interactive shell ($TERM is defined)
if [[ "x$TERM" != "x" ]]; then
	if [[ "$TERM" != "screen-256color" && "$TERM" != "xterm-256color" && "$TERM" != "xterm" ]]; then
		setterm -blength 0
	fi
fi


