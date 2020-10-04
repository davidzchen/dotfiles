#!/bin/bash
# =============================================================================
# Setting up Ubuntu-family distributions
# -----------------------------------------------------------------------------

sudo apt update

set -e

SETUP_DIR="$HOME/Setup"  # Change this later and add a flag

function setup_dirs {
  cd $HOME
  mkdir Projects Repos
}

function install_chrome
  local working_dir="$SETUP_DIR/google-chrome"
  mkdir -p "$working_dir"
  pushd $working_dir > /dev/null
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  popd > /dev/null
}

function install_steam {
  # Install Steam
}

function install_bazel {
  sudo apt install curl gnupg
  curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
  sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
  echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list

  sudo apt update
  sudo apt install bazel
}

function install_mono {
  sudo apt install gnupg ca-certificates
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
  echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
  sudo apt update
  sudo apt install mono-devel
}

function install_starship {
  # I really don't like this
  curl -fsSL https://starship.rs/install.sh | bash
}

function install_pkgs {
  sudo apt update
  sudo apt upgrade
  sudo apt install \
      vim \
      tmux \
      zsh \
      build-essential \
      fonts-liberation \
      golang \
      rustc \
      autoconf \
      libtool \
      pkg-config \
      openjdk-11-jdk \
      cmake \
      ninja-build \
      ruby-dev \
      python-dev \
      python3-dev \
      protobuf-compiler \
      npm \
      haskell-platform \
      texlive-full \
      mercurial \
      brz \
      bzr \
      subversion \
      scala \
      ant \
      maven \
      gradle \
      cowsay \
      fortune \
      fonts-powerline \
      fonts-firacode \
      ttf-mscorefonts-installer \
      scrot \
      urxvt \
      emacs \
      silversearcher-ag \
}

function github_ssh_key {
  #Host github.com
  #  User git
  #  Hostname github.com
  #  PreferredAuthentications publickey
  #  IdentityFile /home/user/.ssh/github_rsa
}

function chsh_zsh {
  sudo chsh -s `which zsh`
  # XXX On Ubuntu, a logout/login is required to change the shell.
}

function caps_lock_is_ctrl {

}

function install_dotfiles {
  local dotfiles_dir="$HOME/.dotfiles"
  # Flag for ssh cloning
  # Flag for destination
  git clone https://github.com/davidzchen/dotfiles $dotfiles_dir
  pushd $dotfiles_dir > /dev/null
  ./install
  popd

  # Requires that zsh be the default shell
  # Need to restart shell for Antigen to install
  # Open vim and install Vundle packages
  # Build Vim YouCompleteMe plugin
  # Install tmux tpm packages (not sure how to do this)
  # Decide how much of this should be automated.

  # Install terminal color scheme
}

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
