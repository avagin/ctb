JOBS ?= 512
run:
	unshare -Urfpm --mount-proc ./run.sh ${JOBS}

perf:
	time -f '%E' unshare -Urfpm ./netns-creator.sh 1024
	sleep 0.1
	time -f '%E' unshare -Urn true
