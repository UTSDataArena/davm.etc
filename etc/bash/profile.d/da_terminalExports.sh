#
# Data Arena Terminal (only) Exports - for Shells with attached terminals
#
# These are enviroment variables consider useful for all users
#
# WARNING: Variables set here are NOT set in a non-terminal session.
#
#   eg. if you
#	export THING=blah
#   here, then
#	survey -a 'echo $THING'
#   will return ""
#
# If you want the variable also set for non-terminal shells,
# then set it in ../bashrc.d/da_exports.sh instead! 
# [ben 10Nov14]
#

# Set Good Less Settings for here
export LESS="-R -X --quit-if-one-screen --quit-at-eof"



