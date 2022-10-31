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


# Чистим каталог ~/bin
# rm -rf ~/bin/* || echo -e "error \"rm -rf ~/bin/*\" " ;
# Cкопировать из локального репо в папку bin только новые и свежие файлы
echo -e "	$(green_arrow) Upgraded scripts ... : $(green_tick) ${GREEN}In progress ...${NC}" ;
( cp -a /root/.GitHub_Repo/VDSetup/. /root ) && echo -e "	$(green_arrow) Update version ..... : $(green_tick) ${GREEN}Done${NC}! " || echo -e "${RED}ERROR\n${NC}" ;

#(rsync -avp --exclude '.git' --exclude '.DS_Store' /root/.GitHub_Repo/VDSetup/ /root) &>/root/rsync_GitHub_Repo-VDSetup.log

# ( cp -a /root/.GitHub_Repo/VDSetup/. /root )


exit 0 ;

# COPY CP https://habr.com/ru/company/ruvds/blog/471092/?ysclid=l9k0bxfof0176293380

# https://serveradmin.ru/nastrojka-web-servera-nginx-php-fpm-php7-na-centos-8/?ysclid=l7nou55afx191688767