mount -t tmpfs xxx /mnt
mount --make-shared /mnt
for i in `seq 30`; do mount --bind /mnt `mktemp -d /mnt/test.XXXXXX` & done
umount -l /mnt
