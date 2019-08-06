#!/bin/bash

me=$(basename "$0")
msg() {
    echo >&2 "$me:" "$@"
}

die() {
	msg "$@"
	exit 1
}

[ -n "$CLUSTER" ] || die "missing env var CLUSTER"

cat <<__EOF__
CLUSTER=$CLUSTER
REGION=$REGION
ZONE=$ZONE
__EOF__

msg run this command to delete the cluster:

if [ -n "$REGION" ]; then
	msg gcloud container clusters delete $CLUSTER --region=$REGION
else
	[ -n "$ZONE" ] || die "missing env var ZONE"
	msg gcloud container clusters delete $CLUSTER --zone=$ZONE
fi
