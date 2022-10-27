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
# Перезагрузка ~/.bashrc
(source ~/.bashrc) ;

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

press_anykey ; css ;

	# Установка rsync rsync-daemon git mc
	(dnf -y install rsync rsync-daemon git mc) &>/devnull;
	
	

function cp_old() # Функция копирования предыдущих .bash* файлов в /tmp/
{
	# Переход в домашний каталог (root)
	(cd ~/) ; 
	yes | cp -Rf .bash_ali_hosts /tmp/.bash_ali_hosts_old ;
	yes | cp -Rf .bash_profile /tmp/.bash_profile_old ; 
	yes | cp -Rf .bash_aliases /tmp/.bash_aliases_old ; 
	yes | cp -Rf .bashrc /tmp/.bashrc_old 
}
	(cp_old) 2>/devnull ;

# Создать каталог ~/root/bin если его нет 
(mkdir -p /root/bin) ; 

# Синхронизация локального репо /root/.VDSInstaller/ установщика с папкой ~/root
(rsync -avp --progress --exclude '.git' --exclude '.DS_Store' /root/.VDSInstaller/ /root) ;

# Перезагрузка ~/.bashrc
(source ~/.bashrc) ;

# Установка VDSetup
 echo -e "\n  	$(green_arrow) Installing \"VDSetup\" scripts ... : $(green_tick) ${GREEN}In progress ...${NC}" ;
	( /root/bin/utility/gh-Sync-Script.sh ) && echo -e "\n	$(green_arrow) Install vdsetup .... : $(green_tick) ${GREEN}Done${NC}! " || echo -e "${RED}ERROR\n${NC}" ;


	echo -e " $(black_U23A7 ) " ;
	echo -e " $(ellow_1     ) $(green_arrow) Run vdsetup:" ;
	echo -e " $(white_1     ) ${RED}#${NC} vdsetup ${NC}" ;
	echo -e " $(black_U23A9 ) " ;
	
exit 0 ;


-----------
Перед запуском этого срипта выполнить:

(dnf -y install rsync rsync-daemon git mc) &>/devnull ; (git clone https://github.com/giteed/VDSInstaller.git ~/.VDSInstaller) ; (chmod +x -R ~/.VDSInstaller) ;  (~/.VDSInstaller/bin/utility/installVDSetup.sh) ;


# Установка rsync rsync-daemon git mc
(dnf -y install rsync rsync-daemon git mc) &>/devnull ;
# Клонирование репо с гитхаба в локальный 
(git clone https://github.com/giteed/VDSInstaller.git ~/.VDSInstaller) ;
# Назначение прав на запуск
(chmod +x -R ~/.VDSInstaller ;)
# запуск установщика
(~/.VDSInstaller/installVDSetup.sh)  ;
