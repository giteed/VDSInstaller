#!/bin/bash

# Source global definitions

# --> Прочитать настройки:
. /root/bin/utility/.css.sh &>/dev/null ;


# --> Использовать /root/.bash_ali*
. /root/.bash_aliases ;
. /root/.bash_ali_hosts ;
   
   

   function vsync()
   {
      /root/bin/utility/sync-no-msg.sh  ;
   }
   
   function press_enter_to_continue_or_any_key_to_cancel()
   {
         echo -en "\n     " ; ttb=$(echo -e "Press 'ENTER' to continue or 'ESC' to cancel...  \n") && lang="nix" && bpn_p_lang ;
         read -s answ ;
      if 
         [[ "$answ" == "" ]] 
      then 
         echo ;
      else 
         exit 0 ;
         
      fi
      
   }
   
   function epel_repo_Check_or_install() {
      
      yum_epel=epel.repo
      
      function msg_in1() {
         ttb=$(echo -e " $yum_epel успешно установлен.") && lang="nix" && bpn_p_lang ;
      }
      
      function msg_in2() {
         ttb=$(echo -e " Ошибка установки. $yum_epel") && lang="nix" && bpn_p_lang ;
      }
      
      function msg_in3() {
         ttb=$(echo -e " $yum_epel уже был установлен.") && lang="nix" && bpn_p_lang ;
      }
      
      
       [[ -z $( cat /etc/yum.repos.d/epel.repo ) ]] 2>/dev/null && ( yum install epel-release &>/dev/null && msg_in1 || msg_in2 ) || msg_in3 ;
       return ;
   }
   
   # Функция cash_var_sh_150_start_and_stop включает и отключает кеширование ip адреса тора и версии vdsetup на 150 секунд.
   function cash_var_sh_150_start_and_stop() {
        ( cash_var_sh_150 ) &>/dev/null 
        
        ps ax | awk '/[s]leep_kill/ { print $1 }' | xargs kill &>/dev/null 
        pkill -f "sleep_kill" &>/dev/null
        screen -wipe &>/dev/null 
        # ps ax | awk '/[s]nippet/ { print $1 }' | xargs kill (тоже рабочий вариант вместо snippet имя скрипта или программы)
       ( /usr/bin/screen -dmS sleep_kill /bin/bash /root/bin/utility/.sleep_kill.sh ) #&>/dev/null ; 
       return ;
       # killall -s KILL .sleep_kill.sh &>/dev/null & 
       # tldr screen ; echo ;
       # echo screen -r ;
       # echo screen -ls ;
    }
   
   # Функция удаляет юнит кеширования ip адреса тора и версии vdsetup
   # 
   function remove_unit_stop_cashing() {
      ${msg9} ;
      
      systemctl disable cash_var.service &>/dev/null || ttb=$(echo -e "\n Error disable Unit /etc/systemd/system/cash_var.service could not be found. \n") && bpn_p_lang  ;
      systemctl stop cash_var.service &>/dev/null ||  ttb=$(echo -e "\n Error stop Unit /etc/systemd/system/cash_var.service could not be found. \n") && bpn_p_lang  ;
      rm /etc/systemd/system/cash_var.service &>/dev/null || ttb=$(echo -e "\n Error remove Unit /etc/systemd/system/cash_var.service could not be found. \n") && bpn_p_lang  ;
      systemctl daemon-reload &>/dev/null ||  ttb=$(echo -e "\n Error daemon-reload \n") && bpn_p_lang  ;
    
      ttb=$(echo -e "\n Unit /etc/systemd/system/cash_var.service removed \n") && bpn_p_lang  ;
      #systemctl status cash_var.service 2>/dev/null;
      return ;
   }
   
   
 function start_http_server() {
     /root/bin/utility/file_to_http_start_stop.sh start ;
  }
 
 function stop_http_server() {
     /root/bin/utility/file_to_http_start_stop.sh stop ;
  }
  
  function status_http_server() {
      /root/bin/utility/file_to_http_start_stop.sh status ;
   }
 
 function start_light_server() {
      /root/bin/utility/file_to_light_server_start_stop.sh start ;
  }
  
  function stop_light_server() {
      /root/bin/utility/file_to_light_server_start_stop.sh stop ;
  }
  
  function status_light_server() {
        /root/bin/utility/file_to_light_server_start_stop.sh status ;
  }


   function open_port_and_services_firewall() {
       ttb=$(echo -e " \n  FirewallD инфо: (Открытые ports и services)\n" ;) && lang="passwd" && bpn_p_lang ;
       ttb=$( firewall-cmd --list-all | rg "(services|ports)" | rg -v "(forward|source)"  2>/dev/null ) && lang="passwd" && bpn_p_lang ;
   }
   
   
   
   
   
   #function press_enter_to_continue_or_ESC_to_cancel()
   
     #printf "Press 'ENTER' to continue or 'ESC' to cancel... "
     
   #function press_enter_to_continue_or_ESC_to_cancel() 
   #{
      
   #}

   

   
   
   function press_enter()
   {
      read -p "Press ENTER to continue $(echo -e $BLACK)(Ctrl+c to quit)" || read -p "Press ENTER to continue (Ctrl+c to quit)" ;
   }
   

   #read -n1 -r -p " Нажмите любую кнопку..." 
   function press_enter_or_cancel()
   {
      echo -en "                "$RED"# ${BLACK}PRESS ${NC}\"${ELLOW}ENTER${NC}\" ${green}to Continue ${NC}...\n\n${NC}     ${BLACK}... or ${NC}\"${cyan}any key${NC}\" ${GREEN}+ ${NC}\"${ellow}ENTER${NC}\" ${red}to Cancel.\n ${NC}"
      read yesno
      
      if [[ "$yesno" == "" ]]
      then echo ; test ;
         echo -e ;
      else 
         exit 0 ;
            
      fi ;
   }
   
   function press_anykey2()
   {
      #( read -n1 -r -p " $(echo -e $ELLOW)PRESS $(echo -e $NC)any key $(echo -e $ELLOW)to continue...$(echo -e "$NC \n")" ) ;
      ( read -n 1 -s -r -p " $(echo -e "$ELLOW\n")    Press $(echo -e $BLACK)any key ...$(echo -e "$NC \n")" ) ;
   }
    
    
   function press_anykey()
   {
     read -n1 -r -p "	$(ttb=$(echo -e "Press any key to continue...") && bpn_p_lang ) " ;
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
         stat -c '%a:%A %U %G %s %n' . .. * | numfmt --header --field 4 --from=iec --to=si | column -t | bat  --paging=never -l java -p ;
         return; 
      fi
      
      if [ "$1" == "." ]; 
         then 
         GLIG_ASTRX_OF ;
         echo -e "\n Запрос "$cyan""lk""$NC" c $NC\""$RED"."$NC"\" покажет все,\n включая cкрытые файлы и папки\n путь:"$ELLOW""$(pwd)""$NC"\n"
         stat -c '%a:%A %U %G %s %n' .* ** | numfmt --header --field 4 --from=iec --to=si | column -t | bat  --paging=never -l java -p ;
         return; 
      fi
      
         GLIG_ASTRX_OF ;
         echo -e "\n Вы можете выводить файлы и папки,\n используя маску. Пример: "$RED"# "$cyan"lk "$RED"*"$NC"e"$RED"*"$NC"\n путь:"$ELLOW""$(pwd)""$NC" \n"
         stat -c '%a:%A %U %G %s %n' $* | numfmt --header --field 4 --from=iec --to=si | column -t | bat  --paging=never -l java -p ;
   }
   
   #-----------------------------------
   
   # Поиск информации о программе. пример: ww hh
   #function ww() { type -a $* | bat  --paging=never -l nix -p ; echo ; yum info $1 | bat -p --paging=never -l nix ; }
   
   function ww() {
       
       function msg_ww() {
         
     ttb=$(echo -e "
 ⎧ Чтобы получить информацию сразу по двум командам: 
 | type -a [имя] и yum info [имя], используйте: 
 | # ww [имя_программы] или [имя_скрипта] или [имя_функции]
 ⎩ пример: # ww perl nginx ww ff htop mc
   ") && bpn_p_lang ;
   
   }  
   
    if [[ $1 == "" ]] ; then msg_ww && return ; fi ;
    echo ; ttb=$(type -a $*)  && bpn_p_lang 2>/dev/null ; echo ;
    echo ; ttb=$(yum info $*) && bpn_p_lang 2>/dev/null ; echo ;
   }
   
   

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
   
   function ifconfig_real_ip() 
   {
       ifconfig | grep -Eo 'inet ([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | head -n 1 ;
   }
   
   
   
   # Дополнительные сведения о системе
   function ii() 
   {
      echo -e "\n${cyan}Вы находитесь на ${green}$(hostname)$NC\n"
      hostnamectl | bat -l nix -p || hostnamectl ;
      echo -e "\nДополнительная информация:$NC " ; 
      echo -e "\n $( red_U0023 ) uname -a " ; 
      uname -a ;
      echo cat /etc/redhat-release ;
      cat /etc/redhat-release ;
      
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
   
   function wport() {
      
      function netstat_tulanp_nogrep() {
         ( echo -e "\n${green}$(netstat -tulanp | head --lines 2 | grep -v "Active Internet" )${NC}\n" ; netstat -tulanp | grep -v "Active Internet" | grep -v " Foreign Address" |  bat --paging=never -l nix -p ) || ( echo -e "\n${green}$(netstat -tulanp | head --lines 2 | grep -v "Active Internet" )${NC}\n" ; netstat -tulanp | grep -v "Active Internet" | grep -v " Foreign Address" ) ;
      }
      
      function netstat_tulanp() {
         
         ( echo -e "\n${green}$(netstat -tulanp | head --lines 2 | grep -v "Active Internet" )${NC}\n" ; netstat -tulanp | rg "$1" | bat --paging=never -l nix -p ) || ( echo -e "\n${green}$(netstat -tulanp | head --lines 2 | grep -v "Active Internet" )${NC}\n" ; netstat -tulanp | rg $1 ) ;
      }
      
      function help_wport() {
          echo -e "\n ${green}This function print${NC}:\n  netstat -tulanp | grep \"\$1\"\n\n ${green}Usage${NC}:\n  wport \"keyword\" or \":port\"\n  wport all or \"${red}.${NC}\"\n  wport :22\n  wport :80\n  wport tcp\n  wport udp\n  wport LISTEN\n  wport ESTABLISHED\n  wport 127.0.0.1 "
          # Usage: grep [OPTION]... PATTERN [FILE]...
      }
       if [[ $1 == "" ]] ; then help_wport && return ; fi ;
       if [[ $1 == "all" ]] ; then netstat_tulanp_nogrep && return ; fi ;
       if [[ $1 == "." ]] ; then netstat_tulanp_nogrep && return ; fi ;
       if [[ $1 == "-h" ]] ; then help_wport && return ; fi ;
       
       netstat_tulanp $1 ;
   }
   
   
   #-----------------------------------
   
   function memc() # Показать первые 10 прожорливых процессов CPU/RAM
   { 
      echo -en "\n${cyan}*** ${green}MEMORY RAM/SWAP ${RED}***$NC"; mem; echo -e "\n"${cyan}*** ${green}Top 25 RAM ${RED}"***$NC"; t25r ;
      echo -e "\n${cyan}*** ${green}Top 10 RAM ${RED}***$NC"; ttb=$(ps auxf | sort -nr -k 4 | head -10 ) && lang=bash && bpn_p_lang ;
      echo -e "\n${cyan}*** ${green}Top 10 CPU ${RED}***$NC"; ttb=$(ps auxf | sort -nr -k 3 | head -10 ) && lang=bash && bpn_p_lang ;
      echo -en "\n${cyan}*** ${green}FILE SYSTEM ${RED}***$NC"; df; 
      
      ttb=$(echo -e "\n # ps ax | awk '/[s]nippet/ { print $1 }' | xargs kill\n Убить процесс по имени ")&& lang=bash && bpn_p_lang ;
   }
   
   # Функция определяет port на котором работает ТОР, и назначает переменную tor_port которая потом используется
   # другими функциями vdsetup.
   function tor_port_ch() {
      lang_nix
       for test in 9150 9050 ''; do
           { >/dev/tcp/127.0.0.1/$test; } 2>/dev/null && { tor_port="$test"; break; }
           [ -z "$test" ] && ttb=$(echo -e "\n ⎧ ! Нет открытого Tor порта (9150 9050).\n ⎩ # systemctl start tor\n") && bpn_p_lang ;
       done
   }
   tor_port_ch &>/dev/null ;
   
   
   function tor_check_ip() {
      tor_port_ch ;
      /root/bin/utility/tor_check.sh ;
   }
   
   
   
   # Функция возвращает бекап файл /etc/wgetrc_old на прежнее место /etc/wgetrc (отключает использование прокси ТОР http://localhost:8118 ) "
   function wgetrc_config_revert() {
      
      function revert_MSG() {
         echo -e " $(black_U23A7 ) " ;
         echo -e " $(ellow_1     ) Отключить TOR Socks5 proxy для wget ${red}?${NC}" ;
         echo -e " $(white_1     ) "
         echo -e " $(ellow_1     ) wget будет настроен без TOR ${red}!${NC}" ;
         
         echo -e " $(ellow_1     ) Оригинал /etc/wgetrc будет заменен  " ;
         echo -e " $(ellow_1     ) сохраненным бекапом: /etc/wgetrc_old"
         echo -e " $(white_1     ) "
         echo -e " $(ellow_1     ) Вы можете в любой момент вернуть это обратно." ;
         echo -e " $(white_1     ) "
         echo -e " $(ellow_1     ) Включить или выключить для wget эти настройки: "
         echo -e " $(ellow_1     ) ${green}Включить${NC} : $(red_U0023) vdsetup ${green}wget-proxy-on${NC}"
         echo -e " $(ellow_1     ) ${red}Выключить${NC}: $(red_U0023) vdsetup ${red}wget-proxy-off${NC}"
         echo -e " $(black_U23A9 ) \n" ;
      }
      
      function not_found_wgetrc_old_MSG() {
          echo -e "\n ${not_found_MSG} Файл /etc/wgetrc_old не существует!"
      }
      
      
    if [[ -z /etc/wgetrc_old ]] ; then not_found_wgetrc_old_MSG ; else revert_MSG ; fi ;
      
      
      press_enter_to_continue_or_any_key_to_cancel ;
      
      
      function OK_wgetrc_old() {
         echo -e " $(black_U23A7 ) " ;
         echo -e " $(ellow_1     ) $(green_tick) Оригинал /etc/wgetrc заменен  " ;
         echo -e " $(ellow_1     ) сохраненным бекапом: /etc/wgetrc_old"
         echo -e " $(white_1     ) "
         echo -e " $(ellow_1     ) ${green}Включить${green} TOR Socks5 proxy${NC} для wget :"
         echo -e " $(ellow_1     ) $(red_U0023) vdsetup ${green}wget-proxy-on${NC}"
         echo -e " $(black_U23A9 ) \n" ;
      }
      
      cp -a /etc/wgetrc_old /etc/wgetrc && OK_wgetrc_old || not_found_wgetrc_old_MSG ;
      
   }
   
   function tor-restart() {
       /root/bin/utility/tor_installer.sh tor-restart
       
   }
   
   function tor-stop() {
       toriptables2.py -i ;
       toriptables2.py -f ;
       systemctl stop tor ;
       ttb=$(echo -e "\n Tor is now stopped\n") && bpn_p_lang ;
   }
   
   tcurl() {
      curl -x "socks5://127.0.0.1:${tsport}" \
      -A "Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101 Firefox/78.0" \
      -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" \
      -H "Accept-Language: en-US,en;q=0.5" \
      -H "Accept-Encoding: gzip, deflate" \
      -H "Connection: keep-alive" \
      -H "Upgrade-Insecure-Requests: 1" \
      -H "Expect:" --compressed "$@"
   }
   
   toriptables2.py() {
      /root/bin/utility/tor-for-all-sys-app.sh $1 ;
   }
   
   #-----------------------------------
   
   function lip-f() # local address
   {
      echo -e "\n"$green""internal"$NC":" " ;
      ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
      echo -e "$cyan""\nexternal"$NC":" ;
      myip ;
      
      echo -e "\n"$green""Privoxy TOR Socks5 127.0.0.1:9050"$NC":" " ;
      curl --socks5 127.0.0.1:9050 http://2ip.ua
   }
   
   #-----------------------------------
   
   # Если ali используется без аргументов == "" то просто alias, если ali с аргументами != "", то подставляются они после alias "$Val2"
   function ali() # alias | bat
   {
   
      if [ "$*" == "" ] ; 
         then Val1="" ;
         echo -e "$green""\n***"$NC" Все Алиасы $(whoami)"$green" ***"$NC"\n " ;
         ( alias | bat -p --paging=never -l .bash_aliases ) || ( alias ) ;
         return ;
      fi
         if [ "$*" != "" ] ; 
         then Val2="$*"
         echo -e "$green""\n***"$NC" Алиас "$cyan""$Val2""$NC" для $(whoami)"$green" ***"$NC"\n " ;
         alias "$Val2" | bat -p --paging=never -l .bash_aliases ||  ( alias "$Val2" ) ;
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
   
   
   function gkill() {
       /root/bin/utility/k-i-l-l_b-y_k-e-y-w-o-r-d.sh ;
   }
   
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
