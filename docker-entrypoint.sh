#!/bin/sh

set -e

DEFAULT_UID=`id -u $USER_APP`
DEFAULT_GID=`id -g $USER_APP`

if [ -n "$PUID" -a "$DEFAULT_UID" != "$PUID" ]; then
    echo Changing the UID of $USER_APP from $DEFAULT_UID to $PUID
    command usermod && usermod -u "$PUID" "$USER_APP" || sed -i "s/\($USER_APP:[^:]:\)$DEFAULT_UID:/\1$PUID:/g" /etc/passwd
    find / -xdev -user ${DEFAULT_UID} -exec chown ${PUID} {} \;
fi

if [ -n "$PGID" -a "$DEFAULT_GID" != "$PGID" ]; then
    echo Changing the GID of $GROUP_APP from $DEFAULT_GID to $PGID

    if [ "$(command groupmod)" ]; then
        groupmod -g "$PGID" "$GROUP_APP"
    else
        sed -i "s/\($GROUP_APP:[^:]:\)$DEFAULT_GID:/\1$PGID:/g" /etc/group
        sed -i "s/\([^:]*:[^:]:[^:]*:\)$DEFAULT_GID:/\1$PGID:/g" /etc/passwd
    fi
    find / -xdev -group ${DEFAULT_GID} -exec chgrp ${PGID} {} \;
fi

echo Executing $@ -Duser.country=$COUNTRY
su-exec "$USER_APP" $@ -Duser.country=$COUNTRY -Duser.timezone=$TIMEZONE -jar /home/jdownloader/JDownloader.jar -norestart