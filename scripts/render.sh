#!/bin/bash
set -e

PARAM_FILE=$1
BASE_TEMPLATE=$2
OUTPUT_FILE=$3

export APP_NAME=$(yq e '.appName' $PARAM_FILE)
export NAMESPACE=$(yq e '.namespace' $PARAM_FILE)
export REPLICAS=$(yq e '.replicas' $PARAM_FILE)

export IMAGE="$(yq e '.image.repository' $PARAM_FILE):$(yq e '.image.tag' $PARAM_FILE)"

export CPU_REQUEST=$(yq e '.resources.cpuRequest' $PARAM_FILE)
export CPU_LIMIT=$(yq e '.resources.cpuLimit' $PARAM_FILE)
export MEM_REQUEST=$(yq e '.resources.memRequest' $PARAM_FILE)
export MEM_LIMIT=$(yq e '.resources.memLimit' $PARAM_FILE)

envsubst < $BASE_TEMPLATE > $OUTPUT_FILE
