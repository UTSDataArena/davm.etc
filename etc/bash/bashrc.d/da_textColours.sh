#
# Data Arena Text Colour Settings
#

## echo set Textcolours

# This file is sourced by all *interactive* bash shells on startup.  This
# file *should generate no output* or it will break the scp and rcp commands.
# Just set variables here.

# colors for ls, etc.
if [ -f /etc/DIR_COLORS ]; then
        eval `/usr/bin/dircolors -b /etc/DIR_COLORS`
        alias d="ls --color"
fi

# 
# if [ -e /usr/share/terminfo/x/xterm-256color ]; then
#         export TERM='xterm-256color'
# else
# 	export TERM='xterm-color'
# fi

# If $TERM is defined, change the window title of X terminals 
if [[ "x$TERM" != "x" ]]; then
	case $TERM in
		xterm*|rxvt|Eterm|eterm|screen*)
			PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
			;;
		## screen*)
			## PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
			## ;;
		linux)
			unset PROMPT_COMMAND
			;;
	esac
fi

#
# Command Prompts
# http://stackoverflow.com/questions/10594786/bash-prompt-history-issue
#
# Color		Code
# Black		0;30
# Red		0;31
# Green		0;32
# Brown		0;33
# Blue		0;34
# Purple	0;35
# Cyan		0;36
# 
# Replace digit 0 with 1 to get light color version.
#
## export PS1="\e[1;33m\u@\h \w \$ \e[m"
#
case `/bin/hostname -s` in
	da-dev*)
		export PS1='\[\e[1;32m\]\w \$ \[\e[m\]'
		export PS2='\[\e[1;32m\] > \[\e[m\]'
		;;
	central)
		export PS1='\[\e[1;31m\]\w \$ \[\e[m\]'
		export PS2='\[\e[1;31m\] > \[\e[m\]'
		;;
	solo)
		export PS1='\[\e[1;33m\]\w \$ \[\e[m\]'
		export PS2='\[\e[1;33m\] > \[\e[m\]'
		;;
	*)
		export PS1='\[\e[1;34m\]\w \$ \[\e[m\]'
		export PS2='\[\e[1;34m\] > \[\e[m\]'
		;;
esac


#
# Change highlights from italics back to reverse video
#
# http://stackoverflow.com/questions/10535432/tmux-man-page-search-highlighting
# [ben 5May14]
#
# Colored man pages: http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline


