#!/system/bin/sh

STATE_DIR=/data/adb/bootloop-protection
COUNT_FILE="$STATE_DIR/failed_boots"

# Reaching boot_completed means this boot got far enough to be considered usable.
while [ "$(getprop sys.boot_completed)" != "1" ]; do
  sleep 5
done
sleep 60
echo 0 > "$COUNT_FILE"
