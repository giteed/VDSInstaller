# VDSetup (Для ознакомления и ТОЛЬКО для тестовых VDS)

> - НЕ ПРЕДНАЗНАЧЕН ДЛЯ РАБОЧИХ СЕРВЕРОВ! 
  (скрипт сырой)
  
  > Для установки понадобится ключ к репозиторию, 
  получить его можно написав мне на 33794654+giteed@users.noreply.github.com  

 >  Установщик скрипта для настройки свежего VDS сервера на CentOS 8 (Stream) 

 >  Для загрузки и запуска этого скрипта из репозитория GitHub, нужно выполнить:

>   (Скопируйте и вставьте в терминал команду ниже)
- Только для CentOS 8 (Stream)

```console
(rm -rf /root/.VDSInstaller /root/.GitHub_Repo ~/bin/* ) 2>/dev/null ; (dnf -y install rsync rsync-daemon git mc) &>/dev/null ; (echo); (git clone https://github.com/giteed/VDSInstaller.git /root/.VDSInstaller) ; (/root/.VDSInstaller/bin/utility/preloader.sh welcome) ;
```


  
  > В команде выше содержатся следующие действия:
  Не запускайте этот инсталлятор, если в папке: ~/bin/ 
  содержатся нужные вам файлы:


- Удаление старой папки инсталлера и GitHub репо (если она уже была) /root/.VDSInstaller /root/.GitHub_Repo
- Удаление всего содержимого ~/bin/* (если оно было)


- Установка rsync rsync-daemon git mc:
  dnf -y install rsync rsync-daemon git mc ;

- Клонирование репо с GitHub в локальный репо:
  git clone https://github.com/giteed/VDSInstaller.git ~/.VDSInstaller ;

- Запуск установщика:
  ~/.VDSInstaller/preloader.sh  ;

- Переход к установке VDSetup:
  /root/bin/utility/installVDSetup.sh ;

  
 - Спасибо за проявленный интерес! :)