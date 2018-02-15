#!/bin/sh
echo "============================================="
echo "Mounting SMB from $SERVERPATH to $MOUNTPOINT at $(date +%Y.%m.%d-%T)"

#export EnvVariable

function term_handler {
  unmount_smb
  echo "exiting now"
  exit 0
}

function unmount_smb {
  echo "Unmounting: $MOUNTPOINT $(date +%Y.%m.%d-%T)"
  umount $UMOUNTOPTIONS $MOUNTPOINT
  wait ${!}
  sleep 1
}

trap term_handler SIGHUP SIGINT SIGTERM

mount -t cifs -o $MOUNTOPTIONS $SERVERPATH $MOUNTPOINT

while true
do
sleep 10
done

exit 144