# =============================================================================
# zsh shell init
# -----------------------------------------------------------------------------

source "$HOME/.dots/shell/common/aliases.sh"
source "$HOME/.dots/shell/common/paths.sh"
source "$HOME/.dots/shell/common/functions.sh"
source "$HOME/.dots/shell/common/colors.sh"
source "$HOME/.dots/shell/zsh/antigen.zsh"
source "$HOME/.dots/shell/zsh/prompt.zsh"

export EDITOR=vim

# antigen
DISABLE_AUTO_TITLE=true
antigen use oh-my-zsh
antigen bundle history-substring-search
antigen bundles <<EOK
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-completions
  zsh-users/zsh-autosuggestions
EOK
# antigen theme chlorophyllin/minimal minimal-path-git-user-host
antigen apply

# Local zshrc
if [ -f "$HOME/.zshrc_local" ]; then
    source "$HOME/.zshrc_local"
fi

$HOME/.bin/begin
