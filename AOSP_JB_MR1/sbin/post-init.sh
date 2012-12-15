#!/system/bin/sh

#Set governor items
#echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq;
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_booted;
echo 1512000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq;

DISLIT=0
[ "`/system/xbin/busybox grep -i 1 /data/.disable_touchlight`" ] && DISLIT=1
if [ "$DISLIT" == 1 ];
then
echo 0 > /sys/class/leds/button-backlight/max_brightness;
echo 0 > /sys/class/leds/button-backlight/brightness;
fi;
echo 1 > /proc/sys/net/ipv4/tcp_tw_recycle;
echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse;
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route;
echo 0 > /proc/sys/net/ipv4/conf/default/accept_source_route;

echo $(date) END of post-init.sh
