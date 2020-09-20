# =============================================================================
# Shell utility functions
# -----------------------------------------------------------------------------

# Displays a graphical Git log.
function gitlog {
  setterm -linewrap off

  git --no-pager log --all --color=always --graph --abbrev-commit --decorate \
      --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' | \
      sed -E \
          -e 's/\|(\x1b\[[0-9;]*m)+\\(\x1b\[[0-9;]*m)+ /├\1─╮\2/' \
          -e 's/(\x1b\[[0-9;]+m)\|\x1b\[m\1\/\x1b\[m /\1├─╯\x1b\[m/' \
          -e 's/\|(\x1b\[[0-9;]*m)+\\(\x1b\[[0-9;]*m)+/├\1╮\2/' \
          -e 's/(\x1b\[[0-9;]+m)\|\x1b\[m\1\/\x1b\[m/\1├╯\x1b\[m/' \
          -e 's/╮(\x1b\[[0-9;]*m)+\\/╮\1╰╮/' \
          -e 's/╯(\x1b\[[0-9;]*m)+\//╯\1╭╯/' \
          -e 's/(\||\\)\x1b\[m   (\x1b\[[0-9;]*m)/╰╮\2/' \
          -e 's/(\x1b\[[0-9;]*m)\\/\1╮/g' \
          -e 's/(\x1b\[[0-9;]*m)\//\1╯/g' \
          -e 's/^\*|(\x1b\[m )\*/\1⎬/g' \
          -e 's/(\x1b\[[0-9;]*m)\|/\1│/g' \
      | command less -r +'/[^/]HEAD'

  setterm -linewrap on
}
