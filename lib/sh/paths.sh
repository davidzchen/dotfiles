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
    export GOROOT=/usr/local/Cellar/go/1.3.1/libexec
    ;;
esac
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
