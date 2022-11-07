#!/bin/bash
IFS=$'\n' 
mkdir $HOME/tmp >/dev/null 2>/dev/null
mkdir $HOME/tmp/sh >/dev/null 2>/dev/null
mkdir $HOME/tmp/sh/choose >/dev/null 2>/dev/null
sudo tput civis
### name always as last one
name=$(echo $@ | sed 's/.*name=//')
i=1; x=0
printf "choose:\t\n" >$HOME/tmp/sh/choose/choose.csv
myv=$(eval "echo \${$i}")
while [[ $x = 0 ]]; do
printf " [$i] $myv\t\n" >>$HOME/tmp/sh/choose/choose.csv
i=$((i+1))
myv=$(eval "echo \${$i}")
[[ $myv = "" || $myv = *"name="* ]] && x=1
done
[[ $@ = *"name="* ]] && $RICH --print "$($RICH $HOME/tmp/sh/choose/choose.csv)" --panel square --title "$name" --panel-style blue || $RICH $HOME/tmp/sh/choose/choose.csv
sudo tput sc; 
$HOME/bin/choose2.sh
#read -n 1 myc 
sudo tput rc; 
sudo tput cuu1; 
sudo tput ed; sudo tput cnorm
myc=$(cat myc)
sudo tput setaf 76
printf ">>> [$myc] "
output=$(cat $HOME/tmp/sh/choose/choose.csv | grep "\[$myc\]")
output=$(echo $output | sed 's/.*] //')
echo $output
sudo tput sgr0
rm -f myc
rm -f $HOME/tmp/sh/choose/choose.csv
