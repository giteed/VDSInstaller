#!/bin/bash


   
   
   #------------------------------------
   # баннер
   #------------------------------------
   
function css() 
   { 
      echo -en "$( clear && source ~/.bashrc && hip )\n ${gray}(For update type: vdsetup -sync)${NC}\n ${RED}-${ellow}=---${ELLOW}=${ellow}-${GREEN}-${green}-${NC}-------------------------------------------------------------------------\n ${NC}$(green_tick) VDSetup scripts $(Version_vdsetup))" ; echo -e "${BLACK} $(cat ~/.debug.txt) ${NC}"  
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

   #------------------------------------
   # баннер
   #------------------------------------
   
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
   # Version_vdsetup
   #------------------------------------ 
   
function Version_vdsetup()
   {
      echo -e "Ver: GH-1.0.0"  #| bat -l nix ) #|| $( echo -e "${RED}Ver${NC}: GH-1.0.0${NC}" )
      
   }

   #------------------------------------
   # Version_vdsetup
   #------------------------------------ 

function myip() { echo -e "$( wget -qO- icanhazip.com )" ; }



   #------------------------------------
   # script_name debug
   #------------------------------------   
   
 function debug()
   {
      
      function debug_on()
      {
         path_n=$0
         
         echo -e "        $(black_U23A7    ) " ;
         echo -e "       $(red_star)$(red_1          ) ${NC}!${NC}${BLACK}#${RED} ---------------${BLACK}Debug${RED}--------------- ${BLACK}#${NC}!" ;
         echo -en "       $(red_star)$(ellow_1        )  ${BLACK}Path$ .....${NC}: " ; echo -e "${NC}$(pwd)" ;
         echo -e "       $(red_star)$(ellow_1        )  ${BLACK}Script Name${NC}:${GREEN} "$0" ${NC}" ;
         echo -e "       $(red_star)$(ellow_1        )  ${BLACK}Date ......${NC}: "$(date)" ${NC}" ;
         echo -e "       $(red_star)$(ellow_1        ) " ; ( ( ( ps aux | grep $path_n ) | bat -l nix -p ) 2>/dev/null || ps aux | grep $path_n ) ;
         echo -e "       $(red_star)$(ellow_1        ) " ;
         echo -e "        $(black_U23A9    ) \n" ;
      }
      
      function debug_off()
      {
         2>/dev/null ;
      }
      
      function debug_on_off()
      {
         debug_status=$(cat /root/.debug.txt) ;
         
      if [[ $debug_status == "Debug enabled" ]]
         then debug_on 
         else debug_off
      fi ;
      }
      
      debug_on_off ;
      
   }

   #------------------------------------
   # script_name
   #------------------------------------  
   
function script_name() { (debug ;) 2>/dev/null || echo no_debug ; }
    
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
