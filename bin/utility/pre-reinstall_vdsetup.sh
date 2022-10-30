#!/bin/bash
	
	# clear ;
echo ;


	cp /root/bin/utility/reinstall_vdsetup.sh /tmp/ ; 
	#(git clone https://github.com/giteed/VDSInstaller.git /root/.VDSInstaller) ;
	cd /tmp/ ; 
	./reinstall_vdsetup.sh ;


exit 0 ;


# ./reinstall_vdsetup.sh ;

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
	sleep 1 ;
}


function reinstall_vdsetup()
{
	cd ~ ;
	reinstall_vdsetup_msg ;
	(dnf -y install rsync rsync-daemon git mc) &>/devnull ; 
	(git clone https://github.com/giteed/VDSInstaller.git /.VDSInstaller) ; 
	(/.VDSInstaller/bin/utility/pre.sh) ;
}

reinstall_vdsetup ;
	
exit 0 ;

