. ~/lib/sh/paths.sh

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

. $HOME/lib/sh/aliases.sh
. $HOME/lib/sh/paths.sh
. $HOME/lib/sh/ant-colors.sh
. $HOME/lib/sh/man-colors.sh

case $TERM in
  screen-256color|xterm|xterm-256color)
    . $HOME/lib/sh/colors.sh
    . $HOME/lib/sh/mvn-color.sh
    . $HOME/lib/base16-shell/base16-ocean.dark.sh
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f $HOME/.bashrc_local ]; then
    . $HOME/.bashrc_local
fi

$HOME/bin/begin
