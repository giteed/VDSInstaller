#!/bin/bash

#-----------------------------------
# Цвета терминала
#-----------------------------------
NC='\e[0m' ; WHITE='\e[1;0m' ; white='\e[0;0m' ; BLACK='\e[1;30m' ; black='\e[0;30m' ; RED='\e[1;31m' ; red='\e[0;31m' ; GREEN='\e[1;32m' ; green='\e[0;32m' ; ELLOW='\e[1;33m' ; ellow='\e[0;33m' ; PURPLE='\e[1;35m' ; purple='\e[0;35m' ; BLUE='\e[1;34m' ; blue='\e[0;34m'  ; CYAN='\e[1;36m' ; cyan='\e[0;36m' ; GRAY='\e[1;37m' ; gray='\e[0;37m' ; 
#-----------------------------------
# Дата: $D $T $Day $Month $Data $DMY
D=$(date  +%Y-%m-%d) ; T=$(date +%H:%M:%S) ; Day="$(echo -e $( date | awk '{ print $1 } '))" ; Month="$(echo -e $( date | awk '{ print $2 } '))" ; Data="$(echo -e $( date | awk '{ print $3 } '))" ; DMY="$(echo -e "${red}"$( date | awk '{ print $1, $2, $6 } ')"${NC}")" 
	
	# ФУНКЦИЯ: Мой ip
	function mi() { wget -qO- icanhazip.com ; } ;
	# ФУНКЦИЯ: User
	function im() { whoami ; } ;
	
	#-----------------------------------
	function myip() { echo -e "$( wget -qO- icanhazip.com )" ; }
	
   function Version_vdsetup()
   {
      $( echo -e "Ver: GH-1.0.0" ) #| bat -l nix ) #|| $( echo -e "${RED}Ver${NC}: GH-1.0.0${NC}" )
      
   }
   
   function css() 
   { 
      echo -e "$( clear && source ~/.bashrc && hip )\n  ${gray}(For update type: vdsetup -ghs)${NC}\n  ${RED}======${ELLOW}=${ellow}=${GREEN}=${green}=${NC}=====================================================================\n ${NC} $(red_star) VDSetup scripts $(Version_vdsetup)" 
   }
   
 
   
	# ################################
	# Таблица символов Юникода
	# https://unicode-table.com/ru/ 
	# ################################
	
   function red_pipe() { echo -e "${RED}|${NC}" ; } ;
   function red_U0023() { echo -e "${RED}#${NC}" ; } ;
   function black_U23A7() { echo -e "${BLACK}⎧${NC}" ; } ;
   function black_U23A9() { echo -e "${BLACK}⎩${NC}" ; } ;
   
   function purple_U23A6() { echo -e "${GREEN}⎬${NC}" ; } ;
   function purple_U23A4() { echo -e "${GREEN}⎬${NC}" ; } ;
   
   function green_OK() { echo -e "${GREEN}OK${NC}" ; } ;
   function red_NO() { echo -e "${RED}NO${NC}" ; } ;
   function red_crash() { echo -e "${RED}✖ Crash${NC}" ; } ;
   function not_found_MSG() { echo -e "${RED}✖ Не найден${NC}" ; } ;
   function found_MSG() { echo -e "${GREEN}✓ Найден${NC}" ; } ;
   function error_MSG() { echo -e "${RED}✖ Error${NC}" ; } ;
   function error_exit_MSG() { echo -e "${RED}✖ Выход${NC} " ; exit 0 ; } ;
   function green_tick() { echo -e "${GREEN}✓${NC}" ; } ;
   function red_tick() { echo -e "${RED}✓${NC}" ; } ;
   function ellow_tick() { echo -e "${ELLOW}✓${NC}" ; } ;
   function red_cross() {  echo -e "${RED}✖${NC}" ; } ;
   function green_arrow() { echo -e "${GREEN}⤑${NC}" ; } ;
   function green_star() { echo -e "${GREEN}☆${NC}" ; } ;
   function red_star() { echo -e "${RED}☆${NC}" ; } ;
   function green_1() { echo -e "${GREEN}|${NC}" ; } ;
   function white_1() { echo -e "${WHITE}|${NC}" ; } ;
   function red_1() { echo -e "${RED}|${NC}" ; } ;
   function cyan_1() { echo -e "${CYAN}|${NC}" ; } ;
   function blue_1() { echo -e "${BLUE}|${NC}" ; } ;
   function ellow_1() { echo -e "${ELLOW}|${NC}" ; } ;
   function purple_1() { echo -e "${PURPLE}|${NC}" ; } ;
   
   
   
   function green_star37()
   {
      echo -e "$(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) " ;
   }
   
   function press_enter()
   {
      echo -en "   <<< "$RED"# ${ELLOW}PRESS ENTER ${NC}to continue...\n\n       (or esc + enter to cancel) "
      read yesno
      
      if [[ "$yesno" == "" ]]
      then css ;
         echo -e ;
      else 
         exit 0 ;
            
      fi ;
   }

   
   
   #------------------------------------
   # Функции работы с файлами и системой
   #------------------------------------
   
   function fw_i()
   {
      echo -e " ${ELLOW}\n	FirewallD инфо: ${NC}(Открытые ports и services)${NC}" ;
      echo -e "	$(green_tick) $(red_U0023) firewall-cmd --list-all\n" ;
      ( firewall-cmd --list-all | rg "(services|ports)" | rg -v "(forward|source)"  2>/dev/null | bat --paging=never -l nix -p 2>/dev/null ; ) || ( firewall-cmd --list-all | grep -E "(services:|ports:)" | grep -v "(forward|source)" ;)
   }
   
   function netstat_i ()
   {
      echo -e "\n	$(green_tick) $(red_U0023) netstat -tupln | grep ssh" ;
      ( netstat -tupln | grep ssh ) | bat -l nix -p 2>/dev/null || ( netstat -tupln | grep ssh ) ;
   }
   
   
   function ff-f() 
   {
      fndvalue=$1;
      colvalue=("$RED"$1"$NC") ;
      
      if [ "$1" == "" ] ; 
         then GLIG_ASTRX_OF ;
         echo -e "\n Пустой запрос \""$cyan"ff"$NC"\" покажет все, кроме скрытых\n файлов и папок в:"$ELLOW" "$(pwd)" "$NC" \n"
         stat -c '%a/%A %U %G %n' . .. * | bat  --paging=never -l c -p ;
         return ; 
      fi
      
      
      if [ "$1" == "*" ] ; 
         then GLIG_ASTRX_OF ;
         echo -e " Запрос \""$cyan"ff"$NC"\" с \""$RED"*"$NC"\" выводит результат:\n "$RED"# "$cyan"tree -Csuh"$ELLOW""$(pwd)"/" "$NC"
         tree -Csuh | more ;
         return ; 
      fi
      
      if [ "$1" == "." ] ; 
         then GLIG_ASTRX_OF ; 
         echo -e " Запрос с \""$RED"."$NC"\" выведет результат:\n "$RED"# "$cyan"stat"$NC" -c '%a/%A %U %G %n' * \n"
         stat -c '%a/%A %U %G %n' * | bat  --paging=never -l log -p ;
         return ; 
      fi
      
      GLIG_ASTRX_OF ;
      echo -e "$cyan""\nfind "$gray"- поиск файлов в текущей папке совпадающих с: "$colvalue"\n " ;
      find $(pwd) \( -type f -iname "*""$fndvalue""*" \)  2>/dev/null | rg --hidden "$fndvalue" ;
      colvalue="" ;
      fndvalue="" ; 
   
   echo -e ""
   }
   
   #-----------------------------------
   
   # Листинг файлов/папок и их цифровых прав доступа:
   function lk-f-c() 
   { 
      # Convert KB To MB using Bash
      # https://stackoverflow.com/questions/19059944/convert-kb-to-mb-using-bash	
      # man numfmt
      
      if [ "$1" == "" ]; 
         then 
         GLIG_ASTRX_OF ;
         echo -e "path: "$ELLOW""$(pwd)""$NC"\n" ;
         stat -c '%a:%A %U %G %s %n' . .. * | numfmt --header --field 4 --from=iec --to=si | column -t | bat  --paging=never -l c -p ;
         return; 
      fi
      
      if [ "$1" == "." ]; 
         then 
         GLIG_ASTRX_OF ;
         echo -e "path: "$ELLOW""$(pwd)""$NC"\n" ;
         stat -c '%a:%A %U %G %s %n' .* ** | numfmt --header --field 4 --from=iec --to=si | column -t | bat  --paging=never -l c -p ;
         return; 
      fi
      
         GLIG_ASTRX_OF ;
         echo -e "path: "$ELLOW""$(pwd)""$NC"\n" ;
         stat -c '%a:%A %U %G %s %n' $* | numfmt --header --field 4 --from=iec --to=si | column -t | bat  --paging=never -l c -p ;
   }
   
   # Листинг файлов/папок и их цифровых прав доступа:
   function lk-f() 
   { 
      # Convert KB To MB using Bash
      # https://stackoverflow.com/questions/19059944/convert-kb-to-mb-using-bash	
      # man numfmt
      
      if [ "$1" == "" ]; 
         then 
         GLIG_ASTRX_OF ;
         echo -e "\n Пустой запрос "$cyan""lk""$NC" покажет все,\n кроме скрытых файлов и папок\n путь:"$ELLOW""$(pwd)""$NC"\n"
         stat -c '%a:%A %U %G %s %n' . .. * | numfmt --header --field 4 --from=iec --to=si | column -t | bat  --paging=never -l c -p ;
         return; 
      fi
      
      if [ "$1" == "." ]; 
         then 
         GLIG_ASTRX_OF ;
         echo -e "\n Запрос "$cyan""lk""$NC" c $NC\""$RED"."$NC"\" покажет все,\n включая cкрытые файлы и папки\n путь:"$ELLOW""$(pwd)""$NC"\n"
         stat -c '%a:%A %U %G %s %n' .* ** | numfmt --header --field 4 --from=iec --to=si | column -t | bat  --paging=never -l c -p ;
         return; 
      fi
      
         GLIG_ASTRX_OF ;
         echo -e "\n Вы можете выводить файлы и папки,\n используя маску. Пример: "$RED"# "$cyan"lk "$RED"*"$NC"e"$RED"*"$NC"\n путь:"$ELLOW""$(pwd)""$NC" \n"
         stat -c '%a:%A %U %G %s %n' $* | numfmt --header --field 4 --from=iec --to=si | column -t | bat  --paging=never -l c -p ;
   }
   
   #-----------------------------------
   
   # Поиск информации о программе. пример: ww hh
   function ww() { type -a $* | bat  --paging=never -l nix -p ; echo ; yum info $1 | bat -p --paging=never -l nix ; }
   
   #-----------------------------------
   
   function vpn-f() # Connect to VPN - help
   {
      echo -e  "\n ${cyan}vpn${CYAN}u ${NC}- start   unit: ${cyan}systemctl start ${NC}Connect_to_VPN-155.service" ;
      echo -e  " ${cyan}vpn${CYAN}s ${NC}- show  status: ${cyan}systemctl status ${NC}Connect_to_VPN-155.service" ;
      echo -e  " ${cyan}vpn${CYAN}d ${NC}- deactivating: ${cyan}systemctl stop ${NC}Connect_to_VPN-155.service" ; 
   }
   
   function vpnu() # Connect to VPN-155
   { 
      echo -e "\n ${cyan}vpn${CYAN}u ${NC}- start vpn unit: ${cyan}systemctl start ${NC}Connect_to_VPN-155.service\n" ;
      echo -e " ${NC}$(myip)" ;
      echo -e " ${GREEN}Connecting\n\n${NC} Please, wait..\n" ;
      systemctl start Connect_to_VPN-155.service && sleep 2 && echo -en "${CYAN} $(myip)\n ${GREEN}Done ${NC}\n" ; 
   }
   
   function vpns() # Status connections VPN-155
   { 
      echo -e  "\n ${cyan}vpn${CYAN}s ${NC}- show status: ${cyan}systemctl status ${NC}Connect_to_VPN-155.service" ;
      echo -e "${CYAN}\n $(myip)" && echo -e "${NC}" 
      systemctl status Connect_to_VPN-155.service ; 
   }
   
   function vpnd() # Stop unit VPN-155
   { 
      echo -e  "\n ${cyan}vpn${CYAN}d ${NC}- deactivating unit: ${cyan}systemctl stop ${NC}Connect_to_VPN-155.service\n" ; 
      echo -e " ${CYAN}$(myip)\n ${RED}Deactivating\n\n${NC} Please, wait..\n" && systemctl stop Connect_to_VPN-155.service && sleep 1 && echo -e "${NC} $(myip)\n ${GREEN}Done ${NC}" ; 
   }
   
   #-----------------------------------
   
   # Функции для работы с процессами/системой:
   function my_ip() # IP адрес
   {
      MY_L_IP=$(/sbin/ifconfig enp0s3 | awk '/inet/ { print $2 } ' | sed -e s/addr://)
      MY_L_VPN_IP=$(/sbin/ifconfig tun0 | awk '/inet/ { print $2 } ' | sed -e s/addr://)
      MY_I_VPN_IP=$(/sbin/ifconfig tun1 | awk '/inet/ { print $2 } ' | sed -e s/addr://)
      MY_P_IP=$(/sbin/ifconfig ppp0 | awk '/inet/ { print $2 } ' | sed -e s/addr://)
      MY_P_ISP=$(/sbin/ifconfig ppp0 | awk '/P-t-P/ { print $3 } ' | sed -e s/P-t-P://)
   }
   function allip() { hostname --all-ip-addresses ; }
   #-----------------------------------
   
   function ii() # Дополнительные сведения о системе
   {
      echo -e "\n${cyan}Вы находитесь на ${green}$(hostname)$NC\n"
      hostnamectl | bat -l nix -p || hostnamectl ;
      echo -e "\nДополнительная информация:$NC " ; echo -e "\n $( red_U0023 ) uname -a " ; uname -a | bat  --paging=never -l nix -p
      echo -e "\n${cyan}Дата:$NC " ; echo -e " $( red_U0023 ) date " ; date | bat  --paging=never -l nix -p
      echo -e "\n${cyan}Время, прошедшее с момента последней перезагрузки :$NC " ; echo -e "\n $( red_U0023 ) uptime " ; uptime | bat  --paging=never -l log -p ;
      echo -e "\n${cyan}В системе работают пользователи:$NC " ; echo -e "\n $( red_U0023 ) who" ; who ; 
       echo -e "\n $( red_U0023 ) lastf " ; lastf ;
      lastf -h ;
      echo -en "\n${cyan}Память:$NC "; mem ; echo -e "\nTop 25 RAM:"; t25r ;
      echo -en "\n\n${cyan}*** ${green}Файловая система: ${cyan}***$NC\n"; df ; echo ; echo ; echo -e " $( red_U0023 ) fdisk -l"; fdisk -l | bat  --paging=never -l nix -p ; echo -e "\n $( red_U0023 ) lsblk -pf " ; lsblk -pf | bat  --paging=never -l nix -p ; echo ; echo -e "\n $( red_U0023 ) mount | column -t" ; mount | column -t | bat  --paging=never -l nix -p ; 
      my_ip 2>&- ;
      echo -e "\n\n${cyan}*** ${green}Сетевые параметры ${cyan}***$NC";
      echo -e "\n${cyan}IP адрес:${green}(локальный)$NC" ; echo ${MY_L_IP:-"Соединение не установлено"}
      echo -e "\n${cyan}IP адрес:${green}(VPN локальный)$NC" ; echo ${MY_L_VPN_IP:-"Соединение не установлено"}
      echo -e "\n${cyan}IP адрес:${green}(VPN внешний)$NC" ; echo ${MY_I_VPN_IP:-"Соединение не установлено"}
      echo -e "\n${cyan}IP адрес:${green}(внешний)$NC" ; echo ${MY_P_IP:-"Соединение не установлено"}
      echo -e "\n${cyan}Адрес провайдера (ISP):$NC" ; echo ${MY_P_ISP:-"Соединение не установлено"}
      mi ;
      echo -e "\n $( red_U0023 ) hostname --all-ip-addresses\n ${cyan}или$NC\n $( red_U0023 ) hostname -I$NC${cyan},\n который делает то же самое (дает вам все IP-адреса хоста) " ; echo -e " $( red_U0023 ) nmcli dev show | grep DNS\n или\n $( red_U0023 ) resolvectl status | rg "DNS Server"\n покажет DNS$NC"
      echo -e "${RED} ------------------------------------------------- ${NC}" ;
      echo -en " " && allip ; echo -en "\n " ; nmcli dev show | grep DNS ;
         ( ( resolvectl status | rg "DNS Server" ) | bat --paging=never -l nix -p ) ;
      echo -e "\n${NC} Чтобы изменить или добавить dns сервера можно\n отредактировать файл /etc/systemd/resolved.conf\n и добавить нужные адреса в секцию Resolve:\n\n $( red_U0023 ) nano /etc/systemd/resolved.conf\n [Resolve]\n DNS=8.8.8.8, 8.8.4.4 ${NC}\n\n Или используете NetworkManager\n Трогать /etc/resolv.conf не желательно, так как\n он будет автоматически обновляться\n после перезагрузки сервера" ;
      echo -e "${RED} ------------------------------------------------- ${NC}\n" ;
      echo -e "\n $( red_U0023 ) ifconfig" ; ifc ;
      echo -e "\n $( red_U0023 ) netstat -in" ; netstat -in | bat --paging=never -l nix -p ;
      echo -e "\n $( red_U0023 ) netstat -tlpn" ; netstat -tlpn | bat --paging=never -l nix -p ;
      echo
      nmcli connection show
      echo
      nmcli device status
      echo -e "\n $( red_U0023 ) "$cyan" nmcli device show "$CYAN"enp0s3 "$NC" \n"
      nmcli device show enp0s3 2>/dev/null | rg "(DEVICE|TYPE|STATE|IP|CONNECTION)" | bat  --paging=never -l nix -p ;
      echo -e "\n $( red_U0023 ) "$cyan" nmcli device show "$CYAN"tun0 "$NC" \n"
      nmcli device show tun0 2>/dev/null | rg "(DEVICE|TYPE|STATE|IP|CONNECTION)" | bat  --paging=never -l nix -p ;
      echo -e "\n $( red_U0023 ) "$cyan" nmcli device show "$CYAN"tun1 "$NC" \n" ;
      nmcli device show tun1 2>/dev/null | rg "(DEVICE|TYPE|STATE|IP|CONNECTION)" | bat  --paging=never -l nix -p ;
      #nmcli -p -m multiline -f all con show
      echo -e "\n $( red_U0023 ) resolvectl status" ;
      ( ( resolvectl status ) &>/dev/null || ( systemctl start systemd-resolved.service && systemctl enable systemd-resolved.service &>/dev/null || echo -e "error starting or enabled systemd-resolved.service" ) ) && ( ( resolvectl status ) | bat --paging=never -l nix -p )
      echo -e "\n $( red_U0023 ) firewall-cmd --list-all"
      firewall-cmd --list-all | bat -p --paging=never -l nix;
      echo -e "\n $( red_U0023 ) lsof -i"
      lsof -i | bat  --paging=never -l nix -p ;
       echo -e "\n $( red_U0023 ) netstat -tup ( netstat -tulanp показать больше...)" ; netstat -tup | bat  --paging=never -l nix -p ;
      #zzz 10 0 1 10 ;
      
   }
   
   function TopRAM25()
      {
         
            echo -e " "
            ps axo rss,comm,pid \
         | awk '{ proc_list[$2]++; proc_list[$2 "," 1] += $1; } \
            END { for (proc in proc_list) { printf("%d\t%s\n", \
            proc_list[proc "," 1],proc); }}' | sort -n | tail -n 25 | sort -rn \
         | awk '{$1/=1024;printf "%.0fMB\t",$1}{print $2}'
      }
   
   function t25r()
   {
      TopRAM25 | bat -p -l c
   }
   
   
   #-----------------------------------
   
   function memc() # Показать первые 10 прожорливых процессов CPU/RAM
   { 
      echo -en "\n${cyan}*** ${green}MEMORY RAM/SWAP ${RED}***$NC"; mem; echo -e "\n"${cyan}*** ${green}Top 25 RAM ${RED}"***$NC"; t25r ;
      echo -e "\n${cyan}*** ${green}Top 10 RAM ${RED}***$NC"; ps auxf | sort -nr -k 4 | head -10 |bat  --paging=never -l bash -p;
      echo -e "\n${cyan}*** ${green}Top 10 CPU ${RED}***$NC"; ps auxf | sort -nr -k 3 | head -10 |bat  --paging=never -l bash -p;
      echo -en "\n${cyan}*** ${green}FILE SYSTEM ${RED}***$NC"; df; 
   }
   
   #-----------------------------------
   
   function hip() # host/ip
   {
      echo -en "          ¯\_("$RED"ツ"${NC}")_/¯"
      echo -e " ${NC}" && ip=$(wget -qO- icanhazip.com)
      echo -e " ${green} Host ${white} Name  : ${RED} ${HOSTNAME}"
      echo -e " ${green} Server ${white} ip  : ${gray} ${ip} ${white}"
      ip=''
   
   }
   
   #-----------------------------------
   
   function lip-f() # local address
   {
      echo -e "\n"$green""internal"$NC":" " ;
      ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
      echo -e "$cyan""\nexternal"$NC":" ;
      myip ;
   }
   
   #-----------------------------------
   
   function ali() # alias | bat
   {
   
      if [ "$*" == "" ] ; 
         then Val1="" ;
         echo -e "$green""\n***"$NC" Все Алиасы $(whoami)"$green" ***"$NC"\n " ;
         alias | bat -p --paging=never -l .bash_aliases ;
         return ;
      fi
         if [ "$*" != "" ] ; 
         then Val2="$*"
         echo -e "$green""\n***"$NC" Алиас "$cyan""$Val2""$NC" для $(whoami)"$green" ***"$NC"\n " ;
         alias "$Val2" | bat -p --paging=never -l .bash_aliases ;
         return ;
      fi	
      
   }
   
   #-----------------------------------
   
   function fbr() # Поиск и переключение репозитариев .git
   # в начале необходимо перейти репо в папке .git или .github 
   # (ссылка на статью: https://habr.com/ru/company/wrike/blog/344770/)
   # должен быть установлен fzf (brew install fzf)
   {
     local branches branch
     branches=$(git branch --all | grep -v HEAD) &&
     branch=$(echo "$branches" |
            fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
     git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
   }
   
   #-----------------------------------
   
   function fkill() # Убить процесс по неточному совадению - должен быть установлен fzf (brew install fzf)
   {
     local pid
     pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
   
     if [ "x$pid" != "x" ]
     then
      echo $pid | xargs kill -${1:-9}
     fi
   }
   
   function ypr-f() # Поиск программы/файла локально и в репо
      {
         case $1 in
         
         '*' | '.'| h | -h | --h | -help | --help | help | hel | he | -hel | --hel | -he | --he | '')
         
         echo -e "\n "$CYAN"ypr"$NC" - Совмещающает в себе для удобства\n набор следующих программ и утилит: \n "
         
         echo -e " "$cyan"yum provides"$NC" - Ищет программные пакеты\n совпадающие с запросом, в установленных на этом\n сервере репозитариях пакетного менеджера yum/dnf "
         echo -e " "$gray"Использование: "$CYAN"ypr"$NC" с ключём"$cyan" -p"$NC" или"$cyan" --provides"$NC" \n "
         
         echo -e " "$cyan"which"$NC" - Находит исполняемые файлы("$RED"x"$NC"), алиасы,\n функции, в переменой окружения "$ELLOW"\$PATH"$NC" "
         echo -e " "$gray"Использование: "$CYAN"ypr"$NC" с ключём"$cyan" -w"$NC" или"$cyan" --which"$NC" \n "
         
         echo -e " "$cyan"type"$NC" - В отличие от which, type НЕ осуществляет\n сразу поиск в переменой окружения "$ELLOW"\$PATH\n "$NC"type показывает  значение искомой команды или алиаса.  "
         echo -e " "$gray"Использование: "$CYAN"ypr"$NC" с ключём"$cyan" -t"$NC" или"$cyan" --type"$NC" \n "
         
         echo -e " "$cyan"whereis"$NC" - Ведет поиск в системных каталогах. "
         echo -e " "$gray"Использование: "$CYAN"ypr"$NC" с ключём"$cyan" -e"$NC" или"$cyan" --whereis"$NC" \n "
         
         echo -e " "$cyan"locate"$NC" - Ведет поиск файлов и папок, по базе данных,\n от "$ELLOW"/"$NC" совпадающих с ключевым словом."
         echo -e " "$gray"Использование: "$CYAN"ypr"$NC" с ключём"$cyan" -l"$NC" или"$cyan" --locate"$NC" \n "
         
         echo -e " "$CYAN"ypr"$NC" с ключём"$cyan" -a "$NC"или"$cyan" --all"$NC" или запрос без -ключа\n Будет искать используя все эти программы.\n "
         
         echo -e " "$CYAN"ypr"$NC" с ключём"$cyan" -h "$NC"или"$cyan" --help"$NC"\n Выводит эту справку. "
         
         ;;
         
         -a | -al | -all | --a | --al | --all)
         red_prgrm=("$RED""$2""$NC")
         echo -e "\n "$green"***"$NC" Локальное расположение: "$red_prgrm""$green" ***"$NC"\n"
         echo -e ""$gray" which - Находит исполняемые файлы("$RED"x"$NC")"$gray", алиасы, функции, в переменой окружения "$ELLOW"\$PATH"
         echo -en "$cyan"" which "
         echo -en "$NC""$2""$RED": "$NC"
         echo -en " "
         which -a  $2 | bat  --paging=never -l c -p
         echo -e "\n\n"$gray" type - В отличие от which, НЕ осуществляет сразу поиск в переменой окружения "$ELLOW"\$PATH"
         echo -e ""$gray" type - Показывает значение искомой команды или алиаса." 
         echo -en "$cyan"" type ""$NC"
         type -all $2 | bat  --paging=never -l c -p
         echo -e "\n "$gray"\n whereis - Ведет поиск в системных каталогах."
         echo -en "$cyan"" whereis ""$NC"
         whereis $2 | bat  --paging=never -l c -p
         echo -e ""$gray"\n\n locate - Ведет поиск файлов/папок, по базе данных на этом сервере, совпадающих с: "$red_prgrm" "
         echo -e ""$cyan" locate "$NC""$2""$RED": "$NC""
         stat -c '%a:%A %U %G %n' $( (locate "/$2") | (rg "/$2" | head -n 25 | rg "/$2") ) 2>/dev/null | column -t | bat  --paging=never -l c -p;
         echo -e ""$gray"\n "$CYAN"ypr "$gray"с ключём"$cyan" -a "$gray"или "$cyan"--all"$gray" - Выводит только "$RED"25"$gray" первых\n результатов поиска файлов/папок совпадающих с: "$red_prgrm"\n  "$gray"\n Используйте: "$CYAN"ypr"$NC" с ключём"$cyan" -l" "$red_prgrm"$NC" или "$CYAN"ypr"$NC" с ключём"$cyan" --locate" "$red_prgrm"$NC"\n "$gray"Для вывода всего списка совпадений в "$cyan"locate"$NC"."
         
         echo -e "\n\n"$green" ***"$NC" Репозитории предоставляющие программу: "$red_prgrm""$green" ***"$NC"\n"
         echo -e $(whatis $2) 2>/dev/null | bat -p --paging=never -l nix ;
         echo -e
         yum provides $2 ;
         echo
         yum info $2 | bat -p --paging=never -l nix ;
         unset red_prgrm
         
         ;;
         
         -p | --p | --provides | -s | --s | --search | -i | --i | --info )
         echo -e "\n"$green" ***"$NC" Репозитории предоставляющие программу: "$RED""$2""$green" ***"$NC"\n" ;
         echo -e " "$cyan"yum provides"$NC" - Ищет программные пакеты\n совпадающие с запросом, в установленных на этом\n сервере репозитариях пакетного менеджера yum/dnf\n "
         echo -en " "
         echo -e $(whatis $2) 2>/dev/null | bat -p --paging=never -l nix ;
         echo
         yum provides $2 | bat -p --paging=never -l nix ;
         echo 
         yum search $2 | bat -p --paging=never -l nix ;
         echo
         yum info $2 | bat -p --paging=never -l nix ;
         ;;
         
         -w | --w | --which)
         echo -e "\n "$green"***"$NC" Локальное расположение: "$RED""$2""$green" ***"$NC"\n"
         echo -e ""$gray" which - Находит исполняемые файлы("$RED"x"$NC")"$gray", алиасы, функции, в переменой окружения "$ELLOW"\$PATH"$NC"\n"
         echo -en " "
         echo -e $(whatis $2) 2>/dev/null | bat -p --paging=never -l nix ;
         echo
         echo -en "$cyan" "which "
         echo -en "$NC""$2""$RED": "$NC"
         which -a $2 | bat  --paging=never -l c -p ;
         ;;
         
         -t | --t | --type)
         echo -e "\n"$gray" type - В отличие от which, НЕ осуществляет сразу поиск в переменой окружения "$ELLOW"\$PATH"
         echo -e " "$gray"type - Показывает значение искомой команды или алиаса.\n" 
         echo -en " "
         echo -e $(whatis $2) 2>/dev/null | bat -p --paging=never -l nix ;
         echo
         echo -en "$cyan"" type ""$NC"
         type -all $2 | bat  --paging=never -l c -p
         ;;
         
         -e | --e | --whereis)
         echo -e ""$gray" \n whereis - Выводит результаты поиска в системных каталогах.\n"
         echo -en " "
         echo -e $(whatis $2) 2>/dev/null | bat -p --paging=never -l nix ;
         echo
         echo -en "$cyan"" whereis ""$NC"
         whereis $2 | bat  --paging=never -l c -p
         ;;
         
         -l | --l | --locate)
         red_prgrm=("$RED""$2""$NC")
         echo -e "\n "$green"***"$NC" Локальное расположение: "$RED""$2""$green" ***"$NC"\n"
         echo -e ""$gray" locate - Выводит полный список результов поиска файлов/папок,\n по базе данных на этом сервере, совпадающих с: "$red_prgrm"\n "
         echo -en " "
         echo -e $(whatis $2) 2>/dev/null | bat -p --paging=never -l nix ;
         echo
         echo -e ""$cyan"locate "$NC""$2""$RED": "$NC""
         stat -c '%a:%A %U %G %n' $( (locate "/$2") | (rg "/$2" | rg "/$2") ) 2>/dev/null | column -t | bat  --paging=never -l c -p;
         unset red_prgrm
         ;;
         
         
         -rl | --list | -list | --rl)
         red_prgrm=("$RED""$2""$NC")
         echo -e "\n "$green"***"$NC" REPO List: "$green" ***"$NC"\n"
         echo -e ""$gray" yum repolist\n по базе данных на этом сервере\n "
         echo -en " "
         yum repolist 2>/dev/null | bat -p --paging=never -l nix ;
         echo
         GLIG_ASTRX_OF ;
         echo -e "Содержимое папки /etc/yum.repos.d/\n"
         stat -c '%a:%A %U %G %n' /etc/yum.repos.d/* | column -t | bat  --paging=never -l nix -p ;
         unset red_prgrm
         ;;
         
         
         *)
         
         ;;
         esac 
         unset red_prgrm
      }
