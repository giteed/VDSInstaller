   #------------------------------------
	  # Информация о версии скрипта VDSetup
	  #------------------------------------ 
	  
	function ver() 
	{ 
	   source ~/.bashrc ; #css ; 
	   echo -e "\n $(Version_vdsetup)" ;
	}

   
   #------------------------------------
	  # Cтатус "Debug"
	  #------------------------------------ 
	  
	function ds() 
	{ 
	   #css ;
	   source ~/.bashrc ; #css ; 
	   echo -e "\n ${msg_debug_stat}" ;
	}


   #------------------------------------
	  # Version_vdsetup
	  #------------------------------------ 
	  
	function Version_vdsetup()
	  {
		 echo -e "Ver: preloader 1.0"  #| bat -l nix ) #|| $( echo -e "${RED}Ver${NC}: GH-1.0.0${NC}" ) 
	  }
	
	
     	 debug_stat=$(cat /root/.debug.txt 2>/dev/null) ;
		 
		 if [[ $debug_stat == '1' ]] 
			then msg_debug_stat=$(echo -e "${GREEN}Debugger enabled${NC}") ;
			else msg_debug_stat=$(echo -e "${BLACK}Debugger disabled${NC}") ;
		 fi ;
   
   function dsm_en()
   {
	  echo -e "\n $(black_U23A7) $(green_star) Debugger enabled" ;
	  echo -e " $(black_U23A9) $(green_tick) run: vdsetup -d0 to disabled Debug.\n" ;
	  source ~/.bashrc ;
   }
   
   function dsm_dis()
   {
	  echo -e "\n $(black_U23A7) $(green_star) Debugger disabled" ;
	  echo -e " $(black_U23A9) $(green_tick) run: vdsetup -d1 to enabled Debug.\n" ; 
	  source ~/.bashrc ;
   }
   
   function dsm()
   {
	  if [[ $debug_stat == '1' ]] 
	  then source ~/.bashrc ; dsm_en ;
	  else source ~/.bashrc ; dsm_dis ;
	  fi ;
   }
   
   
   #------------------------------------
	  # script_name debug
	  #------------------------------------   
	  
	function debug()
	  {
		 
		 function debug_1_on()
		 {
			path_n=$0
			# echo -e "Debugger status is $debug_stat" ;
			
			echo -e "        $(black_U23A7    ) " ;
			echo -e "       $(red_star)$(red_1          ) ${NC}!${NC}${BLACK}#${RED} ---------------${BLACK}Debug${RED}--------------- ${BLACK}#${NC}!" ;
			echo -en "       $(red_star)$(ellow_1       )  ${BLACK}Path ......${NC}: " ; echo -e "${NC}$(pwd)" ;
			echo -e "       $(red_star)$(ellow_1        )  ${BLACK}Script Name${NC}:${GREEN} "$0" ${NC}" ;
			echo -e "       $(red_star)$(ellow_1        )  ${BLACK}Date ......${NC}: "$(date)" ${NC}" ;
			echo -e "       $(red_star)$(ellow_1        ) " ; ( ( ( ps aux | grep $path_n ) | bat -l nix -p ) 2>/dev/null || ps aux | grep $path_n ) ;
			echo -e "       $(red_star)$(ellow_1        ) " ;
			echo -e "        $(black_U23A9    ) \n" ;
		 }
		 
		 function debug_0_off()
		 {
		  +x #echo -e "Debugger status is $debug_stat" ;
		 }
		 
		 function debug_check_status()
		 {
			
			
		 if [[ $debug_stat == "1" ]]
			then debug_1_on ;
			else debug_0_off
		 fi ;
		 }
		 
		 debug_check_status ;
		 
	  }
   
   #------------------------------------
	  # script_name
	  #------------------------------------  
	  
	function script_name() 
	{ 
	  (debug ;) 2>/dev/null ; 
	}


   

   #------------------------------------
	  # баннер
	  #------------------------------------
	  
	  function RED_VER()
	  {
		 echo -e "${RED}$(Version_vdsetup) $(red_U0023) vsync ${red}\e[5m!\e[0m${NC}"
	  }
	  
	  function GREEN_VER()
	  {
		 source ~/.bashrc ;
		 echo -e "${green}$(Version_vdsetup) $(red_U0023) vdsetup sync${NC}"
		 
	  }
	  
	  function Version_vdsetup_Ver_RED_or_GREEN()
	  {
		 cd /tmp/ ; wget -q  -O .ver.txt https://raw.githubusercontent.com/giteed/VDSInstaller/main/.ver.txt ;
		 
		 new_V=$(cat /tmp/.ver.txt)
		 current_V=$(cat ~/.ver.txt)
		 
		 if [ ${new_V} != ${current_V} ] 
		 then echo -e "$(RED_VER)" ;
		 
		 else 
		 echo -e "$(GREEN_VER)" ;
		 
		 fi 
	  
   }
	  
   function hip() # host/ip
		 {
			
			tor_ip="${green}TOR${NC} ip: ${green}$(curl -s --socks5 127.0.0.1:${tor_port} icanhazip.com)${NC}"
			tor_Socks5_ip_port=" | ${green}TOR Socks5${NC}: 127.0.0.1 ${green}port${NC}: $tor_port"
			
			
			
			if [[ $tor_port == "" ]] ; then tor_ip="" ; fi
			if [[ $tor_ip == "" ]] ; then tor_Socks5_ip_port="" ; fi
			
		  
			
			
			echo -e "${NC} ¯\_("$RED"ツ"${NC}")_/¯  :  ${gray}$(cat /etc/redhat-release)"
			echo -e "${green} Host ${white} Name  : ${RED} ${HOSTNAME}"${NC} ${tor_Socks5_ip_port}
			echo -e "${green} Server ${white} ip  : ${gray} $(ifconfig_real_ip) ${white} ${tor_ip}"
			
		   
		 }
   
	  #------------------------------------
	  # баннер
	  #------------------------------------
   
   function css() 
	  { 
		 
		 Version_vdsetup &>/dev/null ;
		 echo -en "$( clear && source ~/.bashrc && hip )\n ${RED}-${ellow}=---${ELLOW}=${ellow}-${GREEN}-${green}-${NC}-------------------------------------------------------------------------\n ${NC}$(green_tick) ${BLACK}VDSetup ${GREEN}version${NC}: $(Version_vdsetup_Ver_RED_or_GREEN)${NC}" ;  echo -e " ${msg_debug_stat}" ;
		 
		 
	  }
	  
	  
	  #-----------------------------------
	  # Цвета терминала
	  # https://www.shellhacks.com/bash-colors/
	  #-----------------------------------
		 NC='\e[0m' ; nc='\e[0m' ; WHITE='\e[1;1m' ; white='\e[0;0m' ; BLACK='\e[1;30m' ; black='\e[0;30m' ; RED='\e[1;31m' ; red='\e[0;31m' ; GREEN='\e[1;32m' ; green='\e[0;32m' ; ELLOW='\e[1;33m' ; ellow='\e[0;33m' ; PURPLE='\e[1;35m' ; purple='\e[0;35m' ; BLUE='\e[1;34m' ; blue='\e[0;34m'  ; CYAN='\e[1;36m' ; cyan='\e[0;36m' ; GRAY='\e[1;37m' ; gray='\e[0;37m' ; 
		 #-----------------------------------
		 # Дата: $D $T $Day $Month $Data $DMY
		 D=$(date  +%Y-%m-%d) ; T=$(date +%H:%M:%S) ; Day="$(echo -e $( date | awk '{ print $1 } '))" ; Month="$(echo -e $( date | awk '{ print $2 } '))" ; Data="$(echo -e $( date | awk '{ print $3 } '))" ; DMY="$(echo -e "${red}"$( date | awk '{ print $1, $2, $6 } ')"${NC}")" 
		 
		 # ФУНКЦИЯ: Мой ip
		 function mi() { wget -qO- icanhazip.com ; } ;
		 # ФУНКЦИЯ: User
		 function im() { whoami ; } ;
		 
   
   
	  #------------------------------------
	  # bat / no bat
	  #------------------------------------ 
	  if  [[ $lang == "" ]] ; then lang="nix" ; fi ;
	  function bpn_p_lang() {
		( echo -e "${ttb}" | bat --paging=never -l ${lang} -p 2>/dev/null || echo $ttb ) 
		 
	   }
	   
	  if  [[ $lang == "" ]] ; then lang="nix" ; fi ;
	  function bpal_p_lang() {
		( echo -e "${ttb}" | bat --paging=always -l ${lang} -p 2>/dev/null || echo $ttb ) 
		
	   }
	  
	  
	  
	  #------------------------------------
	  # my ip
	  #------------------------------------ 
   
   function myip() { echo -e "$( wget -qO- icanhazip.com )" ; }
   
   
	  #-----------------------------------
	  # Таблица символов Юникода
	  # https://unicode-table.com/ru/ 
	  #-----------------------------------
	  
			function not_found_MSG() { echo -e "${RED}✖ ${NC}Не найден" ; } ;
			function found_MSG() { echo -e "${GREEN}✓ Найден${NC}" ; } ;
			
			function error_MSG() { echo -e "${RED}✖ Error${NC}" ; } ;
			function error_exit_MSG() { echo -e "${RED}✖ Выход${NC} " ; exit 0 ; } ;
			function error_exit_en_MSG() { echo -e "${RED}✖ Exit${NC} " ; exit 0 ; } ;
			
			function green_tick() { echo -e "${GREEN}✓${NC}" ; } ;
			function green_tick_en() { echo -en "$(green_tick) " ; } ;
			
   
			
			
			
			function green_star() { echo -e "${GREEN}☆${NC}" ; } ;
			function red_star() { echo -e "${RED}☆${NC}" ; } ;
			
			function red_pipe() { echo -e "${RED}|${NC}" ; } ;
			function red_U0023() { echo -e "${RED}#${NC}" ; } ;
			
			function red_tick() { echo -e "${RED}✓${NC}" ; } ;
			function ellow_tick() { echo -e "${ELLOW}✓${NC}" ; } ;
			
			function red_cross() {  echo -e "${RED}✖${NC}" ; } ;
			
			function red_NO() { echo -e "${RED}NO${NC}" ; } ;
			function red_crash() { echo -e "${RED}✖ Crash${NC}" ; } ;
			
			function green_arrow() { echo -e "${GREEN}⤑${NC}" ; } ;
			
			function green_OK() { echo -e "${GREEN}OK${NC}" ; } ;
			
			
			function green_1() { echo -e "${GREEN}|${NC}" ; } ;
			function white_1() { echo -e "${WHITE}|${NC}" ; } ;
			function red_1() { echo -e "${RED}|${NC}" ; } ;
			function cyan_1() { echo -e "${CYAN}|${NC}" ; } ;
			function blue_1() { echo -e "${BLUE}|${NC}" ; } ;
			function ellow_1() { echo -e "${ELLOW}|${NC}" ; } ;
			function purple_1() { echo -e "${PURPLE}|${NC}" ; } ;
			function black_1() { echo -e "${BLACK}|${NC}" ; } ;
			
			function green_U23A6()  { echo -e "${green}⎬${NC}" ; } ;
			function purple_U23A6() { echo -e "${purple}⎬${NC}" ; } ;
			
			function black_U23A7() { echo -e "${BLACK}⎧${NC}" ; } ;
			function black_U23A9() { echo -e "${BLACK}⎩${NC}" ; } ;
			
			function green_n0() { echo -e "${GREEN}0${NC}" ; } ;
			function green_n1() { echo -e "${GREEN}1${NC}" ; } ;
			function green_n2() { echo -e "${GREEN}2${NC}" ; } ;
			function green_n3() { echo -e "${GREEN}3${NC}" ; } ;
			function green_n4() { echo -e "${GREEN}4${NC}" ; } ;
			function green_n5() { echo -e "${GREEN}5${NC}" ; } ;
			function green_n6() { echo -e "${GREEN}6${NC}" ; } ;
			function green_n7() { echo -e "${GREEN}7${NC}" ; } ;
			function green_n8() { echo -e "${GREEN}8${NC}" ; } ;
			function green_n9() { echo -e "${GREEN}9${NC}" ; } ;
			function green_n10() { echo -e "${GREEN}10${NC}" ; } ;
			
			function red_n1() { echo -e "${RED}1${NC}" ; } ;
			function red_n1() { echo -e "${RED}1${NC}" ; } ;
			function red_n2() { echo -e "${RED}2${NC}" ; } ;
			function red_n3() { echo -e "${RED}3${NC}" ; } ;
			function red_n4() { echo -e "${RED}4${NC}" ; } ;
			function red_n5() { echo -e "${RED}5${NC}" ; } ;
			function red_n6() { echo -e "${RED}6${NC}" ; } ;
			function red_n7() { echo -e "${RED}7${NC}" ; } ;
			function red_n8() { echo -e "${RED}8${NC}" ; } ;
			function red_n9() { echo -e "${RED}9${NC}" ; } ;
			function red_n10() { echo -e "${RED}10${NC}" ; } ;
			
			
   function green_star37()
	  {
		 echo -e "$(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) $(green_star) " ;
	  }



	echo ;
	script_name ;
	
	
	
	(rsync -avp --exclude '.git' --exclude '.DS_Store' /root/.VDSInstaller/ /root) &>/root/VDSInstaller.log ;
	
	
	function inesync()
	{
			ttb=$(echo -e "\n # Установка rsync rsync-daemon git mc gh." ) && lang="nix" && bpn_p_lang ;
	
	(dnf -y install rsync rsync-daemon git mc gh ; sudo systemctl start rsync ; sudo systemctl enable rsync ) &>/dev/null ;
	
		echo ;
	}

	
