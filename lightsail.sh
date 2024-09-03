aws lightsail create-instances \
    --instance-names "MyWindowsInstance" \
    --availability-zone us-east-2a \
    --blueprint-id "windows_server_2022" \
    --bundle-id "small_win_3_0" \
    --user-data "PowerShell script to run on instance launch"

