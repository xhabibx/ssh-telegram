#!/usr/bin/env bash

# Insert your USERID @userinfobot and your KEY, grab it on @botfather
USERID="grab your userid from @userinfobot"
KEY="@botfather token"

URL="https://api.telegram.org/bot$KEY/sendMessage"
DATE="$(date "+%d %b %Y %H:%M")"

if [ -n "$SSH_CLIENT" ]; then
        CLIENT_IP=$(echo $SSH_CLIENT | awk '{print $1}')

        SRV_HOSTNAME=$(hostname -f)
        SRV_IP=$(hostname -I | awk '{print $1}')

        IPAPI="https://ipapi.co/$CLIENT_IP"

        TEXT="_New_ *connection* from *$CLIENT_IP* as _$USER _ on *$SRV_HOSTNAME* (*$SRV_IP*)
        Date: $DATE
        More informations: [$IPAPI]($IPAPI)"

        curl -s -d "chat_id=$USERID&text=$TEXT&disable_web_page_preview=true&parse_mode=markdown" $URL > /dev/null
fi
