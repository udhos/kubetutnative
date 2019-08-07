#!/bin/bash

me=$(basename "$0")

msg() {
    echo >&2 "$me:" "$@"
}

die() {
	msg "$@"
	exit 1
}

run() {
        msg run: "$@"
}

msg
msg run deployment:
msg
run kubectl apply -f lib/demo/deployment.yaml 
msg
run kubectl get pods --selector app=demo
msg
run kubectl get deployments --selector app=demo
msg
msg create service for deployment:
msg
run kubectl apply -f lib/demo/service.yaml
msg
run kubectl describe services/demo
msg
msg forward port from local machine to service:
msg
run kubectl port-forward services/demo 9999:9999 --address 0.0.0.0
msg
run curl localhost:9999
msg
msg get resources deployments/services created:
msg
run kubectl get all --selector app=demo
msg OR
run kubectl get -f lib/demo
msg
msg clean up everything:
msg
run kubectl delete --selector app=demo
msg OR
run kubectl delete -f lib/demo
msg
msg hit ENTER to continue
read i

