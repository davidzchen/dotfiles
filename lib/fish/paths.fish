set HADOOP2 false

set -x PATH $PATH /opt/bin /opt/local/bin $HOME/bin $HOME/local/bin

if [ -d $HOME/.cabal/bin ]
	set -x PATH $PATH $HOME/.cabal/bin
end

set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/lib /opt/lib $HOME/local/lib
set -x LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/lib /opt/lib $HOME/local/lib
set -x C_INCLUDE_PATH $C_INCLUDE_PATH /usr/local/include /opt/include $HOME/local/include
set -x CPLUS_INCLUDE_PATH $CPLUS_INCLUDE_PATH /usr/local/include /opt/include $HOME/local/include

if [ "$HADOOP2" = "true" ]
	set -x HADOOP_INSTALL $HOME/Apps/hadoop
	set -x PATH $PATH $HADOOP_INSTALL/bin
	set -x PATH $PATH $HADOOP_INSTALL/sbin
	set -x HADOOP_MAPRED_HOME $HADOOP_INSTALL
	set -x HADOOP_COMMON_HOME $HADOOP_INSTALL
	set -x HADOOP_HDFS_HOME $HADOOP_INSTALL
	set -x YARN_HOME $HADOOP_INSTALL
else
	if [ -d $HOME/Apps/hadoop1 ]
		set -x HADOOP_HOME $HOME/Apps/hadoop1
		set -x PATH $PATH $HADOOP_HOME/bin
	end
end

if [ -d $HOME/Apps/pig ]
	set -x PIG_HOME $HOME/Apps/pig
	set -x PATH $PATH $PIG_HOME/bin
end

if [ -d $HOME/Apps/hive ]
 	set -x HIVE_HOME $HOME/Apps/hive
 	set -x PATH $PATH $HIVE_HOME/bin
end

if [ -d $HIVE_HOME/hcatalog ]
 	set -x PATH $PATH $HIVE_HOME/hcatalog/bin
 	set -x PATH $PATH $HIVE_HOME/hcatalog/sbin
	set -x HCAT_HOME $HIVE_HOME/hcatalog
end

if [ -d $HOME/Projects/azkaban2 ]
 	set -x AZKABAN_HOME $HOME/Projects/azkaban2
end

if [ -d $HOME/Apps/play ]
 	set -x PLAY_HOME $HOME/Apps/play
 	set -x PATH $PATH $PLAY_HOME
end

set -x JAVA_TOOL_OPTIONS '-Djava.awt.headless=true'

set -x GOROOT /usr/local/go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
