#!/bin/sh
# =============================================================================
# Setting up macOS
# -----------------------------------------------------------------------------
# Notes:
#
# - Define a directory where input dependencies should be added
# - Define a directory where git repositories or tools that are only used for
#   setup
# - Implement checks for expected inputs, etc.

# -----------------------------------------------------------------------------
# Base
# -----------------------------------------------------------------------------

brew install bash coreutils gnu-sed git python3 osx-cpu-temp

# -----------------------------------------------------------------------------
# Aesthetics
# -----------------------------------------------------------------------------

# starship - minimalistic shell prompt
# URL: https://starship.rs/

brew install starship

# lsd - multi-colored ls
# URL: https://github.com/Peltoche/lsd

brew install lsd

# fontforge - Nerd fonts patcher
# URL: https://github.com/ryanoasis/nerd-fonts#font-patcher

# Required for patcher script

brew install fontforge

# TODO: write script for cloning the repo and patching Pragmata Pro

# ytop - interactive system process viewer but in Rust
# URL: https://github.com/cjbassi/ytop

brew tap cjbassi/ytop
brew install ytop

# htop - interactive system process viewer
# URL: https://htop.dev/
# Optional

if false; then
  brew install htop
fi

# bashtop - pretty epic system process viewer
# URL: https://github.com/aristocratos/bashtop
# Optional

if false; then
  # deps
  # homebrew common: bash coreutils gnu-sed git python3 osx-cpu-temp
  python3 -m pip install psutil

  # TODO: Clone repo and install
fi

# bat - cat from the future
# URL: https://github.com/sharkdp/bat

brew install bat

# lolcat - rainbow-ize things
# URL: https://github.com/busyloop/lolcat
# Optional

brew install lolcat

# neofetch - display system information
# URL: https://github.com/dylanaraps/neofetch

brew install neofetch
