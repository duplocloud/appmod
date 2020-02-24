#!/bin/bash -e
set -x
sleep 120s
master=$DUPLO_DOCKER_HOST
if [[ "x$masterip" != "x" ]]; then
    master=$masterip
    echo "todo master into spark-defaults.conf"
fi
echo "discovery api invoke"
set +x

#we are extracting output so ignoring trace
sparkip=$((python /environment_variable_setting.py spark-master-01) 2>&1)

set -x
echo $sparkip
export SPARK_OPTS=" --master spark://$sparkip:7077 --driver-memory 20g  --executor-memory 15g  --executor-cores 5"
echo $SPARK_OPTS
#HADOOP_HOME=/usr/local/spark-2.4.1-bin-hadoop2.7

#cp $HADOOP_HOME/share/hadoop/tools/lib/aws-java-sdk-bundle-1.11.199.jar $HADOOP_HOME/share/hadoop/common/lib/
#cp $HADOOP_HOME/share/hadoop/tools/lib/hadoop-aws-3.0.0.jar $HADOOP_HOME/share/hadoop/common/lib/


#while :
#do
#	echo "Press [CTRL+C] to stop.."
#	sleep 5
#done

cd work
jupyter notebook
