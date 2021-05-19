cd ~
mkdir wordcount
cd wordcount
wget -nc https://raw.githubusercontent.com/alanatrasmussen/DataScienceData/main/Hadoop/WordCount.java
# wget -nc https://raw.githubusercontent.com/alanatrasmussen/DataScienceData/main/Hadoop/WordCount.class
wget -nc https://raw.githubusercontent.com/alanatrasmussen/DataScienceData/main/Hadoop/summers_day.txt
hdfs dfs -put summers_day.txt input
hadoop com.sun.tools.javac.Main WordCount.java
jar cf wc.jar WordCount*.class
hadoop jar wc.jar WordCount input/summers_day.txt output/summersday_count

# ----------------
# look at http://localhost:8088