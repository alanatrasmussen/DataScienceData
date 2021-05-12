#! /usr/bin/env bash
# SETUP Java
# -------------------------

# https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/SingleCluster.html
sudo apt -y update
sudo apt -y install default-jre
sudo apt -y install openjdk-8-jre-headless
sudo apt-get -y install openjdk-8-jdk
java -version
which java

# Get SSH Working
# ----------------------
sudo apt -y remove openssh-server
sudo apt -y install openssh-server

ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

sudo service ssh start

#------------------------
# GET Hadoop
# goto https://apache.org/dyn/closer.cgi/hadoop/common
# Pick a mirror
# Pick a version
# Copy URL
# Pick where to download
# copy url - https://apache.osuosl.org/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz
# wget <url>
cd ~
wget -nc  https://apache.osuosl.org/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz
# expand Hadoop
tar -xzvf hadoop-3.3.0.tar.gz
pwd
cd hadoop-3.3.0
# -----------------
# Edit files
# -----------------
pwd
cd etc/hadoop
pwd
mv core-site.xml core-site.xml.backup
wget https://raw.githubusercontent.com/alanatrasmussen/DataScienceData/main/Hadoop/core-site.xml
# code etc/hadoop/core-site.xml
#
#<configuration>
#    <property>
#        <name>fs.defaultFS</name>
#        <value>hdfs://localhost:9000</value>
#    </property>
#</configuration>
#----------------
mv hdfs-site.xml hdfs-site.xml.backup
wget https://raw.githubusercontent.com/alanatrasmussen/DataScienceData/main/Hadoop/hdfs-site.xml
# code etc/hadoop/hdfs-site.xml

#<configuration>
#    <property>
#        <name>dfs.replication</name>
#        <value>1</value>
#    </property>
# </configuration>
mv hadoop-env.sh hadoop-env.sh.backup
wget https://raw.githubusercontent.com/alanatrasmussen/DataScienceData/main/Hadoop/hadoop-env.sh

# -----------------
# code etc/hadoop/hadoop-env.sh
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
#----------------
pwd
cd ..
pwd
cd ..
pwd
# code ~/.bashrc

echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64'  >> ~/.profile 
echo 'export HADOOP_HOME=$HOME/hadoop-3.3.0'  >> ~/.profile 
echo 'export PATH=$PATH:$HADOOP_HOME/bin'  >> ~/.profile 
echo 'export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop'  >> ~/.profile 
echo 'export PATH=${JAVA_HOME}/bin:${PATH}' >> ~/.profile
echo 'export HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar'  >> ~/.profile 


source ~/.profile

# -----------------
# Start it up

hdfs namenode –format
$HADOOP_HOME/sbin/start-all.sh
cd ~/hadoop-3.3.0
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/$(whoami)
hdfs dfs -mkdir /user/$(whoami)/input
hdfs dfs -mkdir /user/$(whoami)/output
hdfs dfs -ls /user

# ----------------
# look at http://localhost:8088