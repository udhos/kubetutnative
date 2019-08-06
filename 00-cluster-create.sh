#!/bin/bash
#
# https://github.com/udhos/kubetut

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

[ -n "$PROJECT" ] || die "missing env var PROJECT"
[ -n "$CLUSTER" ] || die "missing env var CLUSTER"

cat <<__EOF__
REGION=$REGION
ZONE=$ZONE
PROJECT=$PROJECT
CLUSTER=$CLUSTER
__EOF__

run gcloud config set project $PROJECT

if [ -n "$REGION" ]; then

msg REGION=[$REGION] create MULTI zone cluster:
msg
msg could use --node-locations to restrict zones:
msg --node-locations us-central1-b,us-central1-c
msg
run gcloud container clusters create $CLUSTER \
	--region=$REGION \
	--cluster-version=latest \
	--machine-type=n1-standard-1 \
	--enable-autoscaling --min-nodes=1 --max-nodes=3 \
	--num-nodes=1 \
	--enable-autorepair \
	--scopes=service-control,service-management,compute-rw,storage-ro,cloud-platform,logging-write,monitoring-write,pubsub,datastore
else

ZONE=us-central1-a
msg forcing ZONE=$ZONE
[ -n "$ZONE" ] || die "missing env var ZONE"

msg REGION=[$REGION] create SINGLE zone cluster:
msg
run gcloud container clusters create $CLUSTER \
	--zone=$ZONE \
	--cluster-version=latest \
	--machine-type=n1-standard-1 \
	--enable-autoscaling --min-nodes=1 --max-nodes=3 \
	--num-nodes=2 \
	--enable-autorepair \
	--scopes=service-control,service-management,compute-rw,storage-ro,cloud-platform,logging-write,monitoring-write,pubsub,datastore

fi

msg you can verify the cluster with:
msg
if [ -n "$REGION" ]; then
	run gcloud container clusters describe $CLUSTER --region=$REGION
else
	run gcloud container clusters describe $CLUSTER --zone=$ZONE
fi
msg
msg verify cluster version:
msg
run kubectl version
msg
msg verify cluster details:
msg
run kubectl cluster-info
msg
msg verify kube config:
msg
run 'kubectl config view ;# see also more ~/.kube/config'
msg
msg list nodes:
msg
run kubectl get nodes
msg
msg hit ENTER to continue
read i

