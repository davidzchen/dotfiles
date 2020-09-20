#!/bin/sh
# =============================================================================
# Configures colored output for command line tools.
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Formatting constants
# -----------------------------------------------------------------------------

function _color_formatting_constants {
  export BOLD=`tput bold`
  export UNDERLINE_ON=`tput smul`
  export UNDERLINE_OFF=`tput rmul`
  export TEXT_BLACK=`tput setaf 0`
  export TEXT_RED=`tput setaf 1`
  export TEXT_GREEN=`tput setaf 2`
  export TEXT_YELLOW=`tput setaf 3`
  export TEXT_BLUE=`tput setaf 4`
  export TEXT_MAGENTA=`tput setaf 5`
  export TEXT_CYAN=`tput setaf 6`
  export TEXT_WHITE=`tput setaf 7`
  export BACKGROUND_BLACK=`tput setab 0`
  export BACKGROUND_RED=`tput setab 1`
  export BACKGROUND_GREEN=`tput setab 2`
  export BACKGROUND_YELLOW=`tput setab 3`
  export BACKGROUND_BLUE=`tput setab 4`
  export BACKGROUND_MAGENTA=`tput setab 5`
  export BACKGROUND_CYAN=`tput setab 6`
  export BACKGROUND_WHITE=`tput setab 7`
  export RESET_FORMATTING=`tput sgr0`
}

# -----------------------------------------------------------------------------
# Colored grep and diff output
# -----------------------------------------------------------------------------

function _color_grep_diff_output {
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
  alias diff='diff --color=auto'
}

# -----------------------------------------------------------------------------
# Colored ls output
# -----------------------------------------------------------------------------

# -G (enable colored output
# -F (display `/`, `@`, `=`, `%`, `|` at the end of each path depending on
#     the type of the file)
# -h (use unit suffixes rather than bytes for file sizes)
function _color_ls_output {
  case $(uname -s) in
    "Darwin")
      alias ls='ls -GFh'
      ;;
    *)
      alias ls='ls -GFh --color=auto'
      ;;
  esac
}

# -----------------------------------------------------------------------------
# Colored man pages
# -----------------------------------------------------------------------------

function _color_man_pages {
  export LESS_TERMCAP_mb=$'\E[01;31m'
  export LESS_TERMCAP_md=$'\E[01;31m'
  export LESS_TERMCAP_me=$'\E[0m'
  export LESS_TERMCAP_se=$'\E[0m'
  export LESS_TERMCAP_so=$'\E[01;44;33m'
  export LESS_TERMCAP_ue=$'\E[0m'
  export LESS_TERMCAP_us=$'\E[01;32m'
}

# -----------------------------------------------------------------------------
# Colored Ant output
# -----------------------------------------------------------------------------

function _color_ant_output {
  export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
}

# -----------------------------------------------------------------------------
# Colored Maven output
# -----------------------------------------------------------------------------

# Wrapper function for Maven's mvn command.
function _mvn_color {
  # Filter mvn output using sed
  mvn $@ | sed \
      -e "s/\(\[INFO\]\ \-.*\)/${TEXT_BLUE}${BOLD}\1/g" \
      -e "s/\(\[INFO\]\ \[.*\)/${RESET_FORMATTING}${BOLD}\1${RESET_FORMATTING}/g" \
      -e "s/\(\[INFO\]\ BUILD SUCCESSFUL\)/${BOLD}${TEXT_GREEN}\1${RESET_FORMATTING}/g" \
      -e "s/\(\[WARNING\].*\)/${BOLD}${TEXT_YELLOW}\1${RESET_FORMATTING}/g" \
      -e "s/\(\[ERROR\].*\)/${BOLD}${TEXT_RED}\1${RESET_FORMATTING}/g" \
      -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${BOLD}${TEXT_GREEN}Tests run: \1${RESET_FORMATTING}, Failures: ${BOLD}${TEXT_RED}\2${RESET_FORMATTING}, Errors: ${BOLD}${TEXT_RED}\3${RESET_FORMATTING}, Skipped: ${BOLD}${TEXT_YELLOW}\4${RESET_FORMATTING}/g"

  # Make sure formatting is reset
  echo -ne ${RESET_FORMATTING}
}

# Override the mvn command with the colorized one.
function _color_mvn_output {
  alias mvn="mvn_color"
}

# -----------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------

case $TERM in
  screen-256color|xterm|xterm-256color)
    _color_formatting_constants
    _color_grep_diff_output
    _color_ls_output
    _color_man_pages
    _color_ant_output
    _color_mvn_output
    ;;
esac
