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
