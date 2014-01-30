#!/bin/sh

HADOOP2=true

export PATH="/opt/bin:/opt/local/bin:$HOME/bin:$HOME/local/bin:$PATH"

if [ -d $HOME/.cabal/bin ]; then
  export PATH="$HOME/.cabal/bin:$PATH"
fi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib:/usr/lib:/usr/local/lib:/opt/lib:$HOME/local/lib
export LIBRARY_PATH=$LD_LIBRARY_PATH:/lib:/usr/lib:/usr/local/lib:/opt/lib:$HOME/local/lib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/include:/usr/include:/usr/local/include:/opt/include:$HOME/local/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/include:/usr/include:/usr/local/include:/opt/include:$HOME/local/include

if $HADOOP2; then
  export HADOOP_INSTALL="$HOME/Apps/hadoop"
  export PATH=$PATH:$HADOOP_INSTALL/bin
  export PATH=$PATH:$HADOOP_INSTALL/sbin
  export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
  export HADOOP_COMMON_HOME=$HADOOP_INSTALL
  export HADOOP_HDFS_HOME=$HADOOP_INSTALL
  export YARN_HOME=$HADOOP_INSTALL
else
  if [ -d $HOME/Apps/hadoop ]; then
    export HADOOP_HOME="$HOME/Apps/hadoop"
    export PATH="$HADOOP_HOME/bin:$PATH"
  fi
fi

if [ -d $HOME/Apps/pig ]; then
  export PIG_HOME="$HOME/Apps/pig"
  export PATH="$PIG_HOME/bin:$PATH"
fi

if [ -d $HOME/Apps/hive ]; then
  export HIVE_HOME="$HOME/Apps/hive"
  export PATH="$HIVE_HOME/bin:$PATH"
fi

if [ -d $HIVE_HOME/hcatalog ]; then
  export PATH="$HIVE_HOME/hcatalog/bin:$PATH"
  export PATH="$HIVE_HOME/hcatalog/sbin:$PATH"
	export HCAT_HOME="$HIVE_HOME/hcatalog"
fi

if [ -d $HOME/Projects/azkaban2 ]; then
  export AZKABAN_HOME="$HOME/Projects/azkaban2"
fi

if [ -d $HOME/Apps/play ]; then
  export PLAY_HOME="$HOME/Apps/play"
  export PATH="$PLAY_HOME:$PATH"
fi

export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
