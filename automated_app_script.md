#!/bin/bash

# Update and upgrade system

sudo apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# Install Nginx Web Server

sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y

# Download and configure Node.js (Version 20.x)

curl -fsSL https://deb.nodesource.com/setup_20.x -o setup_nodejs.sh
sudo DEBIAN_FRONTEND=noninteractive bash setup_nodejs.sh

# Install Node.js

sudo DEBIAN_FRONTEND=noninteractive apt-get install nodejs -y

# Verify Node.js Installation

node -v

# Install unzip utility

sudo DEBIAN_FRONTEND=noninteractive apt-get install unzip -y

# Extract the application files

unzip nodejs20-sparta-test-app-2.zip
cd nodejs20-sparta-test-app-2/
cd app

# Install dependencies

npm install

# Start the application

npm start

# Set environment variables for DB connection

export DB_HOST=mongodb://10.0.3.4:27017/posts

# Print the environment variable (debugging purposes)

printenv DB_HOST

# Seed the database

node seeds/seed.js

# Restart the application

npm start

echo "Setup complete!"






Mongo Script 

#!/bin/bash

# Update and upgrade the system
sudo apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# Install MongoDB 7 (ensure the correct version is installed)
# Add MongoDB 7.x repository
wget -qO - https://www.mongodb.org/static/pgp/server-7.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# Update apt package list
sudo apt update -y

# Install MongoDB 7
sudo apt install -y mongodb-org

# Ensure MongoDB starts automatically on reboot
sudo systemctl enable mongod

# Configure MongoDB to bind to all IP addresses (0.0.0.0)
# Update bind IP in MongoDB config file using sed
sudo sed -i 's/^bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf

# Restart MongoDB to apply changes
sudo systemctl restart mongod

# Start MongoDB service
sudo systemctl start mongod

# Verify MongoDB is running
sudo systemctl status mongod

# Test MongoDB connection (locally)
mongo --eval "db.runCommand({ connectionStatus: 1 })"

# If necessary, open MongoDB port (27017) to external connections
# Assuming firewall is UFW, otherwise adjust for your environment
sudo ufw allow 27017

# Print MongoDB connection string
echo "MongoDB 7 is running and accessible at mongodb://0.0.0.0:27017"





for an app virtual machine 


#!/bin/bash

# update
sudo apt update -y

# upgrade exclude debian
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# install nginx exclude debian
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y

# restart nginx
sudo systemctl restart nginx

# enable nginx
sudo systemctl enable nginx

# use curl to download the nodejs setup file
curl -fsSL https://deb.nodesource.com/setup_20.x -o setup_nodejs.sh

# run the setup file through bash
sudo DEBIAN_FRONTEND=noninteractive bash setup_nodejs.sh

# install nodejs
sudo DEBIAN_FRONTEND=noninteractive apt install nodejs -y

# install unzip
sudo DEBIAN_FRONTEND=noninteractive apt install unzip -y

# download sparta-app from github
git clone 

# cd into sparta-app
cd sparta-app

# unzip folder
unzip nodejs20-sparta-test-app-2.zip

# go into app folder
cd app

# install app
npm install

# start app
npm start &

# show that the app is running
echo "Checking if the app is running..."
sleep 5
if curl -s http://localhost:3000 > /dev/null; then
    echo "App is running successfully on port 3000!"
else
    echo "Failed to start the app. Check logs for more details."
fi








# For the DB VM 

#!/bin/bash

# Update & Upgrade the system
echo "Updating and upgrading the system..."
sudo apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# Install Nginx
echo "Installing Nginx..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl restart nginx

# Install Node.js v20
echo "Setting up Node.js v20..."
curl -fsSL https://deb.nodesource.com/setup_20.x -o setup_nodejs.sh
sudo DEBIAN_FRONTEND=noninteractive bash setup_nodejs.sh
sudo DEBIAN_FRONTEND=noninteractive apt-get install nodejs -y
echo "Node.js version:"
node -v

# Install unzip utility
echo "Installing unzip..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install unzip -y

# Extract and prepare the app
echo "Extracting the application files..."
unzip nodejs20-sparta-test-app-2.zip
cd nodejs20-sparta-test-app-2/app || { echo "App folder not found! Exiting."; exit 1; }

# Install app dependencies
echo "Installing application dependencies..."
npm install

# Set MongoDB environment variable
export DB_HOST="mongodb://10.0.3.4:27017/posts"
echo "DB_HOST set to $DB_HOST"

# Seed the database
echo "Seeding the database..."
node seeds/seed.js

# Start the app in the background
echo "Starting the app in the background..."
npm start > /dev/null 2>&1 &

# Verify the app is running
echo "Verifying the app is running on port 3000..."
sleep 5
if curl -s http://localhost:3000 > /dev/null; then
    echo "App is running successfully on port 3000!"
else
    echo "Failed to start the app. Check logs for errors."
fi

echo "App setup complete!"








```bash 
new fresh 

#!/bin/bash

# update
sudo apt update -y

# upgrade exclude debian
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# install nginx exclude debian
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y

# restart nginx
sudo systemctl restart nginx

# enable nginx
sudo systemctl enable nginx

# use curl to download the nodejs setup file
curl -fsSL https://deb.nodesource.com/setup_20.x -o setup_nodejs.sh

# run the setup file through bash
sudo DEBIAN_FRONTEND=noninteractive bash setup_nodejs.sh

# install nodejs
sudo DEBIAN_FRONTEND=noninteractive apt install nodejs -y

# install unzip
sudo DEBIAN_FRONTEND=noninteractive apt install unzip -y

# download sparta-app from github
git clone https://github.com/Thomasebden/sparta-app

# cd into sparta-app
cd sparta-app

# unzip folder
unzip nodejs20-sparta-test-app-2.zip

#go to folder "nodejs20-sparta-test-app-2.zip"
cd nodejs20-sparta-test-app-2/

# go into app folder
cd app

# install app
npm install

# start app
npm start &

# show that the app is running

sleep 5
if curl -s http://localhost:3000 > /dev/null; then
    echo "App is running successfully on port 3000!"
else
    echo "Failed to start the app. Check logs for more details."
fi
```