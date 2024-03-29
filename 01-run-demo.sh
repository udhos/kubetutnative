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
msg run demo:
msg
msg See: kubectl run - https://kubernetes.io/docs/reference/kubectl/conventions/
msg
run 'DEPRECATED: kubectl run demo --image=udhos/myhello --port=9999 --labels app=demo'
msg
run kubectl run demo --generator=run-pod/v1 --image=udhos/myhello --port=9999 --labels app=demo
msg
run kubectl get pods --selector app=demo
msg OR
run kubectl get all --selector app=demo
msg
run '"kubectl run" is DEPRECATED for deployments: kubectl port-forward deploy/demo 9999:8888 --address 0.0.0.0'
msg
run kubectl port-forward pods/demo 9999:8888 --address 0.0.0.0
msg
run curl localhost:9999
msg
run '"kubectl run" is DEPRECATED for deployments: kubectl delete deployments/demo'
msg
run kubectl delete pods/demo
msg OR
run kubectl delete pods --selector app=demo
msg OR
run kubectl delete all --selector app=demo
msg
msg hit ENTER to continue
read i

