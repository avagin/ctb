set -e -m

mount -t tmpfs zdtm /mnt
mkdir -p /mnt/1 /mnt/2
mount -t tmpfs zdtm /mnt/1
mount --make-shared /mnt/1

iteration=30
if [ -n "$1" ]; then
	iteration=$1
fi

for i in `seq $iteration`; do
	mount --bind /mnt/1 `mktemp -d /mnt/1/test.XXXXXX` &
done

ret=0
for i in `seq $iteration`; do
	wait -n || ret=1
done

[ "$ret" -ne 0 ] && {
	time umount -l /mnt/1
	exit 0
}

mount --rbind /mnt/1 /mnt/2
nr=`cat /proc/self/mountinfo | grep zdtm | wc -l`
echo -n "umount -l /mnt/1 -> $nr	"
/usr/bin/time -f '%E' umount -l /mnt/1
umount /mnt/2
