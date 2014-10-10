#!/bin/sh

export PATH=$HOME/.bin:/usr/local/bin:$PATH

case $(uname -s) in
  "Linux")
    export GOROOT=/usr/lib/go
    ;;
  "Darwin")
    export GOROOT=/usr/local/Cellar/go/1.3.1/libexec
    ;;
esac
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
