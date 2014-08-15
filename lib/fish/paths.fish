set HADOOP2 false
set HIVE13 true

set -x PATH
if [ -x /usr/local/bin/brew ]
	set -x PATH $PATH /usr/local/opt/coreutils/libexec/gnubin
	set -x PATH $PATH /usr/local/opt/gnu-getopt/bin
end
set -x PATH $PATH /opt/bin /opt/local/bin $HOME/bin $HOME/local/bin
set -x PATH $PATH /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin

# Cabal
if [ -d $HOME/.cabal/bin ]
	set -x PATH $PATH $HOME/.cabal/bin
end

if [ -x /usr/libexec/java_home ]
	set -x JAVA_HOME (/usr/libexec/java_home)
else
	# Assume Linux.
	set -x JAVA_HOME /usr/lib/jvm/java-8-oracle
end

set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/lib /opt/lib $HOME/local/lib
set -x LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/lib /opt/lib $HOME/local/lib
set -x C_INCLUDE_PATH /opt/include /opt/local/include $HOME/local/include
set -x CPLUS_INCLUDE_PATH /opt/include /opt/local/include $HOME/local/include

switch (uname -s)
	case Linux
		set -x PATH $PATH $HOME/.linuxbrew/bin
		set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH $HOME/.linuxbrew/lib
end

# Hadoop and friends.
if [ "$HADOOP2" = "true" ]
	set -x HADOOP_INSTALL $HOME/staging/apps/hadoop2
	set -x PATH $PATH $HADOOP_INSTALL/bin
	set -x PATH $PATH $HADOOP_INSTALL/sbin
	set -x HADOOP_MAPRED_HOME $HADOOP_INSTALL
	set -x HADOOP_COMMON_HOME $HADOOP_INSTALL
	set -x HADOOP_HDFS_HOME $HADOOP_INSTALL
	set -x YARN_HOME $HADOOP_INSTALL
else
	if [ -d $HOME/staging/apps/hadoop ]
		set -x HADOOP_HOME $HOME/staging/apps/hadoop
		set -x PATH $PATH $HADOOP_HOME/bin
	end
end

if [ -d $HOME/staging/apps/pig ]
	set -x PIG_HOME $HOME/staging/apps/pig
	set -x PATH $PATH $PIG_HOME/bin
end

if [ -d $HOME/staging/apps/hive ]
	set -x HIVE_HOME $HOME/staging/apps/hive
	set -x PATH $PATH $HIVE_HOME/bin
end

if [ -d $HIVE_HOME/hcatalog ]
	set -x PATH $PATH $HIVE_HOME/hcatalog/bin
	set -x PATH $PATH $HIVE_HOME/hcatalog/sbin
	set -x HCAT_HOME $HIVE_HOME/hcatalog

	if [ "$HIVE13" = "true" ]
		set PIG_JARS "$HCAT_HOME/share/hcatalog/hive-hcatalog-core*.jar"
		set PIG_JARS "$PIG_JARS:$HCAT_HOME/share/hcatalog/hive-hcatalog-pig-adapter*.jar"
	else
		set PIG_JARS "$HCAT_HOME/share/hcatalog/hcatalog-core*.jar"
		set PIG_JARS "$PIG_JARS:$HCAT_HOME/share/hcatalog/hcatalog-pig-adapter*.jar"
	end
	set PIG_JARS "$PIG_JARS:$HIVE_HOME/lib/hive-metastore-*.jar:$HIVE_HOME/lib/libthrift-*.jar"
	set PIG_JARS "$PIG_JARS:$HIVE_HOME/lib/hive-exec-*.jar:$HIVE_HOME/lib/libfb303-*.jar"
	set PIG_JARS "$PIG_JARS:$HIVE_HOME/lib/jdo-api-*.jar:$HIVE_HOME/lib/slf4j-api-*.jar"
	set -x PIG_OPTS -Dhive.metastore.uris=thrift://localhost:9083
	function pig
		echo $PIG_JARS
		command pig -Dpig.additional.jars=$PIG_JARS $argv
	end
end

if [ -d $HOME/staging/apps/tajo ]
	set -x TAJO_HOME $HOME/staging/apps/tajo
	set -x PATH $PATH $TAJO_HOME/bin
end

# Azkaban
if [ -d $HOME/staging/apps/azkaban ]
	set -x AZKABAN_HOME $HOME/staging/apps/azkaban
end

# Play framework.
if [ -d $HOME/staging/apps/play ]
	set -x PLAY_HOME $HOME/staging/apps/play
	set -x PATH $PATH $PLAY_HOME
end

# Google Depot Tools
if [ -d $HOME/staging/apps/depot_tools ]
	set -x PATH $PATH $HOME/staging/apps/depot_tools
end

if [ -d /usr/local/texlive/2013/bin/universal-darwin ]
	set -x PATH $PATH /usr/local/texlive/2013/bin/universal-darwin
end

# On Mac OS X, this option prevents Java from popping up Dock icons whenever it
# executes a program.
set -x JAVA_TOOL_OPTIONS '-Djava.awt.headless=true'

# Set up Go.
switch (uname -s)
	case Linux
    set -x GOROOT /usr/lib/go
  case Darwin
    set -x GOROOT /usr/local/Cellar/go/1.3/libexec
end
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# MySQL on OS X
if [ -d /usr/local/mysql ]
	set -x PATH $PATH /usr/local/mysql/bin
end
