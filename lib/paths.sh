#!/bin/sh

export PATH="/opt/bin:/opt/local/bin:$HOME/bin:$HOME/local/bin:$PATH"

if [ -d $HOME/.cabal/bin ]; then
  export PATH="$HOME/.cabal/bin:$PATH"
fi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/opt/lib
export LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/opt/lib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/local/include:/opt/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include:/opt/include

if [ -d $HOME/Projects/hadoop-common/bin ]; then
  export PATH="$HOME/Projects/hadoop-common/bin:$PATH"
fi

if [ -d $HOME/Projects/pig/bin ]; then
  export PATH="$HOME/Projects/pig/bin:$PATH"
fi

if [ -d $HOME/Projects/hive/bin ]; then
  export PATH="$HOME/Projects/hive/bin:$PATH"
fi
