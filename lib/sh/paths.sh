#!/bin/sh

export PATH=$HOME/.bin:/usr/local/bin:$PATH

case $(uname -s) in
  "Linux")
    export GOROOT=/usr/lib/go
    if [ -d $HOME/.linuxbrew ]; then
      export PATH=$HOME/.linuxbrew/bin:$PATH
      export MANPATH=$HOME/.linuxbrew/share/man:$MANPATH
      export INFOPATH=$HOME/.linuxbrew/share/info:$INFOPATH
    fi
    ;;
  "Darwin")
    export GOROOT=/usr/local/Cellar/go/1.4/libexec
    if [ -f /usr/libexec/java_home ]; then
      export JAVA_HOME=`/usr/libexec/java_home`
      export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'
    fi
    if [ -d $HOME/Library/Haskell/bin ]; then
      export PATH=$HOME/Library/Haskell/bin:$PATH
    fi
    # If Mono is installed, put the Commands directory at the end of $PATH.
    # Because a number of commands in the Mono distribution overlap with those
    # installed on the system, this way, the system version of the commands
    # will be used rather than the Mono ones.
    if [ -d /Library/Frameworks/Mono.framework/Commands ]; then
      export PATH=$PATH:/Library/Frameworks/Mono.framework/Commands
    fi
    ;;
esac
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
