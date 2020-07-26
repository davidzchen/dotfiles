#!/bin/bash

set -euf -o pipefail

readonly BLACK="#1B232A"      # black    terminal_color_0
readonly RED="#D95468"        # red      terminal_color_1
readonly GREEN="#8BD49C"      # green    terminal_color_2
readonly ORANGE="#D98E48"     # orange   terminal_color_3
readonly BLUE="#539AFC"       # blue     terminal_color_4
readonly MAGENTA="#B62D65"    # magenta  terminal_color_5
readonly CYAN="#008B94"       # cyan     terminal_color_6
readonly WHITE="#718CA1"      # white    terminal_color_7

readonly BR_BLACK="#333F4A"   # bright black    terminal_color_8
readonly BR_RED="#D95468"     # bright red      terminal_color_9
readonly BR_GREEN="#8BD49C"   # bright green    terminal_color_10
readonly BR_ORANGE="#EBBF83"  # bright orange   terminal_color_11
readonly BR_BLUE="#5EC4FF"    # bright blue     terminal_color_12
readonly BR_MAGENTA="#B62D65" # bright magenta  terminal_color_13
readonly BR_CYAN="#70E1E8"    # bright cyan     terminal_color_14
readonly BR_WHITE="#B7C5D3"   # bright white    terminal_color_15

#readonly BACKGROUND='rgba(29,37,44,0.95)'  # $BLACK but with 95% opacity
readonly BACKGROUND="$BLACK"
readonly FOREGROUND="$BR_WHITE"
readonly CURSOR="$BLUE"
readonly DARKSTYLE='true'
readonly PALETTE="$BLACK:$RED:$GREEN:$ORANGE:$BLUE:$MAGENTA:$CYAN:$WHITE:$BR_BLACK:$BR_RED:$BR_GREEN:$BR_ORANGE:$BR_BLUE:$BR_MAGENTA:$BR_CYAN:$BR_WHITE"

gsettings set io.elementary.terminal.settings background "$BACKGROUND"
gsettings set io.elementary.terminal.settings foreground "$FOREGROUND"
gsettings set io.elementary.terminal.settings cursor-color "$CURSOR"
gsettings set io.elementary.terminal.settings prefer-dark-style "$DARKSTYLE"
gsettings set io.elementary.terminal.settings palette "$PALETTE"
