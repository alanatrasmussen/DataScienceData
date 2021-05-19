source ~/.profile
sudo service ssh start
# echo "Type exit and hit enter to exit SSH session"
# ssh localhost
# -----------------
# Start it up
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=$HOME/hadoop-3.3.0
export PATH=$PATH:$HADOOP_HOME/bin
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export PATH=${JAVA_HOME}/bin:${PATH}
export HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar

$HADOOP_HOME/sbin/stop-all.sh
jps
$HADOOP_HOME/bin/hdfs namenode –format -nonInteractive
$HADOOP_HOME/sbin/start-all.sh
cd ~/hadoop-3.3.0
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/$(whoami)
hdfs dfs -mkdir /user/$(whoami)/input
hdfs dfs -mkdir /user/$(whoami)/output
hdfs dfs -ls /user
