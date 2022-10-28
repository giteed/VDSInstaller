#!/bin/bash

# Source global definitions
# --> Прочитать настройки из /etc/bashrc
. ~/.bashrc
# --> Прочитать настройки:
. ~/bin/utility/.varfunc.sh
. ~/bin/utility/.css.sh

# --> Использовать ~/.bash_ali*
. ~/.bash_aliases ;
. ~/.bash_ali_hosts ;
# --> Использовать . ~/bin/utility/.root (требует для скрипта права root)
. ~/bin/utility/.root
# Перезагрузка ~/.bashrc


css ;
# title: Script Installer "VDSetup"
# Установщик скриптов "VDSetup"
# Установка самой свежей версии 
# всех скриптов из GitHub Repo.
echo ;


(( echo -e "   Welcome to VDSetup Installer " ; echo -e "   for CentOS\n") | bat -l nix -p 2>/dev/null ) || ( echo -e "   Welcome to VDSetup Installer " ; echo -e "   for CentOS\n") ;

echo -e " $(black_U23A7    ) " ;
echo -e " $(blue_1         ) Installing the latest version" ;
echo -e " $(green_1        ) of all scripts from GitHub Repo." ;
echo -e " $(black_U23A9    )\n" ;
echo -e " $(black_U23A7    ) " ;
echo -e " $(ellow_1        ) Installation path: ${NC}/root/bin" ;
echo -e " $(red_1          ) ${RED}All contents of the${NC}: ${ELLOW}/root/bin ${RED}folder" ;
echo -e " $(red_1          ) ${RED}will be deleted before installation${NC}!" ;
echo -e " $(red_1          ) ${RED}Do not continue${NC} if the ${ELLOW}/root/bin ${NC}folder" ;
echo -e " $(red_1          ) contains the files you need${RED}!${NC}" ;
echo -e " $(black_U23A9    ) \n" ;

press_anykey ; css ; sleep 1 ;


# Установка VDSetup
 echo -e "\n  	$(green_arrow) Installing \"VDSetup\" scripts ... : $(green_tick) ${GREEN}In progress ...${NC}" ;
	( /root/bin/utility/gh-Sync-Script.sh ) && echo -e "\n	$(green_arrow) Install vdsetup .... : $(green_tick) ${GREEN}Done${NC}! " || echo -e "${RED}ERROR\n${NC}" ;


	echo -e " $(black_U23A7 ) " ;
	echo -e " $(ellow_1     ) $(green_arrow) Reload ~/.bashrc and Run vdsetup" ;
	echo -e " $(white_1     ) ${RED}#${NC} source ~/.bashrc ${NC}" ;
	echo -e " $(white_1     ) ${RED}#${NC} vdsetup ${NC}" ;
	
	echo -e " $(black_U23A9 ) " ;
	
exit 0 ;


