#!/bin/bash

#i need to check the script runs multiple times 

#making the script idempotent
cd sparta-app/app
pm2 stop app.js
cd ../..
rm -rf sparta-app
rm -rf repo
rm -rf __MACOSX


# update
sudo apt update -y

# upgrade include debian
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# install nginx debian
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

#If statement to chck if there is a present directory repo for 

# download sparta-app from github # use ramons github and remove the need to unzip. 
#git clone https://github.com/Thomasebden/sparta-app

git clone https://github.com/daraymonsta/tech201-sparta-app repo

# install pm2 globally
sudo npm install -g pm2

# cd into sparta-app
cd sparta-app

# unzip folder
unzip nodejs20-sparta-test-app-2.zip

# create a environment variable
export DB_HOST=mongodb://10.0.3.4:27017/posts

# make enviroment variable persist through restart
#echo 'export DB_HOST=mongodb://10.0.3.4:27017/posts' >> ~/.bashrc

#go to folder "nodejs20-sparta-test-app-2.zip"
cd nodejs20-sparta-test-app-2/

# go into app folder
cd app

# install app
npm install

# stop app if running 
#pm2 stop app.js

# idempotency
pm2 kill


# start node.js app with pm2 -- name "my -sparta-app"
pm2 start app.js

#check versions
node.js -v
npm -v

# populate the database (ice)
#node seeds/seed.js

# start app
#npm start &

# show that the app is running

sleep 5
if curl -s http://localhost:3000 > /dev/null; then
    echo "App is running successfully on port 3000!"
else
    echo "Failed to start the app. Check logs for more details."
fi
