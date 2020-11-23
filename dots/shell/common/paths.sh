#!/bin/sh
# =============================================================================
# Configures $PATHs and path-related variables
# -----------------------------------------------------------------------------

# Basics
export PATH=$HOME/.bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Chrome Depot Tools
if [ -d $HOME/.opt/depot_tools ]; then
  export PATH=$HOME/.opt/depot_tools:$PATH
fi
if [ -d $HOME/.cargo/bin ]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi

# Go
export GOPATH=$HOME/go

if [ -d $HOME/.dots/pkg/wal ]; then
  export PATH=$PATH:$HOME/.dots/pkg/wal
fi

# Platform-specific
case $(uname -s) in
  "Linux")
    # Go
    export GOROOT=/usr/lib/go
    export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

    # Linuxbrew installed to home directory
    if [ -d $HOME/.linuxbrew ]; then
      export PATH=$HOME/.linuxbrew/bin:$PATH
      export MANPATH=$HOME/.linuxbrew/share/man:$MANPATH
      export INFOPATH=$HOME/.linuxbrew/share/info:$INFOPATH
    fi
    ;;

  "Darwin")
    # Go
    export GOROOT="$(brew --prefix golang)/libexec"
    export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

    # Java
    if [ -f /usr/libexec/java_home ]; then
      export JAVA_HOME=`/usr/libexec/java_home`
      export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'
    fi

    # Haskell
    if [ -d $HOME/Library/Haskell/bin ]; then
      export PATH=$PATH:$HOME/Library/Haskell/bin
    fi

    # Mono
    #
    # If Mono is installed, put the Commands directory at the end of $PATH.
    # Because a number of commands in the Mono distribution overlap with those
    # installed on the system, this way, the system version of the commands
    # will be used rather than the Mono ones.
    if [ -d /Library/Frameworks/Mono.framework/Commands ]; then
      export PATH=$PATH:/Library/Frameworks/Mono.framework/Commands
    fi
    ;;
esac
