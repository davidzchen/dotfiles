#!/bin/sh

HADOOP2=true

if [ -x /usr/local/bin/brew ]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

export PATH="/opt/bin:/opt/local/bin:$HOME/bin:$HOME/local/bin:$PATH"

if [ -d $HOME/.cabal/bin ]; then
  export PATH="$HOME/.cabal/bin:$PATH"
fi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib:/usr/lib:/usr/local/lib:/opt/lib:$HOME/local/lib
export LIBRARY_PATH=$LD_LIBRARY_PATH:/lib:/usr/lib:/usr/local/lib:/opt/lib:$HOME/local/lib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/include:/usr/include:/usr/local/include:/opt/include:$HOME/local/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/include:/usr/include:/usr/local/include:/opt/include:$HOME/local/include

if $HADOOP2; then
  export HADOOP_INSTALL="/staging/apps/hadoop2"
  export PATH=$PATH:$HADOOP_INSTALL/bin
  export PATH=$PATH:$HADOOP_INSTALL/sbin
  export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
  export HADOOP_COMMON_HOME=$HADOOP_INSTALL
  export HADOOP_HDFS_HOME=$HADOOP_INSTALL
  export YARN_HOME=$HADOOP_INSTALL
else
  if [ -d /staging/apps/hadoop ]; then
    export HADOOP_HOME="/staging/apps/hadoop"
    export PATH="$HADOOP_HOME/bin:$PATH"
  fi
fi

if [ -d /staging/apps/pig ]; then
  export PIG_HOME="/staging/apps/pig"
  export PATH="$PIG_HOME/bin:$PATH"
fi

if [ -d /staging/apps/hive ]; then
  export HIVE_HOME="/staging/apps/hive"
  export PATH="$HIVE_HOME/bin:$PATH"
fi

if [ -d $HIVE_HOME/hcatalog ]; then
  export PATH="$HIVE_HOME/hcatalog/bin:$PATH"
  export PATH="$HIVE_HOME/hcatalog/sbin:$PATH"
	export HCAT_HOME="$HIVE_HOME/hcatalog"
fi

if [ -d /staging/apps/tajo ]; then
  export TAJO_HOME="/staging/apps/tajo"
  export PATH="$TAJO_HOME/bin:$PATH"
fi

if [ -d $HOME/Projects/azkaban2 ]; then
  export AZKABAN_HOME="$HOME/Projects/azkaban2"
fi

if [ -d /staging/apps/play ]; then
  export PLAY_HOME="/staging/apps/play"
  export PATH="$PLAY_HOME:$PATH"
fi

export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
