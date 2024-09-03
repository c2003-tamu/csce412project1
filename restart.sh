#!/bin/bash

# Define the instance name
INSTANCE_NAME="MyWindowsInstance"

# Function to restart the instance
restart_instance() {
    echo "Stopping instance: $INSTANCE_NAME..."
    aws lightsail stop-instance --instance-name "$INSTANCE_NAME"
    
    # Check if the stop command was successful
    if [ $? -ne 0 ]; then
        echo "Failed to stop the instance. Check the instance name and your AWS permissions."
        exit 1
    fi

    # Wait for a minute (60 seconds)
    echo "Waiting for 60 seconds before starting the instance..."
    sleep 60
    
    echo "Starting instance: $INSTANCE_NAME..."
    aws lightsail start-instance --instance-name "$INSTANCE_NAME"
    
    # Check if the start command was successful
    if [ $? -ne 0 ]; then
        echo "Failed to start the instance. Check the instance name and your AWS permissions."
        exit 1
    fi

    # Wait for another minute (60 seconds) to ensure the instance starts
    echo "Waiting for 60 seconds to ensure the instance starts..."
    sleep 60

    echo "Instance $INSTANCE_NAME has been successfully restarted."
}

# Call the restart function
restart_instance

