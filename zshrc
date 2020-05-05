export EDITOR=vim

source $HOME/.dots/sh/aliases.sh
source $HOME/.dots/sh/paths.sh

source $HOME/.dots/zsh/antigen.zsh

DISABLE_AUTO_TITLE=true

antigen use oh-my-zsh
antigen bundle history-substring-search
antigen bundles <<EOK
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-completions
EOK
antigen theme chlorophyllin/minimal minimal-path-git-user-host
antigen apply

source $HOME/.dots/sh/man-colors.sh
source $HOME/.dots/sh/ant-colors.sh

case $TERM in
  screen-256color|xterm|xterm-256color)
    source $HOME/.dots/sh/colors.sh
    source $HOME/.dots/sh/mvn-color.sh
    ;;
esac

if [ -f $HOME/.zshrc_local ]; then
    source $HOME/.zshrc_local
fi

$HOME/.bin/begin
