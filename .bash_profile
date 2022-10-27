# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# --> Прочитать настройки из ~/bin/.varfunc.sh
. ~/bin/utility/.varfunc.sh
# --> Использовать ~/.bash_aliases
. ~/.bash_aliases ;
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
