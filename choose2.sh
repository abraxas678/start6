#!/bin/bash
x=0
echo
sudo tput sc
while [[ $x -eq 0 ]]; do
  sudo tput civis
  sudo tput rc
  read -n1 myc1
  read -n1 -t 1 myc2
  myc="$myc1$myc2"
  [[ $myc -lt 99 ]] && x=1 || myc="" && x=0
  re='^[0-9]+$'
  if ! [[ $myc =~ $re ]] ; then
    x=0
sudo tput rc;
sudo tput ed; sudo tput cnorm
sudo tput cuu1; 
sudo tput setaf 160; echo ">>> $myc"
sudo tput rc; sleep 1
sudo tput ed
  else
    x=1
  fi
  sleep 0.1
done
echo $myc > myc
