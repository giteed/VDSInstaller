#!/bin/bash
	
	clear ;
	
	echo ;
	
	echo -e "\n # Установка rsync rsync-daemon git mc gh" 
	
	(dnf -y install rsync rsync-daemon git mc gh) &>/dev/null ;
	
		echo ;
	
function cp_old() 
{
	echo -e " # Функция копирования предыдущих .bash* файлов в /tmp/ " 
	echo -e " # Переход в домашний каталог (root) " 
	
	(cd ~/) ; 
	echo -e " # Сохранение старых версий  " 
	
	yes | cp -Rf .bash_ali_hosts /tmp/.bash_ali_hosts_old ;
	yes | cp -Rf .bash_profile /tmp/.bash_profile_old ; 
	yes | cp -Rf .bash_aliases /tmp/.bash_aliases_old ; 
	yes | cp -Rf .bashrc /tmp/.bashrc_old 
}
	(cp_old) 2>/devnull ;
	
	echo -e " # Создать каталог ~/root/bin если его нет " 	
	(mkdir -p /root/bin) ; 

	 sleep 3 ;
echo -e " #  GitHub Синхронизация локального репо /root/.VDSInstaller/ установщика с папкой ~/root \n" 
(rsync -avp --exclude '.git' --exclude '.DS_Store' /root/.VDSInstaller/ /root) ;

function gh_install()
{
	echo -e " $(black_U23A7 ) " ;
	echo -e " $(blue_1      ) GitHub (gh) не установлен!" ;
	echo -e " $(black_U23A9 ) " ;
	/root/bin/utility/github.sh ;
}
(gh || gh_install)


echo -e "\n # Перезагрузка ~/.bashrc " ;
(source ~/.bashrc) ;
echo -e " # Перезагрузка ~/.bashrc введите: # source ~/.bashrc	 " ;

echo ;
echo -e " # Установка VDSetup - переход к установке " 
sleep 4 ;
/root/bin/utility/installVDSetup.sh ;


	
exit 0 ;


-----------
Для загрузки и запуска этого скрипта из GitHub выполнить команду ниже:

(rm -rf ~/.VDSInstaller ~/bin/* ) ; (dnf -y install rsync rsync-daemon git mc) &>/devnull ; (git clone https://github.com/giteed/VDSInstaller.git ~/.VDSInstaller) ; (~/.VDSInstaller/bin/utility/pre.sh) ;

#(chmod +x -R ~/.VDSInstaller) ;


# Установка rsync rsync-daemon git mc
(dnf -y install rsync rsync-daemon git mc) &>/devnull ;
# Клонирование репо с гитхаба в локальный 
(git clone https://github.com/giteed/VDSInstaller.git ~/.VDSInstaller) ;
# Назначение прав на запуск
(chmod +x -R ~/.VDSInstaller ;)
# запуск установщика
(~/.VDSInstaller/pre.sh)  ;

# и затем:
echo -e " # Установка VDSetup - переход к установке " 
/root/bin/utility/installVDSetup.sh ;
