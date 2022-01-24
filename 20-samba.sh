#!/bin/sh

# variables

username="user"
password="password"
share_name="Shared"
DRIVE="sda1"
container_name="samba"

# mounting and creating shared file if it doesn't exit

if [ ! -d /mnt/drive ]; then
    mkdir /mnt/drive
    mount /dev/$DRIVE /mnt/drive
fi

FILE=/mnt/drive/share

if [ ! -d "$FILE" ]; then
    mkdir $FILE
    chmod 7777 $FILE
fi

# starting the container

if [ "$(podman ps -a -q -f name=${container_name})" ]; then
  podman kill ${container_name}
  podman rm ${container_name}
fi

podman run --name ${container_name} -p 139:139 -p 445:445 -p 137:137/udp -p 138:138/udp -v "$FILE:/share:Z" -d dperson/samba -n -u "${username};${password}" -s "${share_name};/share;yes;no;no;all;none;none;Shared files" -p -g "fruit:model = MacPro7,1@ECOLOR=226,226,224" -g "fruit:resource = xattr" -g "fruit:metadata = stream"
