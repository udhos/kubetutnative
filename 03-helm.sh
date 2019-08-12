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
msg intall helm, run tiller, then check:
msg
run 'export HELM_HOST=localhost:44134 ;# tiller running on :44134'
run helm version
msg
msg deploy demo using helm:
msg
run helm install --name demo lib/demo-helm
msg
msg helm terms:
msg  chart: package containing all resource definitions
msg  repository: place where charts can be collected and shared
msg  release: instance of a chart running in a cluster
msg           each release has a unique name which you specify
msg            with the --name flag to helm install
msg
run helm list
msg
run helm status demo
msg
msg search helm charts - public helm charts: https://github.com/helm/charts
msg
run helm search redis
msg
run 'helm search ;# list all charts'
msg
run helm delete demo
msg
run helm list
msg
msg hit ENTER to continue
read i

