#!/bin/bash

# Update and upgrade the system
sudo apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# Import the public key.
sudo DEBIAN_FRONTEND=noninteractive apt-get install gnupg curl

#To import the MongoDB public GPG key, run the following command:
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

#Create the list file /etc/apt/sources.list.d/mongodb-org-7.0.list for your version of Ubuntu.
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

#Reload the package database.
sudo apt-get update

#Install MongoDB Community Server.
#You can install either the latest stable version of MongoDB or a specific version of MongoDB.
sudo apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6

#Optional. Although you can specify any available version of MongoDB, apt-get will upgrade the packages when a newer version becomes available. To prevent unintended upgrades, you can pin the package at the currently installed version:
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-database hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-mongosh hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections

# Start Mongod 
sudo systemctl start mongod

# Ensure MongoDB starts automatically on reboot
sudo systemctl enable mongod

# Configure MongoDB to bind to all IP addresses (0.0.0.0)
# Update bind IP in MongoDB config file using sed
sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

# Restart MongoDB to apply changes
sudo systemctl restart mongod

# Verify MongoDB is running
# "sudo systemctl status mongod"

# Test MongoDB connection (locally)
mongo --eval "db.runCommand({ connectionStatus: 1 })"

# Print MongoDB connection string
echo "MongoDB 7 is running and accessible at mongodb://0.0.0.0:27017"