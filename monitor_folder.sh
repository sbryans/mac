# /usr/local/bin/monitor_folder.sh
#!/bin/bash
MONITORED_FOLDER="/System"
WEBHOOK_URL="https://discord.com/api/webhooks/<UNIQUE_ID>"
COOLDOWN=10
LAST_NOTIFICATION=0
send_webhook() {
  curl -H "Content-Type: application/json" \
       -X POST \
       -d '{"content": "The folder '"$MONITORED_FOLDER"' has just been accessed."}' \
       $WEBHOOK_URL
}
monitor_folder() {
  echo "Monitoring folder: $MONITORED_FOLDER"
  /usr/bin/fs_usage -w | grep --line-buffered "$MONITORED_FOLDER" | while read -r line; do
    CURRENT_TIME=$(date +%s)
    if (( CURRENT_TIME - LAST_NOTIFICATION >= COOLDOWN )); then
      echo "Folder opened."
      send_webhook
      LAST_NOTIFICATION=$CURRENT_TIME
    else
      echo "Cooldown... skipping notifications."
    fi
  done
}
monitor_folder
