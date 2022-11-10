#!/bin/bash
cd /home/abraxas/myq/service
#if [[ $(hostname) = *"hvubu4"* ]]; then
#  curl -d "YES $(hostname)" https://n.yyps.de/alert
#fi
curl -d "YES3 $(hostname)" https://n.yyps.de/alert
curl https://$HC_ROOT/ping/$HC_PING_KEY/$(hostname)

