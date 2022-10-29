#!/bin/bash
	
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

}

( erase_old_content ) 2>/devnull && done_erase || echo -e " error function erase_old_content"

function reinstall_vdsetup()
{
	(dnf -y install rsync rsync-daemon git mc) &>/devnull ; 
	(git clone https://github.com/giteed/VDSInstaller.git /.VDSInstaller) ; 
	(/.VDSInstaller/bin/utility/pre.sh) ;
}


	
exit 0 ;

