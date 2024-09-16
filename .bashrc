# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=10000

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Bash functions

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#######################################################
# Set the ultimate amazing command prompt
#######################################################

alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"
function __setprompt
{
        local LAST_COMMAND=$? # Must come first!

        # Define colors
        local LIGHTGRAY="\033[0;37m"
        local WHITE="\033[1;37m"
        local BLACK="\033[0;30m"
        local DARKGRAY="\033[1;30m"
        local RED="\033[0;31m"
        local LIGHTRED="\033[1;31m"
        local GREEN="\033[0;32m"
        local LIGHTGREEN="\033[1;32m"
        local BROWN="\033[0;33m"
        local YELLOW="\033[1;33m"
        local BLUE="\033[0;34m"
        local LIGHTBLUE="\033[1;34m"
        local MAGENTA="\033[0;35m"
        local LIGHTMAGENTA="\033[1;35m"
        local CYAN="\033[0;36m"
        local LIGHTCYAN="\033[1;36m"
        local NOCOLOR="\033[0m"

        # Show error exit code if there is one
        if [[ $LAST_COMMAND != 0 ]]; then
                # PS1="\[${RED}\](\[${LIGHTRED}\]ERROR\[${RED}\])-(\[${LIGHTRED}\]Exit Code \[${WHITE}\]${LAST_COMMAND}\[${RED}\])-(\[${LIGHTRED}\]"
                PS1="\[${DARKGRAY}\](\[${LIGHTRED}\]ERROR\[${DARKGRAY}\])-(\[${RED}\]Exit Code \[${LIGHTRED}\]${LAST_COMMAND}\[${DARKGRAY}\])-(\[${RED}\]"
                if [[ $LAST_COMMAND == 1 ]]; then
                        PS1+="General error"
                elif [ $LAST_COMMAND == 2 ]; then
                        PS1+="Missing keyword, command, or permission problem"
                elif [ $LAST_COMMAND == 126 ]; then
                        PS1+="Permission problem or command is not an executable"
                elif [ $LAST_COMMAND == 127 ]; then
                        PS1+="Command not found"
                elif [ $LAST_COMMAND == 128 ]; then
                        PS1+="Invalid argument to exit"
                elif [ $LAST_COMMAND == 129 ]; then
                        PS1+="Fatal error signal 1"
                elif [ $LAST_COMMAND == 130 ]; then
                        PS1+="Script terminated by Control-C"
                elif [ $LAST_COMMAND == 131 ]; then
                        PS1+="Fatal error signal 3"
                elif [ $LAST_COMMAND == 132 ]; then
                        PS1+="Fatal error signal 4"
                elif [ $LAST_COMMAND == 133 ]; then
                        PS1+="Fatal error signal 5"
                elif [ $LAST_COMMAND == 134 ]; then
                        PS1+="Fatal error signal 6"
                elif [ $LAST_COMMAND == 135 ]; then
                        PS1+="Fatal error signal 7"
                elif [ $LAST_COMMAND == 136 ]; then
                        PS1+="Fatal error signal 8"
                elif [ $LAST_COMMAND == 137 ]; then
                        PS1+="Fatal error signal 9"
                elif [ $LAST_COMMAND -gt 255 ]; then
                        PS1+="Exit status out of range"
                else
                        PS1+="Unknown error code"
                fi
                PS1+="\[${DARKGRAY}\])\[${NOCOLOR}\]\n"
        else
                PS1=""
        fi

        # Date
        PS1+="\[${DARKGRAY}\](\[${CYAN}\]\$(date +%a) $(date +%b-'%-m')" # Date
        PS1+="${BLUE} $(date +'%-I':%M:%S%P)\[${DARKGRAY}\])-" # Time

        # CPU
        PS1+="(\[${MAGENTA}\]CPU $(cpu)%"

        # Jobs
        PS1+="\[${DARKGRAY}\]:\[${MAGENTA}\]\j"

        # Network Connections (for a server - comment out for non-server)
        PS1+="\[${DARKGRAY}\]:\[${MAGENTA}\]Net $(awk 'END {print NR}' /proc/net/tcp)"

        PS1+="\[${DARKGRAY}\])-"

        # User and server
        local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
        local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
        if [ $SSH2_IP ] || [ $SSH_IP ] ; then
                PS1+="(\[${RED}\]\u@\h"
        else
                PS1+="(\[${RED}\]\u"
        fi

        # Current directory
        PS1+="\[${DARKGRAY}\]:\[${BROWN}\]\w\[${DARKGRAY}\])-"

        # Total size of files in current directory
        PS1+="(\[${GREEN}\]$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')\[${DARKGRAY}\]:"

        # Number of files
        PS1+="\[${GREEN}\]\$(/bin/ls -A -1 | /usr/bin/wc -l)\[${DARKGRAY}\])"

        # Skip to the next line
        PS1+="\n"

        if [[ $EUID -ne 0 ]]; then
                PS1+="\[${GREEN}\]>\[${NOCOLOR}\] " # Normal user
        else
                PS1+="\[${RED}\]>\[${NOCOLOR}\] " # Root user
        fi

        # PS2 is used to continue a command using the \ character
        PS2="\[${DARKGRAY}\]>\[${NOCOLOR}\] "

        # PS3 is used to enter a number choice in a script
        PS3='Please enter a number from above list: '

        # PS4 is used for tracing a script in debug mode
        PS4='\[${DARKGRAY}\]+\[${NOCOLOR}\] '
}
PROMPT_COMMAND='__setprompt'
