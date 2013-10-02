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

source $ZSH/oh-my-zsh.sh

source ~/.zshrc_local

# Use vim as a pager
alias va="vim -u ~/.vimrc.more"

# Set editor and path
export EDITOR=vi

# Disable correction
unsetopt correctall

# Additional path stuff.
source ~/lib/paths.sh

# Set less variables to provide colored man pages.
source ~/lib/man-colors.sh

# Color value constants
source ~/lib/colors.sh
 
# colored maven output
source ~/lib/mvn-color.sh

# zsh live syntax coloring
source ~/lib/live-command-coloring.zsh

~/bin/begin
