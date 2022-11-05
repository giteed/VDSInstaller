#!/bin/bash
script_name ;
# Source global definitions
# --> Прочитать настройки из /etc/bashrc
. ~/.bashrc

# --> Прочитать настройки:
. ~/bin/utility/.varfunc.sh &>/dev/null ;
. ~/bin/utility/.css.sh &>/dev/null ;

script_name ;

	
	clear ;
	function done_erase()
	{
		echo -e " # Done ..." 
		sleep 1 ;
	}
	
	
echo ;
echo -e " # Erase old content ..." 
sleep 1 ;

	function erase_old_content()
{

	rm -rf /root/.GitHub Repo/VDSetup ;
	rm -rf /root/bin/* ;
	rm -rf /root/.VDSInstaller ;
	
	cd ~ ;

}

( erase_old_content ) 2>/devnull && done_erase || echo -e " error function erase_old_content"


	function reinstall_vdsetup_msg()
{
	echo -e " # Reinstall VDSetup in progress ..." 
	(git clone https://github.com/giteed/VDSInstaller.git /root/.VDSInstaller) ;
	sleep 1 ;
}


function reinstall_vdsetup()
{
	cd ~ ;
	reinstall_vdsetup_msg ;
	(dnf -y install rsync rsync-daemon git mc) &>/devnull ; 
	#(git clone https://github.com/giteed/VDSInstaller.git /.VDSInstaller) ; 
	(/.VDSInstaller/bin/utility/preloader.sh) ;
}

reinstall_vdsetup ;
	
exit 0 ;

https://losst.pro/rsync-primery-sinhronizatsii?ysclid=l9p9k9xci5475918261