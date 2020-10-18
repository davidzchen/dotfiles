#!/bin/sh
# =============================================================================
# Configures bash shell prompt
# -----------------------------------------------------------------------------

DOTS_PROMPT="dra-powerline"

case $DOTS_PROMPT in
  "starship")
    if command -v "starship" &> /dev/null; then
      eval "$(starship init zsh)"  
    fi
    ;;

  "dra-minimal")
    PROMPT=" %F{cyan}%1~ >%F{blue}>%{$reset_color%} "
    ;;

  "dra-complex")
    NEWLINE=$'\n'
    PROMPT="${NEWLINE} %F{blue}┌─────(%F{magenta}%n%F{blue})─────(%F{green}%1~%F{blue}) ${NEWLINE} └> %F{cyan}\$ %{$reset_color%}"
    ;;

  "dra-powerline")
    NEWLINE=$'\n'
    OS_ICON=''
    PS1="${NEWLINE} %F{blue}╭─────%F{red}%F{black}%K{red} $OS_ICON %n %{$reset_color%}%k%F{red}%F{blue}─────%F{green}%F{black}%K{green} %1~ %{$reset_color%}%k%F{green} ${NEWLINE} %F{blue}╰❯%F{cyan} \$ %{$reset_color%}"
    ;;

  "dra-powerlevel10k")
    NEWLINE=$'\n'
    OS_ICON=''
    PS1="${NEWLINE} %F{blue}╭─%F{red}%F{black}%K{red} $OS_ICON %n %F{red}%K{blue}%F{black} %1~ %k%F{blue} ${NEWLINE} %F{blue}╰❯%F{cyan} \$ ${reset_color}"
esac
