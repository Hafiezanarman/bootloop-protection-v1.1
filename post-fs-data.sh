#!/system/bin/sh

STATE_DIR=/data/adb/bootloop-protection
COUNT_FILE="$STATE_DIR/failed_boots"
MAX_ATTEMPTS=3

mkdir -p "$STATE_DIR"
count=0
if [ -r "$COUNT_FILE" ]; then
  count=$(cat "$COUNT_FILE" 2>/dev/null)
fi
case "$count" in
  ''|*[!0-9]*) count=0 ;;
esac
count=$((count + 1))
echo "$count" > "$COUNT_FILE"

if [ "$count" -ge "$MAX_ATTEMPTS" ]; then
  for module_dir in /data/adb/modules/*; do
    [ -d "$module_dir" ] || continue
    [ -e "$module_dir/disable" ] && continue
    : > "$module_dir/disable"
  done
  echo 0 > "$COUNT_FILE"
  echo "Disabled all Magisk modules after $count unsuccessful boot attempts." > "$STATE_DIR/last_action"
fi
