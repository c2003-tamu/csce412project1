#!/bin/bash

# Define the instance name
INSTANCE_NAME="MyWindowsInstance"

# Run the AWS CLI command to get instance access details
ACCESS_DETAILS=$(aws lightsail get-instance-access-details --instance-name "$INSTANCE_NAME" --output json)

# Check if the command was successful
if [ $? -ne 0 ]; then
    echo "Failed to retrieve access details. Make sure the instance name is correct and you have the required permissions."
    exit 1
fi

# Parse the output for password, username, and ipAddress using jq
PASSWORD=$(echo "$ACCESS_DETAILS" | jq -r '.accessDetails.password')
USERNAME=$(echo "$ACCESS_DETAILS" | jq -r '.accessDetails.username')
IP_ADDRESS=$(echo "$ACCESS_DETAILS" | jq -r '.accessDetails.ipAddress')

# Check if jq was able to extract values
if [ -z "$PASSWORD" ] || [ -z "$USERNAME" ] || [ -z "$IP_ADDRESS" ]; then
    echo "Failed to parse the access details. The instance might not be set up for password-based access."
    exit 1
fi

# Output the details
echo "Username: $USERNAME"
echo "Password: $PASSWORD"
echo "IP Address: $IP_ADDRESS"

