#! /usr/bin/env bash

export TOIL_AWS_ZONE=us-east-1a

set -x

JOBSTORE=aws:us-east-1:rna-seq-reprocessing-toil-cluster-v001-tthyer-test

toil clean $JOBSTORE

mkdir -p /var/log/toil/workers/tthyer-test

toil-cwl-runner --provisioner aws \
--jobStore $JOBSTORE \
--provisioner aws \
--batchSystem mesos \
--logLevel DEBUG \
--logFile /var/log/toil/tthyer-test.log \
--retryCount 0 \
--metrics \
--runCwlInternalJobsOnWorkers \
--targetTime 1 \
--defaultDisk 90G \
--maxMemory 200G \
--nodeTypes m5.12xlarge,m5.2xlarge \
--nodeStorage 125 \
--maxNodes 1,5 \
--writeLogs /var/log/toil/workers/tthyer-test \
main-paired.cwl main.json

