# Use vim as a pager
alias va="vim -u ~/.vimrc.more"

# Set editor and path
export EDITOR=vi

# Disable correction
unsetopt correctall

source $HOME/lib/sh/aliases.sh
source $HOME/lib/sh/paths.sh
source $HOME/lib/sh/man-colors.sh
source $HOME/lib/sh/ant-colors.sh

source $HOME/lib/zsh/live-command-coloring.zsh

case $TERM in
  screen-256color|xterm|xterm-256color)
    source $HOME/lib/sh/colors.sh
    source $HOME/lib/sh/mvn-color.sh
    source $HOME/lib/base16-shell/base16-ocean.dark.sh
    ;;
esac

$HOME/bin/begin
