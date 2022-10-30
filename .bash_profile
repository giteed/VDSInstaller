# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# --> Прочитать настройки:
. ~/bin/utility/.varfunc.sh
. ~/bin/utility/.css.sh
#. ~/bin/utility/.dnf-fix-help.sh
#. ~/bin/utility/.dnf-update-upgrade.sh
#. ~/bin/utility/webmin_install.sh
#. ~/bin/utility/reinstall_update_remove_vdsetup.sh

# --> Использовать ~/.bash_ali*
. ~/.bash_aliases ;
. ~/.bash_ali_hosts ;
# --> Использовать . ~/bin/utility/.root (требует для скрипта права root)
. ~/bin/utility/.root

# User specific environment and startup programs
hip ; . ~/bin/lastf ;
PATH=$PATH:$HOME/bin

export PATH

# Linuxbrew
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin/:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"



# source ~/.bash_profile
