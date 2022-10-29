#!/bin/bash


 
 
 #------------------------------------
 # install-reinstall-remove_vdsetup
 #------------------------------------

 function reinstall_update_remove_vdsetup()
 {
    
    
    
    function menu()
    {
       # gh auth login 
       echo -e "\n $(black_U23A7    )" ;
       echo -en " $(white_1       ) $(green_tick) Now you use GitHub Token" ; echo -e " : ${BLACK}$(gh auth token)" ;
       echo -e " $(white_1        ) " ; 
       echo -e " $(white_1        )    Что вы хотите сделать с vdsetup?" 
       echo -e " $(white_1        ) " ; 
       echo -e " $(green_1        ) $(green_n1)) Синхронизировать до последней доступной бета версии. ${BLACK}(press Enter)${NC} " ;
       echo -e " $(green_1        ) $(green_n2)) Включить${BLACK}/${NC}отключить автоматическую синхронизацию. ${BLACK}(todo)${NC} " ; 
       echo -e " $(red_1          ) $(red_n3  )) Удалить и переустановить vdsetup на последнюю доступную бета версию. " ; 
       echo -e " $(red_1          ) $(red_n4  )) Удалить полностью. ${BLACK}(todo)${NC}" 
       echo -e " $(black_U23A9    )\n" ;
       
       press_enter ;
       
       return | sync_1 ;
       
    }
    function black_U23A7() { echo -e "${BLACK}⎧${NC}" ; } ;
    function black_U23A9() { echo -e "${BLACK}⎩${NC}" ; } ;
     
    function sync_1()
    {
       # sync
       echo -e " $(black_U23A7) $(green_star) Вы выбрали:" ;
       echo -e " $(black_U23A9) $(green_tick) $(green_n1)) Синхронизировать до последней доступной бета версии." ;
       ~/bin/utility/gh-Sync-Script.sh ;
       #(rsync -avp --exclude '.git' --exclude '.DS_Store' /root/.GitHub_Repo/VDSetup/ /root) &>/root/rsync_GitHub_Repo-VDSetup.log ;
       
    }
    
    function auto_sync_2()
    {
       # auto sync
       echo -e " $(black_U23A7) $(green_star) Вы выбрали:" ; 
       echo -e " $(black_U23A9) $(green_tick) 2) Включить/отключить автоматическую синхронизацию. (todo)" ;
    }
    
    function del_reinstall_3()
    {
       # del reinstall 
       {
          echo -e " $(black_U23A7) $(green_star) Вы выбрали:" ;
          echo -e " $(black_U23A9) $(green_tick) 3) Удалить и переустановить vdsetup на последнюю доступную бета версию." ; 
          (rm -rf ~/.VDSInstaller ~/bin/* ) 2>/dev/null ; (dnf -y install rsync rsync-daemon git mc) &>/devnull ; (git clone https://github.com/giteed/VDSInstaller.git /.VDSInstaller) ; sleep 2; (/.VDSInstaller/bin/utility/pre.sh) ;
          
       }
    }
    
    function remove_vdsetup_4()
    {
       # remove vdsetup
       echo -e " $(black_U23A7) $(green_star) Вы выбрали:" ; 
       echo -e " $(black_U23A9) $(green_tick) ${green_n4} Удалить полностью$(RED)!" ;
       press_enter ;
       sleep 3 ;
       
    }
    
    
    menu ;
    # reinstall_update_remove_vdsetup ;
    
    
   
}