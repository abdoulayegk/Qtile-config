#!/bin/bash


option=`echo \
" Shutdown
 Restart
Z Sleep
Z Sleep in 30min
 Awesome Restart" \
    | rofi -dmenu -theme-str 'inputbar {enabled: false;}'`



case "$option" in
    
    " Shutdown")
        shutdown 0
        ;;
    " Restart")
        systemctl reboot
        ;;
    "Z Sleep")
        systemctl hibernate
        ;;
    "Z Sleep in 30min")
        Sleep 1800  \
            &&  systemctl hibernate
        ;;
    " Awesome Restart")
        echo 'awesome.restart()' | awesome-client
        ;;
    *)
        echo "idk what ya want"
        ;;
esac
