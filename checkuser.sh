#!/bin/bash
clear
fun_bar () {
comando[0]="$1"
comando[1]="$2"
 (
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
 ) > /dev/null 2>&1 &
 tput civis
echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
while true; do
   for((i=0; i<18; i++)); do
   echo -ne "\033[1;31m#"
   sleep 0.1s
   done
   [[ -e $HOME/fim ]] && rm $HOME/fim && break
   echo -e "\033[1;33m]"
   sleep 1s
   tput cuu1
   tput dl1
   echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
done
echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
tput cnorm
}
cd
###############################################################################
clear
echo ""
echo -e "\E[44;1;37m   INSTALADOR CHECK USER ONLINE   \E[0m"
echo ""
echo -e "     \033[1;31mSTARTNET @startnetplus\033[1;36m"
echo ""
echo -e "\E[44;1;37m                                  \E[0m"
echo ""
cd
echo -ne "\033[1;33m●\033[1;32m DESEJA CONTINUAR\033[1;31m\033[1;32m\033[1;33m? \033[1;33m● \033[1;31m[s/n]: ";read resp
echo ""
clear
  if [[ "$resp" = @(n|N) ]]; then
  echo ""
  echo -e "\033[1;31m OK \033[1;32m FINALIZANDO INSTALACAO!\033[0m"
  rm -rf chkuser.sh > /dev/null 2>&1
  sleep 2
  clear
  clear; exit 1
fi
#############################
echo -ne "\n\033[1;32m  DIGITA SEU TOKEN\033[1;33m API\033[1;37m: "; read tokenapi
echo -e "\033[1;32mOK\033[1;37m"
echo -e "\n\033[1;36m  INICIANDO INSTALACAO \033[1;33m"
fun_update () {
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash && export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" && nvm install 16 && apt install git -y && git clone https://github.com/Penguinehis/dragoncheckbeta.git && cd dragoncheckbeta && npm i && screen -dmS api node v14.js --token=$tokenapi --port=2095
}
fun_bar 'fun_update'
cd
fun_install () {
    apt-get install nano -y > /dev/null 2>&1
}
fun_bar 'fun_install'
sleep 1
echo '#!/bin/bash' >> /root/node.sh
echo 'screen -dmS api /root/.nvm/versions/node/v16.14.2/bin/node /root/dragoncheckbeta/v14.js --token=token1 --port=2095' >> /root/node.sh
chmod 777 node.sh
sed -i "s;token1;$tokenapi;g" /root/node.sh
cd
echo '@reboot /root/node.sh' >> /etc/crontab
cd
sleep 3
rm -rf chkuser.sh
screen -R api
cat /dev/null > ~/.bash_history && history -c
cat /dev/null > ~/.bash_history && history -c
  sleep 2
  clear
  clear; exit 1
  
