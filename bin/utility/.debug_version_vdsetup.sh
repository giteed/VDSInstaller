#!/bin/bash


   #------------------------------------
	  # Информация о версии скрипта VDSetup
	  #------------------------------------ 
	  
	function ver() 
	{ 
	   source /root/.bashrc ; 
	   auto_update_status ;
	}

   
   #------------------------------------
	  # Cтатус "Debug"
	  #------------------------------------ 
	  
	function ds() 
	{ 
	   source /root/.bashrc ; 
	   echo -e "\n ${msg_debug_stat}" ;
	}


function test100()
{
   echo -e " 〠 PID $$ " 
}



   #------------------------------------
	  # Version_vdsetup
	  #------------------------------------ 
	  
	function Version_vdsetup()
	  {
		 
		 cat /root/.ver.txt 2>/dev/null || echo -e "PRELOADER"
	  }

   debug_stat=$(cat /root/temp/.debug.txt 2>/dev/null) ;
   
   if [[ $debug_stat == '1' ]] 
	  then msg_debug_stat=$(echo -e "${GREEN}Debugger enabled${NC}") ;
	  else msg_debug_stat=$(echo -e "${BLACK}Debugger disabled${NC}") ;
   fi ;
   
   function dsm_en()
   {
	  echo -en "\n $(black_U23A7) $(green_star) " ; ttb=$(echo -e "Debugging enabled") && lang="nix" && bpn_p_lang ;
	  echo -en " $(black_U23A9) $(green_tick) " ; ttb=$(echo -e "run: vdsetup -d0 to disable debugging.\n") && lang="nix" && bpn_p_lang ;
	  source /root/.bashrc ;
   }
   
   function dsm_dis()
   {
	  echo -en "\n $(black_U23A7) $(green_star) " ; ttb=$(echo -e "Debugging disabled") && lang="nix" && bpn_p_lang ;
	  echo -en " $(black_U23A9) $(green_tick) " ; ttb=$(echo -e "run: vdsetup -d1 to enable debugging.\n") && lang="nix" && bpn_p_lang ; 
	  source /root/.bashrc ;
   }
   
   function dsm()
   {
	  debug_stat=$(cat /root/temp/.debug.txt 2>/dev/null) ;
	  if [[ $debug_stat == '1' ]] 
	  then source /root/.bashrc ; dsm_en ;
	  else source /root/.bashrc ; dsm_dis ;
	  fi ;
   }
   
   
   #------------------------------------
	  # debug_message debug
	  #------------------------------------   
	  
	function debug()
	  {
		 
		 function debug_1_on()
		 {
			set -x ;
			path_n=$0
			ttb=$(echo -e "\n		Debugger status is: $debug_stat \n" ;) && bpn_p_lang ;
			
			echo -e "        $(black_U23A7    )   ㋛ " ;
			echo -e "       $(red_star)$(red_1          ) ${NC}!${NC}${BLACK}#${RED} -----$(test100)----- ت ټ${BLACK}Debug${RED}ت ټ ----- $(Version_vdsetup) --------- ${BLACK}#${NC}!" ;
			echo -en "       $(red_star)$(ellow_1       )  ${BLACK}Path ......${NC}: " ; echo -e "${NC}$(pwd)" ;
			echo -e "       $(red_star)$(ellow_1        )  ${BLACK}Script Name${NC}:${GREEN} "$0" at $(hostname) ${NC}" ;
			echo -e "       $(red_star)$(ellow_1        )  ${BLACK}Date ......${NC}: "$(date)" ${NC}" ;
			echo -e "       $(red_star)$(ellow_1        ) " ; (  ttb=$( ps aux | grep $path_n | grep -v grep  ) && bpn_p_lang ; ) 2>/dev/null ;
			echo -e "       $(red_star)$(ellow_1        )  ツ ps ax | awk '/[s]nippet/ { print $1 }' | xargs kill 回 ₪™ " ;
			echo -e "       $(red_star)$(ellow_1        )  ツ pidof snippet | awk '{ print $1 }' | xargs kill 回 ₪™ " ;
			echo -e "        $(black_U23A9    ) \n" ;
			
		 }
		 
		 function debug_0_off()
		 {
		  set +x ;
		 }
		 
		 function debug_check_status()
		 {
			
			debug_stat=$(cat /root/temp/.debug.txt 2>/dev/null) ;
		 if [[ $debug_stat == "1" ]]
			then debug_1_on ;
			else debug_0_off
		 fi ;
		 }
		 
		 debug_check_status ;
		 
	  }
   
   #------------------------------------
	  # debug_message
	  #------------------------------------  
	  
	function debug_message() 
	{ 
	  (debug ;) 2>/dev/null ; 
    }

