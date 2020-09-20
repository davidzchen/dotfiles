#!/bin/sh
# =============================================================================
# Common aliases used for the sh family of shells.
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# ls
# -----------------------------------------------------------------------------

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# -----------------------------------------------------------------------------
# editors
# -----------------------------------------------------------------------------

alias va="vim -u ~/.vimrc.more"
alias em="emacs"

# -----------------------------------------------------------------------------
# misc
# -----------------------------------------------------------------------------

alias please='sudo $(history -p \!\!)'

# -----------------------------------------------------------------------------
# Command replacements
# -----------------------------------------------------------------------------

# Do not enable yet.
if false; then
  # lsd
  # ls = lsd
  command -v lsd > /dev/null && alias ls='lsd --group-dirs first'
  # tree = lsd
  command -v lsd > /dev/null && alias tree='lsd --tree'

  # htop or ytop
  # Only enable one of these
  command -v ytop > /dev/null && alias top='ytop --per-cpu'
  # command -v htop > /dev/null && alias top='htop'
  # command -v bashtop > /dev/null && alias top='bashtop'

  # cat = bat
  command -v bat > /dev/null && alias cat='bat --pager=never'

  # less = bat
  command -v bat > /dev/null && alias cat='bat'
fi
