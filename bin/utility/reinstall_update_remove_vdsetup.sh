#!/bin/bash

# Source global definitions
# --> Прочитать настройки из /etc/bashrc
. /root/.bashrc

# --> Прочитать настройки:
. /root/bin/utility/.debug_version_vdsetup.sh &>/dev/null ;
. /root/bin/utility/.varfunc.sh &>/dev/null ;
. /root/bin/utility/.css.sh &>/dev/null ;


echo ;
debug_message ;

 #------------------------------------
  # install-reinstall-remove_vdsetup
  #------------------------------------
 
  function reinstall_update_remove_vdsetup()
     {
         function menu()
         {
            # gh auth login 
            
           # && green_tick_en && ttb=$
            
           # && lang="nix" && bpn_p_lang
            
           # green_tick_en ;
            
            Version_vdsetup &>/dev/null ;
            echo -e "\n $(black_U23A7    )" ;
            echo -en " $(white_1       ) " && green_tick_en && ttb=$(echo -en " Now you use GitHub Token: ") && lang="nix" && bpn_p_lang && echo -e " :    ${BLACK}$(gh auth token)" ;
            echo -e " $(white_1        ) " ; 
            echo -en " $(white_1        ) " ; echo -e "${WHITE}   Что вы хотите сделать с vdsetup?${nc}" ;
            echo -e " $(white_1        ) " ; 
            echo -en " $(green_1        ) $(green_n1)) " ; ttb=$(echo -e "Синхронизировать (до свежей beta) # vsync или (press Enter). " ;) && lang="nix" && bpn_p_lang ;
            echo -en " $(green_1        ) $(green_n2)) " ; ttb=$(echo -e "Включить/отключить автоматическую синхронизацию. " ; ) && lang="nix" && bpn_p_lang ;
            echo -en " $(red_1          ) $(red_n3  )) " ; ttb=$(echo -e "Удалить и переустановить (до свежей beta). " ; ) && lang="nix" && bpn_p_lang ;
            echo -en " $(red_1          ) $(red_n4  )) " ; ttb=$(echo -e "Удалить полностью. # (Todo..)") && lang="nix" && bpn_p_lang ;
            echo -e " $(white_1         ) " ; 
            echo -en " $(white_1        ) $(red_n5  )) " ; ttb=$(echo -e "Включить/отключить Debugger") && lang="nix" && bpn_p_lang ; 
            echo -en " $(white_1        ) $(green_n0)) " ; ttb=$(echo -e "Выход.") && lang="nix" && bpn_p_lang ; 
            echo -e " $(black_U23A9    )\n" ;
         
         echo -en "		" ; ttb=$(echo -e "Введите цифру меню от 0 до 4\n ") && lang="nix" && bpn_p_lang ; 
         echo -en "		" ; (echo -en "Ваш выбор? $GREEN")
         
            read a
                    case $a in
                        1) sync_1 ; sleep 1 ; exit 0 ;;
                        2) auto_sync_2 ; sleep 1 ; exit ;;
                        3) del_reinstall_3 ; sleep 1 ; css ; exit ;;
                        4) remove_vdsetup_4 ; sleep 1 ; exit ;;
                        5) debug_en_dis ; menu ;;
                        "") sync_1 ;;
                    0) exit 0 ;;
                    *) echo -e ${RED}"\n   		Wrong option."${NC}; menu ;;
                    esac
            
            
            
         }
 
 
         function debug_en_dis()
         {
             
             debug_stat=$(cat /root/.debug.txt 2>/dev/null) ;
               
               if [[ "$debug_stat" == '1' ]] 
               then 
               
                    echo -e "\n $(black_U23A7) $(green_star) Debugger ${GREEN}enabled${NC} and ...." ; 
                    echo -e " $(black_U23A9) $(green_tick) ...will be ${BLACK}disable${NC} now!\n" ; sleep 1; vdsetup -d0 ;
               
               else 
                    echo -e "\n $(black_U23A7) $(green_star) Debugger ${BLACK}disabled${NC} and ..." ;
                    echo -e " $(black_U23A9) $(green_tick) ... will be ${GREEN}enable${NC} now!\n" ; sleep 1 ; vdsetup -d1 ;
               fi
               
            
         }
        
         function sync_1()
         {
            # sync
            echo -en "\n $(black_U23A7) $(green_star)  " ; ttb=$(echo -e "Вы выбрали:") && lang="nix" && bpn_p_lang ;
            echo -en " $(black_U23A9) $(green_tick)  $(green_n1)) " ; ttb=$(echo -e "Синхронизировать vdsetup до последней доступной beta.\n") && lang="nix" && bpn_p_lang ; echo ;
            /root/bin/utility/gh-ss.sh ;
            #(rsync -avp --exclude '.git' --exclude '.DS_Store' /root/.GitHub_Repo/VDSetup/ /root) &>/root/rsync_GitHub_Repo-VDSetup.log ;
            debug_message ;
         }
         
         function auto_sync_2()
         {
            # auto sync
            echo -en "\n $(black_U23A7) $(green_star)  " ; ttb=$(echo -e "Вы выбрали:") && lang="nix" && bpn_p_lang ;
            echo -en " $(black_U23A9) $(green_tick)  $(green_n2)) " ; ttb=$(echo -e "Включить/отключить автоматическую синхронизацию.\n") && lang="nix" && bpn_p_lang ;
            
            auto_update_status ;
            
            function on-off-auto-apdate() {
                
                press_enter_to_continue_or_any_key_to_cancel ;
                
                [ $( cat /tmp/autoupdate_vdsetup.txt ) == "on" ] && auto_update_off || auto_update_on ;
                return ;
            }
              on-off-auto-apdate ;
            
         }
         
         function del_reinstall_3()
         {
             function del_reinstall()
            {
               echo -en "\n $(black_U23A7) $(green_star)  " ; ttb=$(echo -e "Вы выбрали:") && lang="nix" && bpn_p_lang ;
               echo -en " $(black_U23A9) $(green_tick)  $(red_n3  )) " ; ttb=$(echo -e "Удалить и переустановить vdsetup на последнюю доступную beta.\n") && lang="nix" && bpn_p_lang ; 
               
               cd /root/ ; (rm -rf /root/.VDSInstaller /root/.GitHub_Repo /root/bin/* ) 2>/dev/null ; (dnf -y install rsync rsync-daemon git mc) &>/dev/null ; (echo); (git clone https://github.com/giteed/VDSInstaller.git /root/.VDSInstaller) ; (/root/.VDSInstaller/bin/utility/preloader.sh reinstall) ; 
               
            }
           
            del_reinstall ;
            
         }
         
         function remove_vdsetup_4()
         {
            # remove vdsetup
            echo -en "\n $(black_U23A7) $(green_star) " ; ttb=$(echo -e "Вы выбрали:") && lang="nix" && bpn_p_lang ;
            echo -en " $(black_U23A9) $(green_tick) $(red_n4  ))" ; ttb=$(echo -e " Удалить полностью!\n") && lang="nix" && bpn_p_lang ;
            echo -en "\n  $(green_star)" ; ttb=$(echo -e " Давай, давай... удаляй меня полностью...\n    Полностью удаляй!\n") && lang="nix" && bpn_p_lang ; 
            sleep 3 ;
            
         }
         
         
         menu ;
        
     }
     
     css ;
     reinstall_update_remove_vdsetup ;
 
 
 
 
 exit 0 ;
