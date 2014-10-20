#!/bin/sh

HADOOP2=false

if [ -x /usr/local/bin/brew ]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

export PATH="/opt/bin:/opt/local/bin:$HOME/.bin:$HOME/local/bin:$PATH"

if [ -x /usr/libexec/java_home ]; then
  export JAVA_HOME=`/usr/libexec/java_home`
else
  # Assume Linux.
  export JAVA_HOME=/usr/lib/jvm/java-8-oracle
fi

if [ -d $HOME/.cabal/bin ]; then
  export PATH="$HOME/.cabal/bin:$PATH"
fi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib:/usr/lib:/usr/local/lib:/opt/lib:$HOME/local/lib
export LIBRARY_PATH=$LD_LIBRARY_PATH:/lib:/usr/lib:/usr/local/lib:/opt/lib:$HOME/local/lib
export C_INCLUDE_PATH=/opt/include:/opt/local/include:$HOME/local/include
export CPLUS_INCLUDE_PATH=/opt/include:/opt/local/include:$HOME/local/include

case $(uname -s) in
  "Linux")
    export PATH=$HOME/.linuxbrew/bin:$PATH
    export LD_LIBRARY_PATH=$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH
    ;;
esac

if $HADOOP2; then
  export HADOOP_INSTALL="$HOME/staging/apps/hadoop2"
  export PATH=$PATH:$HADOOP_INSTALL/bin
  export PATH=$PATH:$HADOOP_INSTALL/sbin
  export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
  export HADOOP_COMMON_HOME=$HADOOP_INSTALL
  export HADOOP_HDFS_HOME=$HADOOP_INSTALL
  export YARN_HOME=$HADOOP_INSTALL
else
  if [ -d $HOME/staging/apps/hadoop ]; then
    export HADOOP_HOME="$HOME/staging/apps/hadoop"
    export PATH="$HADOOP_HOME/bin:$PATH"
  fi
fi

if [ -d $HOME/staging/apps/pig ]; then
  export PIG_HOME="$HOME/staging/apps/pig"
  export PATH="$PIG_HOME/bin:$PATH"
fi

if [ -d $HOME/staging/apps/hive ]; then
  export HIVE_HOME="$HOME/staging/apps/hive"
  export PATH="$HIVE_HOME/bin:$PATH"
fi

if [ -d $HIVE_HOME/hcatalog ]; then
  export PATH="$HIVE_HOME/hcatalog/bin:$PATH"
  export PATH="$HIVE_HOME/hcatalog/sbin:$PATH"
	export HCAT_HOME="$HIVE_HOME/hcatalog"

  PIG_JARS=$HCAT_HOME/share/hcatalog/hcatalog-core*.jar
  PIG_JARS=$PIG_JARS:$HCAT_HOME/share/hcatalog/hcatalog-pig-adapter*.jar
  PIG_JARS=$PIG_JARS:$HIVE_HOME/lib/hive-metastore-*.jar:$HIVE_HOME/lib/libthrift-*.jar
  PIG_JARS=$PIG_JARS:$HIVE_HOME/lib/hive-exec-*.jar:$HIVE_HOME/lib/libfb303-*.jar
  PIG_JARS=$PIG_JARS:$HIVE_HOME/lib/jdo-api-*.jar:$HIVE_HOME/lib/slf4j-api-*.jar
  export PIG_OPTS=-Dhive.metastore.uris=thrift://localhost:9083
  alias pig="pig -Dpig.additional.jars=$PIG_JARS"
fi

if [ -d $HOME/staging/apps/tajo ]; then
  export TAJO_HOME="$HOME/staging/apps/tajo"
  export PATH="$TAJO_HOME/bin:$PATH"
fi

if [ -d $HOME/staging/apps/azkaban ]; then
  export AZKABAN_HOME="$HOME/staging/apps/azkaban"
fi

if [ -d $HOME/staging/apps/play ]; then
  export PLAY_HOME="$HOME/staging/apps/play"
  export PATH="$PLAY_HOME:$PATH"
fi

if [ -d $HOME/staging/apps/depot_tools ]; then
  export PATH="$HOME/staging/apps/depot_tools:$PATH"
fi

if [ -d /usr/local/texlive/2013/bin/universal-darwin ]; then
  export PATH="/usr/local/texlive/2013/bin/universal-darwin:$PATH"
fi

export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'

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
