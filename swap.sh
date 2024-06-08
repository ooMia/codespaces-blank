#!/bin/bash
# ref: https://repost.aws/knowledge-center/ec2-memory-swap-file

# 1. create a swap file on the root file system
sudo dd if=/dev/zero of=/swapfile bs=128M count=32
# 2. Update the read and write permissions for the swap file
sudo chmod 600 /swapfile
# 3. Set up a Linux swap area
sudo mkswap /swapfile
# 4. Make the swap file available for immediate use
sudo swapon /swapfile
# 5. Verify that the procedure was successful
sudo swapon -s
# 6. Start the swap file at boot time
echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab
