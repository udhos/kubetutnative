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

msg run app 'demo' in a namespace 'demo'
msg
msg resource ResourceQuota sets a hard limit of 100 pods
msg  running at once. it affects the namespace you apply
msg  it to (-n <namespace>).
msg
run more lib/demo-namespace/resourcequota.yaml
msg
msg create namespace 'demo':
msg
run kubectl apply -f lib/demo-namespace/namespace.yaml
msg
msg create resources on namespace 'demo':
msg
run kubectl apply -f lib/demo-namespace -n demo
msg
run kubectl get namespaces
msg
run kubectl get all -n demo
msg
run kubectl describe resourcequotas -n demo
msg
msg CAUTION: deleting a namespace deletes all its resources!!!
msg
run kubectl delete -f lib/demo-namespace/namespace.yaml
msg OR
run kubectl delete namespace demo
msg
msg hit ENTER to continue
read i

