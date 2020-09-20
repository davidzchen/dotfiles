#!/bin/sh
# =============================================================================
# Setting up Ubuntu-family distributions
# -----------------------------------------------------------------------------

sudo apt update

# -----------------------------------------------------------------------------
# Aesthetics
# -----------------------------------------------------------------------------

# starship - minimalistic shell prompt
# URL: https://starship.rs/

# lsd - multi-colored ls
# URL: https://github.com/Peltoche/lsd

# fontforge - Nerd fonts patcher
# URL: https://github.com/ryanoasis/nerd-fonts#font-patcher

# ytop - interactive system process viewer but in Rust
# URL: https://github.com/cjbassi/ytop

# htop - interactive system process viewer
# URL: https://htop.dev/
# optional

# bashtop - pretty epic system process viewer
# URL: https://github.com/aristocratos/bashtop
# optional

# bat - cat from the future
# URL: https://github.com/sharkdp/bat

sudo apt install bat

# Due to name clash with another project.
ln -s /usr/bin/batcat ~/.local/bin/bat

# lolcat - rainbow-ize things
# URL: https://github.com/busyloop/lolcat
# Optional

sudo snap install lolcat

# neofetch - display system information
# URL: https://github.com/dylanaraps/neofetch

sudo apt install neofetch
