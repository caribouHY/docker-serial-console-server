#!/bin/sh

USER_EXIST=`getent passwd $USER | wc -l`
if [ $USER_EXIST -eq 0 ]; then
    adduser -S $USER -s /usr/local/bin/console.sh -G dialout
    echo $USER:$PASSWORD | chpasswd
fi

if [ ! -e /etc/ssh/ssh_host_rsa_key ]; then
    /usr/bin/ssh-keygen -A
fi

/usr/sbin/sshd -D -e