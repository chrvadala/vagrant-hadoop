#!/usr/bin/env bash

hdfs namenode -format
start-all.sh
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/vagrant
