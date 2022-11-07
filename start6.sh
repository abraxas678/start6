#!/bin/bash
echo; echo "NEW SERVER SETUP"; echo
read -p "WSL? (y/n): >> " wsl
if [[ $wsl = "y" ]]; then
  echo change host name
else
  echo change host name
fi
HOST_NAME=$1
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --ssh
tailscale ip
tailscale status
curl "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?apikey=304c57b5ddbd4c10b03b76fa97d44559&deviceNames=razer&url=https%3A%2F%2Flogin.tailscale.com%2Fadmin%2Fmachines"
echo
read -p "BUTTON to continue when you changd the tailscale name" me
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /home/abraxas/.profile
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/abraxas/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
brew install gcc
brew install pueue
brew install ghq
