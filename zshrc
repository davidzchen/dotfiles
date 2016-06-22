export EDITOR=vim

source $HOME/.lib/sh/aliases.sh
source $HOME/.lib/sh/paths.sh

source $HOME/.lib/zsh/antigen.zsh

DISABLE_AUTO_TITLE=true

antigen use oh-my-zsh
antigen bundle history-substring-search
antigen bundles <<EOK
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-completions
EOK
antigen theme davidzchen/minimal minimal-path-git-host
antigen apply

source $HOME/.lib/sh/man-colors.sh
source $HOME/.lib/sh/ant-colors.sh

case $TERM in
  screen-256color|xterm|xterm-256color)
    source $HOME/.lib/sh/colors.sh
    source $HOME/.lib/sh/mvn-color.sh
    ;;
esac

# if statement guards adding these helpers for non-interative shells
if [ -n "$PS1" ]; then
  eval "$(~/.lib/base16-shell/profile_helper.sh)"
fi

if [ -f $HOME/.zshrc_local ]; then
    source $HOME/.zshrc_local
fi

$HOME/.bin/begin
