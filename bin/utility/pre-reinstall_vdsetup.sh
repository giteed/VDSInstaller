#!/bin/bash
	
	# Source global definitions
	# --> Прочитать настройки из /etc/bashrc
	. ~/.bashrc
	
	# --> Прочитать настройки:
	. ~/bin/utility/.varfunc.sh &>/dev/null ;
	. ~/bin/utility/.css.sh &>/dev/null ;
	
	debug_message ;
	
echo ;


	cp /root/bin/utility/reinstall_vdsetup.sh /tmp/ ; 
	#(git clone https://github.com/giteed/VDSInstaller.git /root/.VDSInstaller) ;
	cd /tmp/ ; 
	./reinstall_vdsetup.sh ;


exit 0 ;

