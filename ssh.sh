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
	CITY="$(curl -s https://ipapi.co/$CLIENT_IP/city | awk '{print $1}')"
	COUNTRY="$(curl -s https://ipapi.co/$CLIENT_IP/country | awk '{print $1}')"
        IPAPI="https://ipapi.co/$CLIENT_IP"
	ISP="$(curl -s https://ipapi.co/$CLIENT_IP/org | awk '{print $1}')"
        TEXT="_New_ *connection* from *$CLIENT_IP* as _$USER _ on *$SRV_HOSTNAME* (*$SRV_IP*)
        Date: $DATE
        Country: *$COUNTRY*
        City: _$CITY _
        ISP: *$ISP*
        More informations: [$IPAPI]($IPAPI)"
        curl -s -d "chat_id=$USERID&text=$TEXT&disable_web_page_preview=true&parse_mode=markdown" $URL > /dev/null
fi
