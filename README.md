# Mac

The script(s) in this repository can be installed to monitor system activity.

> BASH, a Unix shell is used as macOS has widely supported this shell since the early 2000's.

## How to run:

1. Navigate to the working directory where the script is located.
2. ```chmod +x script.sh```
3. Move the script to the location specified on the first line of the .sh file.

> It's worth noting that LaunchDaemons are preferred over LaunchAgents in the macOS ecosystem as they are ideal for background processes.

# Daemon level modifications
Setting daemons
1. ```sudo chmod 644 com.daemon_name.plist```
2. ```sudo mv com.daemon_name.plist /Library/LaunchDaemons/```

Loading daemons

```sudo launchctl load /Library/LaunchDaemons/com.daemon_name.plist```

Unloading daemons

```sudo launchctl unload /Library/LaunchDaemons/com.daemon_name.plist```
