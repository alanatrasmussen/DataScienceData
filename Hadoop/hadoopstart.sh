source ~/.profile
sudo service ssh start
print "Type exit and hit enter to exit SSH session"
ssh localhost
# -----------------
# Start it up
$HADOOP_HOME/sbin/stop-all.sh
jps
$HADOOP_HOME/bin/hdfs namenode –format
$HADOOP_HOME/sbin/start-all.sh
cd ~/hadoop-3.3.0
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/$(whoami)
hdfs dfs -mkdir /user/$(whoami)/input
hdfs dfs -mkdir /user/$(whoami)/output
hdfs dfs -ls /user

# ----------------
# look at http://localhost:8088