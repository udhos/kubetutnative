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
__EOF__

msg run this command to delete the cluster:
msg gcloud container clusters delete $CLUSTER
