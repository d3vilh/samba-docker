#!/usr/bin/with-contenv sh
addgroup -g $GID samba > /dev/null 2&>1
adduser -S -G samba -u $UID -H -D $USERNAME
echo "$PASSWORD" | tee - | smbpasswd -s -c /etc/samba/smb.conf -a $USERNAME

nmbd --foreground --no-process-group --log-stdout
smbd --foreground --no-process-group --log-stdout