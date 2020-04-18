#!/bin/bash

source /scripts/common.sh
source /scripts/bootstrap-helm.sh


run_tests() {
    echo Running tests...

    wait_pod_ready otv-mongo-express
}

teardown() {
    helm del mongodb-replicaset
    helmfile delete --purge
}

main(){
    if [ -z "$KEEP_W3F_MONGO_EXPRESS" ]; then
        trap teardown EXIT
    fi

    helm install --set replicaSetName=otv --set replicas=2 mongodb-replicaset stable/mongodb-replicaset

    source /scripts/build-helmfile.sh

    run_tests
}

main
