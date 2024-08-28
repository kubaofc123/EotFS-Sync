#!/bin/bash

while true; do
    # Perform git pull
    output=$(git pull)

    # Check if any changes were pulled
    if [[ $output != *"Already up to date."* ]]; then
        # Trigger the custom Windows notification script
        ./WinNotification.bat "SaveGame1 updated" Asterisk "Emperor of the Fading Suns"
    fi

    # Wait for 5 seconds before checking again
    sleep 5
done
