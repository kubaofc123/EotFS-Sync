#!/bin/bash

# Check if user_name.txt exists
if [ ! -f "user_name.txt" ]; then
    # Prompt user for their name
    echo "Enter your name:"
    read -r user_name

    # Save the name to user_name.txt
    echo "$user_name" > user_name.txt

    echo "Name saved to user_name.txt"
else
    # Read the name from user_name.txt
    user_name=$(<user_name.txt)
fi

cd ..

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
