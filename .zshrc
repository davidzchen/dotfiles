# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="menage"

# Example aliases
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial github gnu-utils history-substring-search)

if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
fi

if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi

# Use vim as a pager
alias va="vim -u ~/.vimrc.more"

# Set editor and path
export EDITOR=vi

# Disable correction
unsetopt correctall

# Additional path stuff.
if [ -f ~/lib/sh/paths.sh ]; then
  source ~/lib/sh/paths.sh
fi

# Set less variables to provide colored man pages.
if [ -f ~/lib/sh/man-colors.sh ]; then
  source ~/lib/sh/man-colors.sh
fi

# Color value constants
if [ -f ~/lib/sh/colors.sh ]; then
  source ~/lib/sh/colors.sh
fi

# colored maven output
if [ -f ~/lib/sh/mvn-color.sh ]; then
  source ~/lib/sh/mvn-color.sh
fi

# colored ant output
if [ -f ~/lib/sh/ant-colors.sh ]; then
  source ~/lib/sh/ant-colors.sh
fi

# zsh live syntax coloring
if [ -f ~/lib/zsh/live-command-coloring.zsh ]; then
  source ~/lib/zsh/live-command-coloring.zsh
fi

if [ -s ~/lib/base16-shell/base16-ocean.dark.sh ]; then
  . ~/lib/base16-shell/base16-ocean.dark.sh
fi

~/bin/begin
