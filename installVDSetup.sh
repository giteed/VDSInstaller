#!/bin/bash
# Source global definitions
# --> Прочитать настройки из /etc/bashrc
. ~/.bashrc
# --> Прочитать настройки из ~/bin/.varfunc.sh
. ~/bin/utility/.varfunc.sh
# --> Использовать ~/.bash_aliases
. ~/.bash_aliases ;
# --> Использовать . ~/bin/utility/.root (требует для скрипта права root)
. ~/bin/utility/.root


## title: Script Installer "VDSetup"
# Установщик скриптов "VDSetup"
# Установка самой свежей версии 
# всех скриптов из GitHub Repo.
echo -e "	$(green_star37)" ;
echo -e "	$(green_star  ) Script Installer \"VDSetup\" " ;
echo -e "	$(green_arrow ) Installing the latest version" ;
echo -e "	$(green_1     ) of all scripts from GitHub Repo." ;
echo -e "	$(ellow_1     ) Installation path: ${NC}/root/bin" ;
echo -e "	$(red_1       ) ${RED}All contents of the: ${NC}/root/bin ${RED}folder" ;
echo -e "	$(red_1       ) ${RED}will be deleted before installation." ;
echo -e "	$(red_1       ) Do not continue if the ${NC}/root/bin folder" ;
echo -e "	$(red_1       ) contains the files you need${RED}!${NC}" ;
#echo -e "	$(white_1     ) \n" ;

# Установка VDSetup
echo -e "\n	$(green_arrow) Installing \"VDSetup\" scripts ... : $(green_tick) ${GREEN}In progress ...${NC}\n" ;
( ./gh-Sync-Script.sh ) && echo -e "	$(green_arrow) Update version ..... : $(green_tick) ${GREEN}Done${NC}! " || echo -e "${RED}ERROR\n${NC}" ;

exit 0 ;

( cp -a /root/.GitHub_Repo/VDSetup/. /root ) && echo -e "	$(green_arrow) Update version ..... : $(green_tick) ${GREEN}Done${NC}! " || echo -e "${RED}ERROR\n${NC}" ;



exit 0 ;