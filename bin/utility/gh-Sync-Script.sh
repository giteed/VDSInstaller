#!/bin/bash



# Source global definitions
# --> Прочитать настройки из /etc/bashrc
. ~/.bashrc

# --> Прочитать настройки:
. ~/bin/utility/.varfunc.sh &>/dev/null ;
. ~/bin/utility/.css.sh &>/dev/null ;

script_name ;

# --> Использовать ~/.bash_ali*
. ~/.bash_aliases ;
. ~/.bash_ali_hosts ;
# --> Использовать . ~/bin/utility/.root (требует для скрипта права root)
. ~/bin/utility/.root
# https://htmlacademy.ru/blog/git/git-console?ysclid=l9if42mmm732459151
	
	echo ;
		
	function hi_giteed()
	{
		 function txt_nobat(){ echo -e " $(white_1     )   $(cat hi_giteed.txt) " ; } 
		 ( echo -e $( ssh -T git@github.com &>hi_giteed.txt ) && txt_nobat ; ) 
	}
	
function SSH_keys_here()
{
	echo -en "\n	$(green_arrow) You SSH keys here: " ;
		( cd ~/.ssh; lk-f-c || ls -al ~/.ssh ) ;
	echo -e ;
}

		echo -e " $(black_U23A7 ) " ;
		echo -e " $(ellow_1     ) Login to ${CYAN}> GitHub.com " ;
		echo -e " $(white_1     ) with ${CYAN}> SSH ${NC} " ;
		echo -e " $(blue_1      ) this key ${CYAN}> /root/.ssh/id_rsa.pub ${NC}" ;
		echo -e " $(blue_1      ) and ${CYAN}> Paste an authentication token${NC}" ;
		echo -en " $(blue_1     ) $(green_arrow) Use this GitHub Token .....${GREEN}: " ; 
		echo -e "${ELLOW} $(cat /root/token_vdsetup.txt 2>/dev/null ;) ${NC} " ;
		echo -e " $(black_U23A9 ) " ;
		echo ;

	echo -e " $(black_U23A7    ) " ;
	echo -en " $(ellow_1       ) $(red_U0023) gh auth token " ;

gh auth token &> login.txt
auth_token=$(cat login.txt) 
 if [[ $auth_token == "$( echo "no oauth token" )" ]]
    then gh auth login ;
    else hi_giteed ;
 fi ;

# gh auth login
function gh_auth_Token_login()
	{
	echo -en " $(white_1      ) $(green_tick) Now you use GitHub Token ${GREEN}" ; echo -e " : $(gh auth token)"  ;
	}

		gh_auth_Token_login || gh auth login  ;


	echo -e " $(black_U23A9   ) " ;

		echo ;
		
	    #press_enter ;

	echo -e " $(black_U23A7    ) " ;
	echo -e " $(ellow_1        ) $(green_arrow) Repo List " ;
	echo -e " $(white_1        ) $(red_U0023) gh repo list " ;
	echo -e " $(purple_U23A6   ) " ;
		gh repo list ; echo ;
		( git --version ) ;
		( gh --version ) ;
	echo -e "\n $(purple_U23A6 ) " ;
	echo -e " $(ellow_1        ) $(green_arrow) Release List " ;
	echo -e " $(white_1        ) $(red_U0023) gh release list " ;
	echo -e " $(purple_U23A6   ) \n" ;
		( gh release list ) 2>/dev/null ; 
	echo -e "\n $(purple_U23A6   )" ;
	echo -e " $(black_U23A9    )" ;
		
		echo ;
		#press_enter ;

	echo -e " $(black_U23A7    )" ;
	echo -e " $(ellow_1        ) $(green_arrow) Sync now Repo: ${ELLOW}giteed/VDSetup " ;
	echo -e " $(blue_1         )" ;
	 	cd /root/.GitHub_Repo/VDSetup 2>/dev/null ;
	echo -e " $(white_1        ) $(red_U0023) gh repo sync " ;
	( echo -en " $(white_1     ) " ; ( gh repo sync )) 2>/dev/null || ( echo -en "\n $(red_1      ) " ; ( echo -e "$(red_cross) Sync REPO error, Cloning now .." ) && ( cd ~ ; gh repo clone giteed/VDSetup /root/.GitHub_Repo/VDSetup )) ; 
	
	
	# Папка с локальным репозиторием находится по пути: /root/.GitHub_Repo/VDSetup
	 # The folder with the local repository is located along the path: /root/.GitHub_Repo/VDSetup
	 echo -e " $(blue_1        )" ;
	 echo -en " $(blue_1       )" ; echo -e " $(green_arrow) The folder with the local repository is located along the path:" ;
	 echo -en " $(white_1      )" ; echo -e " $(red_U0023) cd ${CYAN}/root/.GitHub_Repo/VDSetup ${NC}" ;
	 echo -e " $(blue_1        )" ;
	 echo -en " $(white_1      )" ; echo -e " $(green_arrow) For Update VDSetup Version - Run:" ;
	 echo -en " $(white_1      )" ; echo -e " $(red_U0023)${CYAN} vdsetup -sync ${NC}" ;
	 echo -e " $(blue_1        )" ;
	 echo -e " $(black_U23A9   )\n" ; 
	 
	
	function UpdateVersion_sh()
	{
		(/root/bin/utility/.UpdateVersion.sh) || (echo -e "	${RED}ERRORRR ${NC} .UpdateVersion.sh\n" ;
		echo ; error_exit_en_MSG ; )
	}
	UpdateVersion_sh ;
	
	# gh auth login 
	echo -e " $(black_U23A7    )" ;
	echo -en " $(white_1       ) $(green_tick) Now you use GitHub Token ${BLACK}" ; echo -e " : $(gh auth token)" ;
	echo -e " $(blue_1         )" ;
	echo -e " $(white_1        ) $(green_arrow) if you want Logged out of github.com account 'giteed' run:" ;
	echo -en " $(blue_1        )" ; echo -e " $(red_U0023) gh auth logout" ;
	echo -e " $(black_U23A9    )\n" ;

		# echo -e "\n $(blue_1         ) Ver 1.04" ;
		exit 0 ; 


# https://serveradmin.ru/nastrojka-web-servera-nginx-php-fpm-php7-na-centos-8/?ysclid=l7nou55afx191688767

