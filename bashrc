# =============================================================================
# bash shell init
# -----------------------------------------------------------------------------

source "$HOME/.dots/shell/common/aliases.sh"
source "$HOME/.dots/shell/common/paths.sh"
source "$HOME/.dots/shell/common/colors.sh"
source "$HOME/.dots/shell/common/functions.sh"
source "$HOME/.dots/shell/bash/prompt.sh"

export EDITOR=vim

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# Enable globstar "**" pattern. This is similar to `*` but matches all files
# in subdirectories recursively.
# See: https://www.linuxjournal.com/content/globstar-new-bash-globbing-option
shopt -s globstar

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
  source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

# Local bashrc
if [ -f "$HOME/.bashrc_local" ]; then
  source "$HOME/.bashrc_local"
fi

$HOME/.bin/begin
