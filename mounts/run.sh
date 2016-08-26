set -m -e

iteration=30
if [ -n "$1" ]; then
	iteration=$1
fi

mount -t tmpfs xxx /mnt
mount --make-shared /mnt

for i in `seq $iteration`; do
	mount --bind /mnt `mktemp -d /mnt/test.XXXXXX` &
done
wait

cat /proc/self/mountinfo | grep /mnt | wc -l
time umount -l /mnt
