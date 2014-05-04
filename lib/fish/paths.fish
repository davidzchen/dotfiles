set HADOOP2 false

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
	set -x JAVA_HOME /usr/lib/jvm/java-7-oracle
end

set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/lib /opt/lib $HOME/local/lib
set -x LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/lib /opt/lib $HOME/local/lib
set -x C_INCLUDE_PATH /opt/include /opt/local/include $HOME/local/include
set -x CPLUS_INCLUDE_PATH /opt/include /opt/local/include $HOME/local/include

# Hadoop and friends.
if [ "$HADOOP2" = "true" ]
	set -x HADOOP_INSTALL /staging/apps/hadoop2
	set -x PATH $PATH $HADOOP_INSTALL/bin
	set -x PATH $PATH $HADOOP_INSTALL/sbin
	set -x HADOOP_MAPRED_HOME $HADOOP_INSTALL
	set -x HADOOP_COMMON_HOME $HADOOP_INSTALL
	set -x HADOOP_HDFS_HOME $HADOOP_INSTALL
	set -x YARN_HOME $HADOOP_INSTALL
else
	if [ -d /staging/apps/hadoop ]
		set -x HADOOP_HOME /staging/apps/hadoop
		set -x PATH $PATH $HADOOP_HOME/bin
	end
end

if [ -d /staging/apps/pig ]
	set -x PIG_HOME /staging/apps/pig
	set -x PATH $PATH $PIG_HOME/bin
end

if [ -d /staging/apps/hive ]
 	set -x HIVE_HOME /staging/apps/hive
 	set -x PATH $PATH $HIVE_HOME/bin
end

if [ -d $HIVE_HOME/hcatalog ]
 	set -x PATH $PATH $HIVE_HOME/hcatalog/bin
 	set -x PATH $PATH $HIVE_HOME/hcatalog/sbin
	set -x HCAT_HOME $HIVE_HOME/hcatalog

	set PIG_JARS "$HCAT_HOME/share/hcatalog/hcatalog-core*.jar"
	set PIG_JARS "$PIG_JARS:$HCAT_HOME/share/hcatalog/hcatalog-pig-adapter*.jar"
	set PIG_JARS "$PIG_JARS:$HIVE_HOME/lib/hive-metastore-*.jar:$HIVE_HOME/lib/libthrift-*.jar"
	set PIG_JARS "$PIG_JARS:$HIVE_HOME/lib/hive-exec-*.jar:$HIVE_HOME/lib/libfb303-*.jar"
	set PIG_JARS "$PIG_JARS:$HIVE_HOME/lib/jdo-api-*.jar:$HIVE_HOME/lib/slf4j-api-*.jar"
	set -x PIG_OPTS -Dhive.metastore.uris=thrift://localhost:9083
	function pig
		echo $PIG_JARS
	       	command pig -Dpig.additional.jars=$PIG_JARS $argv
	end
end

if [ -d /staging/apps/tajo ]
	set -x TAJO_HOME /staging/apps/tajo
	set -x PATH $PATH $TAJO_HOME/bin
end

# Azkaban
if [ -d $HOME/Projects/azkaban2 ]
 	set -x AZKABAN_HOME $HOME/Projects/azkaban2
end

# Play framework.
if [ -d /staging/apps/play ]
 	set -x PLAY_HOME /staging/apps/play
 	set -x PATH $PATH $PLAY_HOME
end

# Google Depot Tools
if [ -d /staging/apps/depot_tools ]
	set -x PATH $PATH /staging/apps/depot_tools
end

if [ -d /usr/local/texlive/2013/bin/universal-darwin ]
	set -x PATH $PATH /usr/local/texlive/2013/bin/universal-darwin
end

# On Mac OS X, this option prevents Java from popping up Dock icons whenever it
# executes a program.
set -x JAVA_TOOL_OPTIONS '-Djava.awt.headless=true'

# Set up Go.
set -x GOROOT /usr/local/go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# MySQL on OS X
if [ -d /usr/local/mysql ]
	set -x PATH $PATH /usr/local/mysql/bin
end