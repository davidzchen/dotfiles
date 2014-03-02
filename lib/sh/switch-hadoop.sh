hswitch() {
	if [ $# != 2 ]; then
		echo "usage: hswitch 1|2"
		return
	fi

	case $1 in
		1)
			if [ -d $HOME/Projects/hadoop ]; then
				remove_path "$HADOOP_COMMON_HOME/bin"
				remove_path "$HADOOP_MAPRED_HOME/sbin"
				
				export HADOOP_HOME="$HOME/Projects/hadoop"
				add_path "$HADOOP_HOME/bin"
			else
				echo "Hadoop 1 home not found."
				return
			fi
			;;

		2)
			if [ -d $HOME/Projects/hadoop2 ]; then
				remove_path "$HOME/Projects/hadoop/bin"

				export HADOOP_COMMON_HOME=""
				export HADOOP_HDFS_HOME=""
				export HADOOP_MAPRED_HOME=""
				export HADOOP_YARN_HOME="$HADOOP_MAPRED_HOME"
				export HADOOP_CONF_DIR=""
				export YARN_CONF_DIR="$HADOOP_CONF_DIR"
				export HADOOP_HOME=""
				add_path "$HADOOP_COMMON_HOME/bin"
				add_path "$HADOOP_MAPRED_HOME/sbin"
			else
				echo "Hadoop 2 home not found."
			fi
			;;

		*)
			echo "usage: hswitch 1|2"
			return
			;;
	esac
}
