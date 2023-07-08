#!/bin/bash
source "/start-spark.sh"

if [ "$SPARK_WORKLOAD" == "master" ]; then
    export SPARK_MASTER_HOST=$(hostname)
    cd /opt/spark/bin && ./spark-class org.apache.spark.deploy.master.Master --ip $SPARK_MASTER_HOST
elif [ "$SPARK_WORKLOAD" == "worker" ]; then
    cd /opt/spark/bin && ./spark-class org.apache.spark.deploy.worker.Worker --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_MASTER
elif [ "$SPARK_WORKLOAD" == "submit" ]; then
    echo "Running Spark Submit"
    # Add your Spark submit command here
else
    echo "Undefined Workload Type $SPARK_WORKLOAD, must specify: master, worker, submit"
fi
