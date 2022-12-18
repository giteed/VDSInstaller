#!/bin/bash

   #-----------------------------------
   # Цвета терминала
   # https://www.shellhacks.com/bash-colors/
   #-----------------------------------
      blink='\e[5m' ; NC='\e[0m' ; nc='\e[0m' ; WHITE='\e[1;1m' ; white='\e[0;0m' ; BLACK='\e[1;30m' ; black='\e[0;30m' ; RED='\e[1;31m' ; red='\e[0;31m' ; GREEN='\e[1;32m' ; green='\e[0;32m' ; ELLOW='\e[1;33m' ; ellow='\e[0;33m' ; PURPLE='\e[1;35m' ; purple='\e[0;35m' ; BLUE='\e[1;34m' ; blue='\e[0;34m'  ; CYAN='\e[1;36m' ; cyan='\e[0;36m' ; GRAY='\e[1;37m' ; gray='\e[0;37m' ; 
      #-----------------------------------
      # Дата: $D $T $Day $Month $Data $DMY
      D=$(date  +%Y-%m-%d) ; T=$(date +%H:%M:%S) ; Day="$(echo -e $( date | awk '{ print $1 } '))" ; Month="$(echo -e $( date | awk '{ print $2 } '))" ; Data="$(echo -e $( date | awk '{ print $3 } '))" ; DMY="$(echo -e "${red}"$( date | awk '{ print $1, $2, $6 } ')"${NC}")" 
   
   
   
   #------------------------------------
   # баннер
   #------------------------------------
   
   
   function reload_cash() {
       /root/bin/utility/.cash_var.sh $1
   }
   

   
   function auto_update_on() {
      # Включить  автоматические обновления:
      new_V=$(cat /tmp/.ver.txt)
      current_V=$(cat /root/.ver.txt)
      
    echo on > /tmp/autoupdate_vdsetup.txt ;
    echo -e "\n $(black_U23A7 ) " ;
    echo -e " $(green_1       )  \"VDSetup\" $(Version_vdsetup_Ver_RED_or_GREEN)" ; 
    echo -en " $(green_1      ) " ; (ttb=$(echo -e " Автоматические обновления - Включены." ) && bpn_p_lang ; ttb="" ) ;
    echo -en " $(red_1        ) " ; (ttb=$(echo -e " Выключить автоматические обновления: " ) && bpn_p_lang ; ttb="" ) ;
    echo -en " $(red_1        ) " ; (ttb=$(echo -e " # auto_update_off  " ) && bpn_p_lang ; ttb="" ) ;
    echo -e " $(black_U23A9   ) \n" ;
   }
   
   function auto_update_off() {
      # Отключить автоматические обновления:
      new_V=$(cat /tmp/.ver.txt)
      current_V=$(cat /root/.ver.txt)
      
    echo -e "\n $(black_U23A7  ) " ;
    echo off > /tmp/autoupdate_vdsetup.txt ;
    echo -e " $(green_1        )  \"VDSetup\" $(Version_vdsetup_Ver_RED_or_GREEN)" ; 
    echo -en " $(red_1         ) " ; (ttb=$(echo -e " Автоматические обновления - Отключены." ) && bpn_p_lang ; ttb="" ) ;
    echo -en " $(green_1       ) " ; (ttb=$(echo -e " Включить автоматические обновления: " ) && bpn_p_lang ; ttb="" ) ;
    echo -en " $(green_1       ) " ; (ttb=$(echo -e " # auto_update_on " ) && bpn_p_lang ; ttb="" ) ;
    echo -e " $(black_U23A9    ) \n" ;
   }
   
   function auto_update_status() {
      # Показать статус автоматических обновлений:
      #cash_var_sh_150_start_and_stop ;
      [ $( cat /tmp/autoupdate_vdsetup.txt ) == "on" ] && auto_update_on || auto_update_off ;
      
      return ;
   }
   

   
   function RED_VER()
   {
      echo -e "${RED}$(Version_vdsetup) $(red_U0023) vsync ${red}${blink}!${NC} New beta: ${red}${new_V}${NC}" ;
   }
   
   function GREEN_VER()
   {
      source /root/.bashrc ;
      echo -e "${green}$(Version_vdsetup) $(red_U0023) vdsetup sync" ;
      
   }
   
   #new_V=$(cat /tmp/.ver.txt)
   #current_V=$(cat /root/.ver.txt)
   
   #function new_V() {
   #   $(cat /tmp/.ver.txt)
   #}
   #function current_V() {
   #   $(cat /root/.ver.txt)
   #}
   
   function Version_vdsetup_Ver_RED_or_GREEN()
   {
       #cd /tmp/ ; wget -q  -O .ver.txt https://raw.githubusercontent.com/giteed/VDSInstaller/main/.ver.txt 2>/dev/null &
        
        
        
        
        function ver_CH_GH()
        {
           cd /tmp/ ; wget -q  -O .ver.txt https://raw.githubusercontent.com/giteed/VDSInstaller/main/.ver.txt ;
           
           
           new_V=$(cat /tmp/.ver.txt)
           current_V=$(cat /root/.ver.txt)
           
           if [ ! ${new_V} != ${current_V} ] 
           then 
              echo -e $(GREEN_VER) ; 
           else 
              echo -e $(RED_VER) ;
           
           fi 
           
        }
        
        ver_CH_GH ;
        return ;
        
        
         
         
         
       #  if [ ${new_V} != ${current_V} ] 
       #  then 
       #     echo -e "$(GREEN_VER)" 
       #  else 
       #     echo -e "$(RED_VER)" 
       #  
       #  fi 
         
      
      
     # if  ( '$(new_V)' != '$(current_V)' ) &>/dev/null ; then echo -e "$(GREEN_VER)" ; else echo -e "$(RED_VER)" ; fi ;
   
}
   
