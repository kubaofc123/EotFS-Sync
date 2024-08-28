#!/bin/bash

# Prompt the user for their username at the beginning
read -p "Enter your username: " username

cd ..

echo "Running sync every 5s..."

while true; do
    # Perform git pull
    output=$(git pull)

    # Check if any changes were pulled
    if [[ $output != *"Already up to date."* ]]; then
        # Trigger the custom Windows notification script
        ./WinNotification.bat "SaveGame updated" Asterisk "Emperor of the Fading Suns"
    fi

    status_output=$(git status --porcelain)
    if [[ -n "$status_output" ]]; then
        # Stage all changes
        git add .
        
        # Commit the changes with the username in the message
        git commit -m "$username update"
        
        # Optionally push the changes to the remote repository
        git push
        
        echo "Changes committed with message: '$username update'"
    fi

    # Wait for 5 seconds before checking again
    sleep 5
done
