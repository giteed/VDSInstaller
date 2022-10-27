#!/bin/bash

	echo -e " # Установка rsync rsync-daemon git mc " 
	
	(dnf -y install rsync rsync-daemon git mc) &>/devnull;
	
	echo -e " # Удаляю старые скрипты из ~/.VDSInstaller ~/bin/* " 
	rm -rf ~/.VDSInstaller ;
	rm -rf ~/bin/* ;
	
	
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
echo -e " # Синхронизация локального репо /root/.VDSInstaller/ установщика с папкой ~/root " 

(rsync -avp --exclude '.git' --exclude '.DS_Store' /root/.VDSInstaller/ /root) ;

echo -e " # Перезагрузка ~/.bashrc " ;
(source ~/.bashrc) ;
echo -e " # Установка VDSetup - переход к установке " 

echo -e " # Перезагрузка ~/.bashrc введите: # source ~/.bashrc	 " ;

	
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
