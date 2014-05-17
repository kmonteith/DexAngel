if [ -f /bin/ser2net ]; then
    echo "ser2net found"
else
    echo "Copying ser2net"
    cp /media/SD_Card1/ser2net /bin/ser2net
    chmod +x /bin/ser2net
fi
                
MODULE=`lsmod |grep cdc_acm|wc -l`
                
if [ "$MODULE" != "1" ]; then
    echo "Loading module"
    insmod /media/SD_Card1/cdc-acm.ko
fi

PIDOFSER2NET=`pidof ser2net` 
if [ "$PIDOFSER2NET" != "" ]; then
    echo "KILL ser2net"
    pidof ser2net|xargs kill
fi

#USTATE=`cat /sys/bus/usb/devices/1-1.3/bConfigurationValue`
#echo 1 > /sys/bus/usb/devices/1-1.3/bConfigurationValue
#sleep 1
ser2net -u -C "1010:raw:0:/dev/ttyACM0:57600 NONE 1STOPBIT 8DATABITS LOCAL -RTSCTS"
