#!/bin/bash
# VERSION 0.1 by d3vilh@github.com aka Mr. Philipp
echo "Adding user $USERNAME with uid $UID"
adduser -S -G samba -u $UID -H -D $USERNAME
echo "Setting password for user $USERNAME" #($PASSWORD)"
echo "$PASSWORD" | tee - | smbpasswd -s -c /etc/samba/smb.conf -a $USERNAME

echo "Starting nmbd"
nmbd --foreground --no-process-group --debug-stdout &
echo "Starting smbd"
smbd --foreground --no-process-group --debug-stdout