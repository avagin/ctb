set -e -m
nice -n 10 ./netns-bomb.sh $1 &
pid=$!
for i in `seq 5`; do
	sleep 1;
	echo Create a new netns
	time unshare -Urn true
done