function hip() # host/ip
      {
         
         function cash_tor_ip() {
            
            cat /tmp/tor_ip 2>/dev/null ;
            #(curl -s --socks5 127.0.0.1:${tor_port} icanhazip.com) >/tmp/tor_ip & 
            
         }
         
         
         
         tor_ip="${green}TOR${NC} ip: ${green}$(cash_tor_ip)${NC}"
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

function cash_var_sh_150() {
      
       up_sec=$(cat /tmp/up_sec.txt)
       
       ( /root/bin/utility/.cash_var.sh $up_sec & ) &>/dev/null || ( /root/bin/utility/.cash_var.sh 151 & ) &>/dev/null 
       return ;
   }


function css() 
   { 
      
      Version_vdsetup &>/dev/null ;
      echo -en "$( clear && source /root/.bashrc && hip )\n ${RED}-${ellow}=---${ELLOW}=${ellow}-${GREEN}-${green}-${NC}-------------------------------------------------------------------------\n ${NC}$(green_tick) ${BLACK}VDSetup ${GREEN}version${NC}: $(Version_vdsetup_Ver_RED_or_GREEN)${NC}" ;  echo -e " ${msg_debug_stat}" ; 
   }
   
   

      
      # ФУНКЦИЯ: Мой ip
      function mi() { wget -qO- icanhazip.com ; } ;
      # ФУНКЦИЯ: User
      function im() { whoami ; } ;
      


   #------------------------------------
   # bat / no bat
   #------------------------------------ 
   if  [[ $lang == "" ]] ; then lang="nix" ; fi ;
   
   function bpn_p_lang() {
      
     ( echo -e "${ttb}" | bat --paging=never -l ${lang} -p 2>/dev/null || echo -e "$ttb" ) 
      ttb="" ;
      #return ;
    }
    
   
   
   if  [[ $lang == "" ]] ; then lang="nix" ; fi ;
   
   function bpal_p_lang() {
     
     ( echo -e "${ttb}" | bat --paging=always -l ${lang} -p 2>/dev/null || echo -e "$ttb" ) 
     ttb="" ;
     #return ;
    }
   
   function lang_nix() {
      lang=nix
   }
   
   function lang_bash() {
      lang=bash ;
   }
   
   function lang_help() {
      lang=help ;
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
         
         function red_pipe() { echo -e "${red}|${NC}" ; } ;
         function red_U0023() { echo -e "${red}#${NC}" ; } ;
         
         function red_tick() { echo -e "${RED}✓${NC}" ; } ;
         function ellow_tick() { echo -e "${ELLOW}✓${NC}" ; } ;
         
         function red_cross() {  echo -e "${red}✖${NC}" ; } ;
         
         function red_NO() { echo -e "${red}NO${NC}" ; } ;
         function red_crash() { echo -e "${red}✖ Crash${NC}" ; } ;
         
         function green_arrow() { echo -e "${green}⤑${NC}" ; } ;
         
         function green_OK() { echo -e "${green}OK${NC}" ; } ;
         
         
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
