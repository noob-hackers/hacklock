cd $HOME/hacklock/core/update                                                                                          
update(){                                                                                                             
if wget --spider https://raw.githubusercontent.com/noob-hackers/patchupdateznh/main/hacklockpatch.v.1 2>/dev/null; then
cd $HOME/hacklock/core/update 
rm *.txt
echo "pin" > patch.txt
else
clear
echo
echo
echo
echo
echo
echo
echo
echo
echo -e "\e[92m          HACKLOCK LATEST \e[91mNO PATCH AVAILABLE FOR NOW...!\e[92m\e[0m"
echo -e "\e[96m                ╔═══════════════════════════════════╗\e[0m"
echo -e "\e[96m                ║       \e[93mHACKLOCK\e[96m Uptodate\e[93m V1.2\e[96m      ║\e[0m"
echo -e "\e[96m                ║        No Patch \e[93mIs Available\e[96m      ║\e[0m"
echo -e "\e[96m                ║                                   ║\e[0m"
echo -e "\e[96m                ╚═══════════════════════════════════╝\e[0m"
echo
echo
echo
echo
echo
sleep 5.0
cd $HOME/hacklock
bash hacklock.sh
fi
}
update
 
option(){
if [ -f "$HOME/hacklock/core/update/patch.txt" ];then
$dbox
else
echo
fi
}
option
 
dbox(){
clear
echo
echo
echo
echo
echo
echo
echo
echo
echo -e "\e[92m                HACKLOCK LATEST PATCH V1 IS AVAILABLE\e[0m"
echo -e "\e[96m                ╔═══════════════════════════════════╗\e[0m"
echo -e "\e[96m                ║  \e[93mHACKLOCK\e[96m Patch Is avaialbe\e[93m V1.0\e[96m  ║\e[0m"
echo -e "\e[96m                ║    To PAtch The \e[93mHACKLOCK\e[96m Tool     ║\e[0m"
echo -e "\e[96m                ║                                   ║\e[0m"
echo -e "\e[96m                ║         Select \e[92my\e[96m to update\e[96m        ║\e[0m"
echo -e "\e[96m                ║                (\e[93mOR\e[96m)               \e[96m║\e[0m"
echo -e "\e[96m                ║        Select \e[91mt\e[96m to terminate\e[96m      ║\e[0m"
echo -e "\e[96m                ╚═══════════════════════════════════╝\e[0m"
echo
echo
echo
echo
echo
echo -en "\e[32mSELECT OPTION [\e[93my/\e[93mt\e[32m]\e[96m: \e[0m "
read patcher
if [ $updater = y ];then
clear
sleep 0.5
cd $HOME
sleep 1
echo -e "         \e[96mPATCH IS GOING ON, PLEASE WAIT FOR A WHILE...!\e[0m"
echo
printf "                     \e[96m["
# While process is running...
while git clone https://github.com/noob-hackers/patchupdateznh 2> /dev/null; do 
    printf  "\e[92m▓▓▓▓▓▓▓▓▓▓▓▓▓\e[0m"
    sleep 1
done
printf "\e[96m]\e[0m"
echo
echo
echo
printf "\e[96m                    PATCH IS GOING ON (v1.3)..!\e[0m"
sleep 2.0
cd $HOME/patchupdateznh
bash setup
elif [ $updater = t ];then
clear
echo -e "                   \e[96mPATCH TERMINATED......!\e[0m"
sleep 4.0
cd $HOME/hacklock
bash hacklock.sh
else
clear
echo -e "                   \e[96mREBOOTING HACKLOCK......!\e[0m"
sleep 4.0
cd $HOME/hacklock
bash hacklock.sh
echo
fi
}
dbox