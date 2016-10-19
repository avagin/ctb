#!/bin/bash

set -m -e

while :; do
	n=`jobs | wc -l`
	n=$(($1 - $n))
	for i in `seq $n`; do
		unshare -n true &
	done
	wait -n 1
done
