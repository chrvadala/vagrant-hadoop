#!/usr/bin/env bash

cd $HADOOP_HOME
hdfs dfs -put etc/hadoop input
hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.6.0.jar grep input output 'dfs[a-z.]+'