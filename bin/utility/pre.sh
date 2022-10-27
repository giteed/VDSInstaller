#!/bin/bash


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
	(source ~/.bashrc) ;
# Создать каталог ~/root/bin если его нет 
	(mkdir -p /root/bin) ; 

cs ;
	css ;
	echo ok1 ; sleep 3 ;



# Синхронизация локального репо /root/.VDSInstaller/ установщика с папкой ~/root
(rsync -avp --progress --exclude '.git' --exclude '.DS_Store' /root/.VDSInstaller/ /root) ;

# Перезагрузка ~/.bashrc
(source ~/.bashrc) ;

# Установка VDSetup
echo ok2 ; sleep 3 ;
	css ;
	
	
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
