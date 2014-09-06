alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'

case $(uname -s) in
  "Darwin")
    alias ls='ls -GFh'
    ;;
  *)
    alias ls='ls -GFh --color=auto'
    ;;
esac

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias va="vim -u ~/.vimrc.more"

alias please='sudo $(history -p \!\!)'
