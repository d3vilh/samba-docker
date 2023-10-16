#!/bin/bash
echo "adding group samba with gid $GID"
addgroup -g $GID samba > /dev/null 2&>1
echo "adding user $USERNAME with uid $UID"
adduser -S -G samba -u $UID -H -D $USERNAME
echo "setting password ($PASSWORD) for user $USERNAME"
echo "$PASSWORD" | tee - | smbpasswd -s -c /etc/samba/smb.conf -a $USERNAME

echo "starting nmbd"
nmbd --foreground --no-process-group --log-stdout
echo "starting smbd"
smbd --foreground --no-process-group --log-stdout