#!/usr/bin/env bash
pkg update -y
pkg upgrade -y
pkg install python -y
pkg install python2 -y
pkg install git -y
pip install lolcat
pkg install curl -y
pkg install php -y
git clone https://github.com/noob-hackers/hacklock
cd hacklock
chmod +x *
clear
bash hacklock.sh
