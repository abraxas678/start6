#!/bin/bash
mkdir /home/abraxas/myq/
cd /home/abraxas/myq/service
mkdir /home/abraxas/myq/service
[[ ! -f /home/abraxas/myq/service/1m.sh ]] && wget https://raw.githubusercontent.com/abraxas678/start6/master/1m.sh
cd /home/abraxas/myq
[[ ! -f /etc/systemd/system/1m.timer ]] && wget https://raw.githubusercontent.com/abraxas678/start6/master/1m.timer
if [[ ! -f /etc/systemd/system/1m.service ]];then
    wget https://raw.githubusercontent.com/abraxas678/start6/master/1m.service
   # echo "ExecStart=/home/abraxas/myq/service/1m.sh" >>1m.service
    $HOME/bin/sudo.sh cp 1m.service /etc/systemd/system/1m.service 
    $HOME/bin/sudo.sh cp 1m.timer /etc/systemd/system/1m.timer
    $HOME/bin/sudo.sh systemctl start 1m.timer
    $HOME/bin/sudo.sh systemctl enable 1m.timer
fi
  
#if [[ $(hostname) = *"hvubu4"* ]]; then
#  curl -d "YES $(hostname)" https://n.yyps.de/alert
#fi
  curl -d "YES2 $(hostname)" https://n.yyps.de/alert
rm -f 1m.service*
rm -f 1m.timer*