function cp_old() 
{
	ttb=$(echo -e " # Функция копирования предыдущих: .bash* файлов в: /tmp/ " ) && lang="nix" && bpn_p_lang ;
	ttb=$(echo -e " # Переход в домашний каталог (root). " ) && lang="nix" && bpn_p_lang ;
	
	(cd ~/) ; 
	ttb=$(echo -e " # Сохранение старых версий.  " ) && lang="nix" && bpn_p_lang ;
	
	yes | cp -Rf .bash_ali_hosts /tmp/.bash_ali_hosts_old ;
	yes | cp -Rf .bash_profile /tmp/.bash_profile_old ; 
	yes | cp -Rf .bash_aliases /tmp/.bash_aliases_old ; 
	yes | cp -Rf .bashrc /tmp/.bashrc_old 
	
	ttb=$(echo -e " # Создать каталог ~/root/bin если его нет. " ) && lang="nix" && bpn_p_lang ;
	(mkdir -p /root/bin) ; 

}

# Source global definitions
# --> Прочитать настройки из /etc/bashrc
. ~/.bashrc

# --> Прочитать настройки:
. ~/bin/utility/.debug_version_vdsetup.sh
. ~/bin/utility/.varfunc.sh
. ~/bin/utility/.css.sh
	
dsm ;
inesync ;
(cp_old) 2>/devnull ;

function gh_install()
{
	echo -e "\n $(black_U23A7 ) " ;
	echo -e " $(blue_1      ) GitHub (gh) не установлен!" ;
	echo -e " $(black_U23A9 ) " ; sleep 1 ;
	/root/bin/utility/github.sh 2>/dev/null ;
}
( (gh) &>/dev/null || gh_install )


# echo -e "\n # Перезагрузка ~/.bashrc " ;
#(source ~/.bashrc) ;
ttb=$(echo -e " # Перезагрузка ~/.bashrc введите: # source ~/.bashrc	 ") && lang="nix" && bpn_p_lang ;

echo ;
ttb=$(echo -e " # Установка VDSetup - переход к установке \n"  && lang="nix") && bpn_p_lang ;
sleep 0 ;
/root/bin/utility/installVDSetup.sh $1 ;


	
exit 0 ;
