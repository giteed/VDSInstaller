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

# https://htmlacademy.ru/blog/git/git-console?ysclid=l9if42mmm732459151

ssh -T git@github.com ;

# генерилка пароля openssl aes-256-cbc
function genpass()
{
	
	password=`openssl rand -hex 32`
	echo -e "	Password (hex 32):${RED} $password${NC}" ;
	
	function cat_my_key() 
	{
		# openssl enc -cipher [-help] [-ciphers] [-in filename] [-out filename] [-pass arg] [-e] [-d] [-a] [-base64] [-A] [-k password] [-kfile filename] [-K key] [-iv IV] [-S salt] [-salt] [-nosalt] [-z] [-md digest] [-iter count] [-pbkdf2] [-p] [-P] [-bufsize number] [-nopad] [-debug] [-none] [-rand file...] [-writerand file] [-engine id]
		
		cat my_key.enc | openssl aes-256-cbc -k "$password" -a -iter 32 > my_key.enc ; 
		echo -en "	my_key.enc ......: ${GREEN}" ;
		cat my_key.enc ; echo -e "${NC}"
	}
	
	cat_my_key ;
}

echo -e ;
# генерилка пароля openssl aes-256-cbc
# genpass ;



echo -en "	$(green_arrow) You SSH keys here: " ;
	( cd ~/.ssh; lk-f-c || ls -al ~/.ssh ) ;

echo -e "\n	$(green_tick) Login to ${CYAN}> GitHub.com ${NC}" ;
echo -e "	$(green_tick) with ${CYAN}> SSH ${NC}" ;
echo -e "	$(green_tick) this key ${CYAN}> /root/.ssh/id_rsa.pub ${NC}" ;
echo -e "	$(green_tick) and ${CYAN}> Paste an authentication token${NC}" ;
echo -en "	$(green_arrow) Use this GitHub Token .....: ${GREEN}" ; echo -e "${CYAN}"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${NC}""


echo -e "\n	$(red_U0023) gh auth token" ;

echo -en "	$(green_tick) Now you use GitHub Token...: ${GREEN}" ; gh auth token || gh auth login  ;
echo -e "\n	$(green_arrow) REPO List " ;
echo -e "	$(red_U0023) gh repo list \n" ;
	( gh repo list | bat -l nix -p ) || gh repo list ;
	
echo -e "\n	$(green_arrow) Sync REPO ${ellow}giteed/VDSetup${NC}" ;
	cd /root/.GitHub_Repo/VDSetup 2>/dev/null ;
echo -en "	$(red_U0023) gh repo sync " ;
	( gh repo sync ) 2>/dev/null || (( echo -e "$(red_cross) Sync REPO error, Cloning now ..\n" ) && ( cd ~ ; gh repo clone giteed/VDSetup /root/.GitHub_Repo/VDSetup )) ;
echo ;
	# Папка с локальным репозиторием находится по пути: /root/.GitHub_Repo/VDSetup
	# The folder with the local repository is located along the path: /root/.GitHub_Repo/VDSetup
	echo -e "	$(green_arrow) The folder with the local repository is located along the path:" ;
	echo -e "	$(red_U0023) cd ${CYAN} /root/.GitHub_Repo/VDSetup\n ${NC}" ;

echo -e "	$(green_arrow) if you want Logged out of github.com account 'giteed' " ;
echo -e "	$(red_U0023) gh auth logout\n" ;


	( git --version | bat -l nix -p ) || ( git --version ) ;
	( gh --version | bat -l nix -p ) || ( gh --version ) ;
	
	echo ;
	echo -e "	$(green_arrow) Update VDSetup Version" ;
	echo -e "	$(red_U0023)${CYAN} /root/bin/utility/.UpdateVersion.sh \n ${NC}" ;
	/root/bin/utility/.UpdateVersion.sh || echo -e "	${RED}ERROR${NC} .UpdateVersion.sh\n" ;

exit 0 ; 


# https://serveradmin.ru/nastrojka-web-servera-nginx-php-fpm-php7-na-centos-8/?ysclid=l7nou55afx191688767