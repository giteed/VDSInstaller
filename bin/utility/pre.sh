#!/bin/bash


	
	
	
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
. ~/bin/utility/.varfunc.sh
. ~/bin/utility/.css.sh
	
#script_name ; 

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
/root/bin/utility/installVDSetup.sh ;


	
exit 0 ;


path_n=$0 ;

echo -en "\n    >>>>> Debug! " ;
echo -en "\n           Path: " ; pwd ;
echo -e  "    Script Name: "$0"\n" ;
( ( ( ps aux | grep $path_n ) | bat -l nix -p ) 2>/dev/null || ps aux | grep $path_n ) ;
sleep 1 ;
echo -e "\n # GitHub Синхронизация, " 
echo -e " # локального репо: /root/.VDSInstaller/ установщика," 
echo -e " #        с папкой: /root\n" 