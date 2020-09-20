#!/bin/sh
# =============================================================================
# Configures bash shell prompt
# -----------------------------------------------------------------------------

DOTS_PROMPT="starship"

case $DOTS_PROMPT in
  "starship")
    if command -v "starship" &> /dev/null; then
      eval "$(starship init bash)"
    fi
    ;;

  "dra-minimal")
    PS1=" \[\033[1;36m\]\w >\[\033[1;34m\]>\[\033[0m\] "
    ;;

  "dra-complex")
    PS1="\n \[\033[0;34m\]┌─────(\[\033[1;35m\]\u\[\033[0;34m\])─────(\[\033[1;32m\]\w\[\033[0;34m\]) \n └> \[\033[1;36m\]\$ \[\033[0m\]"
    ;;
esac
