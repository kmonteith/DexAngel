sleep 2
pidof ser2net |xargs kill ||true
#echo 0 > /sys/bus/usb/devices/1-1.3/bConfigurationValue
