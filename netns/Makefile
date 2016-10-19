JOBS ?= 512
NR ?= 1024
run:
	unshare -Urfpm --mount-proc ./run.sh ${JOBS}

perf:
	@echo "Create and destroy ${NR} namespaces"
	time -f '%E' unshare -Urfpm ./netns-creator.sh ${NR}
	time -f '%E' sh -c 'sleep 1; unshare -Urn true'
