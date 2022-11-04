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
			then msg_debug_stat=$(echo -e "${GREEN}Debug enabled${NC}") ;
			else msg_debug_stat=$(echo -e "${BLACK}Debug disabled${NC}") ;
		 fi ;
   
   function dsm_en()
   {
	  echo -e "\n $(black_U23A7) $(green_star) Debug enabled" ;
	  echo -e " $(black_U23A9) $(green_tick) run: vdsetup -d0 to disabled Debug.\n" ;
	  source ~/.bashrc ;
   }
   
   function dsm_dis()
   {
	  echo -e "\n $(black_U23A7) $(green_star) Debug disabled" ;
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
			# echo -e "debug status is $debug_stat" ;
			
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
		  +x #echo -e "debug status is $debug_stat" ;
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
   
   if [[ $debug_stat == '1' ]] 
	  then msg_debug_stat=$(echo -e "${GREEN}Debug enabled${NC}") ;
	  else msg_debug_stat=$(echo -e "${RED}Debug disabled${NC}") ;
   fi ;
   
function css() 
	  { 
		 Version_vdsetup &>/dev/null ;
		 echo -en "$( clear && source ~/.bashrc && hip )\n ${gray}(For update type: vdsetup -sync)${NC}\n ${RED}-${ellow}=---${ELLOW}=${ellow}-${GREEN}-${green}-${NC}-------------------------------------------------------------------------\n ${NC}$(green_tick) VDSetup scripts $(Version_vdsetup)" ;  echo -e " ${msg_debug_stat}" ;
		 
		  
	   
	  }
   
   #-----------------------------------
   
function hip() # host/ip
   {
	  echo -en "${NC}         ¯\_("$RED"ツ"${NC}")_/¯"
	  echo -e "${NC}" && ip=$(wget -qO- icanhazip.com)
	  echo -e "${green} Host ${white} Name  : ${RED} ${HOSTNAME}"
	  echo -e "${green} Server ${white} ip  : ${gray} ${ip} ${white}"
	  ip=''
   
   }

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
	  

   #------------------------------------
   # my ip
   #------------------------------------ 

function myip() { echo -e "$( wget -qO- icanhazip.com )" ; }

   #-----------------------------------
   # Таблица символов Юникода
   # https://unicode-table.com/ru/ 
   #-----------------------------------
   
		 function not_found_MSG() { echo -e "${RED}✖ Не найден${NC}" ; } ;
		 function found_MSG() { echo -e "${GREEN}✓ Найден${NC}" ; } ;
		 
		 function error_MSG() { echo -e "${RED}✖ Error${NC}" ; } ;
		 function error_exit_MSG() { echo -e "${RED}✖ Выход${NC} " ; exit 0 ; } ;
		 
		 function green_tick() { echo -e "${GREEN}✓${NC}" ; } ;
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
			echo -e "\n # Установка rsync rsync-daemon git mc gh." 
	
	(dnf -y install rsync rsync-daemon git mc gh ; sudo systemctl start rsync ; sudo systemctl enable rsync ) &>/dev/null ;
	
		echo ;
	}

	
function cp_old() 
{
	echo -e " # Функция копирования предыдущих: .bash* файлов в: /tmp/ " 
	echo -e " # Переход в домашний каталог (root). " 
	
	(cd ~/) ; 
	echo -e " # Сохранение старых версий.  " 
	
	yes | cp -Rf .bash_ali_hosts /tmp/.bash_ali_hosts_old ;
	yes | cp -Rf .bash_profile /tmp/.bash_profile_old ; 
	yes | cp -Rf .bash_aliases /tmp/.bash_aliases_old ; 
	yes | cp -Rf .bashrc /tmp/.bashrc_old 
	
	echo -e " # Создать каталог ~/root/bin если его нет. " 	
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
	echo -e " $(black_U23A7 ) " ;
	echo -e " $(blue_1      ) GitHub (gh) не установлен!" ;
	echo -e " $(black_U23A9 ) " ; sleep 1 ;
	/root/bin/utility/github.sh ;
}
( (gh) >/dev/null || gh_install)


# echo -e "\n # Перезагрузка ~/.bashrc " ;
#(source ~/.bashrc) ;
echo -e " # Перезагрузка ~/.bashrc введите: # source ~/.bashrc	 " ;

echo ;
echo -e " # Установка VDSetup - переход к установке \n" 
sleep 1 ;
/root/bin/utility/installVDSetup.sh $1 ;


	
exit 0 ;
