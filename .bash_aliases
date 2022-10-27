# .bash_aliases

# --> Использовать ~/.bash_aliases
. ~/.bash_ali_hosts ;

#-----------------------------------
# User specific aliases and functions
# unalias name - удалить алиас
#-----------------------------------
# shutdown now 0
alias stp='shutdown -h 0'
# bat paging: -l c log sh batman
alias batc='bat  --paging=never -l c'
alias batlog='bat  --paging=never -l log'
alias batsh='bat  --paging=never -l sh'
alias batbash='bat  --paging=never -l bash'
alias fbat='find | bat --paging=never -l bash "$( fzf )" -p 2>/dev/null'
alias man='batman || man'
# df -h , free -h , ip , who , type
alias df='echo -e '' && df -kTh | bat  --paging=never -l nix -p'
alias mem='echo -e '' && free -h -t | bat  --paging=never -l meminfo -p'
alias pwd='echo -e '' && pwd | bat  --paging=never -l c -p'
alias myip='wget -qO- icanhazip.com'
alias mi='echo -e '' && wget -qO- icanhazip.com | bat  --paging=never -l c -p'
alias lip='lip-f'
#alias lip="(echo -e "internal:") && ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' && (echo -en "external:") && myip "
alias who='echo -e '' &&  who -H | bat  --paging=never -l c -p && echo -e "\n bat /etc/passwd (cat /etc/passwd | rg -v "nologin" | rg -v shutdown | rg -v sync | rg -v false | rg -v halt | bat -l passwd -p)" &&cat /etc/passwd | rg -v "nologin" | rg -v shutdown | rg -v sync | rg -v false | rg -v halt | bat -l passwd -p'
alias ifc='ifconfig | bat -p --paging=never -l log'
# clear , update ~/.bashrc , ls , cd , tree
alias c='clear'
alias cs='clear && source ~/.bashrc && hip'
alias l.='ls -lhd --color=auto .*'
alias l..='ls -lhd --color=auto .* *'
alias ll='ls -lh --color=auto'
alias lll='tree -Csuh | more' 
alias ls='ls -h --color=auto'
alias ff='GLIG_ASTRX_ON && ff-f'
alias lk='GLIG_ASTRX_OF && lk-f'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
# grep , wget
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zgrep='zgrep --color=auto'
alias wget='wget -c'
# cp , mv , mc , rm , mkdir
alias cp='cp -i'
alias mv='mv -i'
alias mc='. /usr/libexec/mc/mc-wrapper.sh'
# Не удалять корень и предупреждать об удалении файлов
alias rm='rm -I --preserve-root'
# Защита от изменения прав для /
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias mkdir='mkdir -p'
# ssh servers
alias vnc1log='tail -f ~/.vnc/survival.mc:1.log | bat --paging=never -l nix -p'
alias vnc2log='tail -f ~/.vnc/survival.mc:2.log | bat --paging=never -l nix -p'

# Connect to VPN-155
alias vpn='vpn-f'
# yum
alias ypr='GLIG_ASTRX_ON && ypr-f'
alias yin='yum install'
alias yyin='yum install -y'
alias yre='yum remove'
alias yyre='yum remove -y'
alias yup='yum update'
alias yyup='yum update -y'
# traceroute , ping -c 10 host , Nmap
#alias tpn='GLIG_ASTRX_ON && tpn'
#-----------------------------------


#-----------------------------------
# Тут alias команд с использованием sudo, если текущий пользователь не root
# Подойдет для общего файла с алиасами или в качестве примера скрипта проверки на UID root/не_root
if [ $UID -ne 0 ]; then
alias reboot='sudo reboot'
alias yup='sudo yum update'
fi
