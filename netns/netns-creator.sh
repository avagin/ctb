#!/bin/sh

set -e

free -m
mkdir -p netns
mount -t tmpfs netns netns
for i in `seq $1`; do
	touch netns/$i
	unshare -n -- mount --bind /proc/self/ns/net netns/$i || break
done
free -m
umount -l netns
