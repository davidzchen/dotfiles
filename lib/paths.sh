#!/bin/sh

export PATH="/opt/bin:/opt/local/bin:$HOME/bin:$HOME/local/bin:$PATH"

if [ -d $HOME/.cabal/bin ]; then
  export PATH="$HOME/.cabal/bin:$PATH"
fi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib:/usr/lib:/usr/local/lib:/opt/lib:$HOME/local/lib
export LIBRARY_PATH=$LD_LIBRARY_PATH:/lib:/usr/lib:/usr/local/lib:/opt/lib:$HOME/local/lib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/include:/usr/include:/usr/local/include:/opt/include:$HOME/local/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/include:/usr/include:/usr/local/include:/opt/include:$HOME/local/include

if [ -d $HOME/Projects/hadoop ]; then
  export HADOOP_HOME="$HOME/Projects/hadoop"
  export PATH="$HADOOP_HOME/bin:$PATH"
fi

if [ -d $HOME/Projects/pig ]; then
  export PIG_HOME="$HOME/Projects/pig"
  export PATH="$PIG_HOME/bin:$PATH"
fi

if [ -d $HOME/Projects/hive ]; then
  export HIVE_HOME="$HOME/Projects/hive/build/dist"
  export PATH="$HIVE_HOME/bin:$PATH"
fi

if [ -d $HIVE_HOME/hcatalog ]; then
  export PATH="$HIVE_HOME/hcatalog/bin:$PATH"
  export PATH="$HIVE_HOME/hcatalog/sbin:$PATH"
fi

if [ -d $HOME/Projects/azkaban2 ]; then
  export AZKABAN_HOME="$HOME/Projects/azkaban2"
  export PATH="$AZKABAN_HOME/bin:$PATH"
fi

if [ -d $HOME/Apps/play ]; then
  export PLAY_HOME="$HOME/Apps/play"
  export PATH="$PLAY_HOME:$PATH"
fi

export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'
