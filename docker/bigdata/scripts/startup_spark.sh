#!/bin/bash -ex

master=$DUPLO_DOCKER_HOST
if [[ "x$masterip" != "x" ]]; then
    master=$masterip
fi

sparkip=$((python environment_variable_setting.py spark-master-01) 2>&1)
export masterip="$sparkip"

############################## enable max memory option : default : Xms1024M Xmx4096M ########################
# "memory_min":"1024M","memory_max":"4096M"

totalk=$(awk '/^MemTotal:/{print $2}' /proc/meminfo)
max_mem=$(( ${totalk}*80/100 ))
min_mem=$(( ${totalk}*40/100 ))
echo "totalk=${totalk}K 80% max_mem=${max_mem}K 40% min_mem=${min_mem}K"
xms="${min_mem}K"
xmx="${max_mem}K"

#should  be  "memory_min":"1024M", "memory_max":"4096M"
# if [[ "x$memory_min" != "x" ]]; then
#     xms=$memory_min
#     echo "xms = ${xms}"
# fi
# if [[ "x$memory_max" != "x" ]]; then
#     xmx=$memory_max
#     echo "xmx = ${xmx}"
# fi

echo "SPARK_OPTS ${SPARK_OPTS} before "
export spark_master_ip=$master
export SPARK_OPTS="--driver-java-options=-Xms${xms} --driver-java-options=-Xmx${xmx} --driver-java-options=-Dlog4j.logLevel=info"
echo "spark_master_ip = ${master} xms = ${xms} xms = ${xmx} ${SPARK_OPTS}"
echo "SPARK_OPTS ${SPARK_OPTS} after "
############################## enable max memory option : default : Xms1024M Xmx4096M ########################


cp /usr/hadoop-3.0.0/share/hadoop/tools/lib/aws-java-sdk-bundle-1.11.199.jar /usr/hadoop-3.0.0/share/hadoop/common/lib/
cp /usr/hadoop-3.0.0/share/hadoop/tools/lib/hadoop-aws-3.0.0.jar /usr/hadoop-3.0.0/share/hadoop/common/lib/

if [[ "x$node" != "x" ]]; then
    if [ "$node" = "worker" ]
    then
        bin/spark-class org.apache.spark.deploy.worker.Worker spark://$master:7077
    else
        bin/spark-class org.apache.spark.deploy.master.Master -h $master
    fi
else
    bin/spark-class org.apache.spark.deploy.master.Master -h $master
fi



#while :
#do
#       echo "Press [CTRL+C] to stop.."
#       sleep 5
#done
