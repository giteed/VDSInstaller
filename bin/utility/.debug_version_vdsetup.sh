#!/bin/bash


   #------------------------------------
	  # Информация о версии скрипта VDSetup
	  #------------------------------------ 
	  
	function ver() 
	{ 
	   source ~/.bashrc ; 
	   echo -e "\n $(Version_vdsetup)" ;
	}

   
   #------------------------------------
	  # Cтатус "Debug"
	  #------------------------------------ 
	  
	function ds() 
	{ 
	   source ~/.bashrc ; 
	   echo -e "\n ${msg_debug_stat}" ;
	}


function test100()
{
   echo -e "$$$$" 
}



   #------------------------------------
	  # Version_vdsetup
	  #------------------------------------ 
	  
	function Version_vdsetup()
	  {
		 
		 cat ~/.ver.txt 2>/dev/null || echo -e "PRELOADER"
	  }

   debug_stat=$(cat /root/.debug.txt) ;
   
   if [[ $debug_stat == '1' ]] 
	  then msg_debug_stat=$(echo -e "${GREEN}Debug enabled${NC}") ;
	  else msg_debug_stat=$(echo -e "${BLACK}Debug disabled${NC}") ;
   fi ;
   
   function dsm_en()
   {
	  echo -e "\n $(black_U23A7) $(green_star) Debugging enabled" ;
	  echo -e " $(black_U23A9) $(green_tick) run: vdsetup -d0 to disable debugging.\n" ;
	  source ~/.bashrc ;
   }
   
   function dsm_dis()
   {
	  echo -e "\n $(black_U23A7) $(green_star) Debugging disabled" ;
	  echo -e " $(black_U23A9) $(green_tick) run: vdsetup -d1 to enable debugging.\n" ; 
	  source ~/.bashrc ;
   }
   
   function dsm()
   {
	  debug_stat=$(cat /root/.debug.txt) ;
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
			
			debug_stat=$(cat /root/.debug.txt) ;
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

