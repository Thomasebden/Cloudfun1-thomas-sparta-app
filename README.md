#update
sudo apt update -y
 
# upgrade exclude debian
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
 

link to official installation point

https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/#std-label-install-mdb-community-ubuntu


127.0.0.1 
"local host "

mongo will only accept connections from where it is installed

sed -i 's/old-text/new-text/g' input.txt

sudo sed -i.bak 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf && sudo systemctl restart mongod
   http://172.187.147.50:3000/

   Blockers

   scp -i cloudfun1-thomas-az /Users/thomasebden/downloads/nodejs20-sparta-test-app-2.zip adminuser@172.187.147.50:/home/adminuser
   ls
   nodejs20-sparta-test-app-2.zip  setup_nodejs.sh
   adminuser@cloudfun1-thomas-se-uks-sparta-app:~$ cd nodejs20-sparta-test-app-2.zip
   -bash: cd: nodejs20-sparta-test-app-2.zip: Not a directory
   adminuser@cloudfun1-thomas-se-uks-sparta-app:~$ sudo DEBIAN_FRONTEND=noninteractive apt-get install unzip -y
   

Changing the permissions 
   cd nodejs20-sparta-test-app-2/
   -bash: cd: nodejs20-sparta-test-app-2/: Permission denied
   adminuser@cloudfun1-thomas-se-uks-sparta-app:~$ sudo chmod 777 nodejs20-sparta-test-app-2
   adminuser@cloudfun1-thomas-se-uks-sparta-app:~$ cd nodejs20-sparta-test-app-2/
   adminuser@cloudfun1-thomas-se-uks-sparta-app:~/nodejs20-sparta-test-app-2$ ls
   README.md  app
   adminuser@cloudfun1-thomas-se-uks-sparta-app:~/nodejs20-sparta-test-app-2$ cd app
   adminuser@cloudfun1-thomas-se-uks-sparta-app:~/nodejs20-sparta-test-app-2/app$ ls
   README.md  app.js  models  node_modules  package-lock.json  package.json  public  seeds  test  views
   adminuser@cloudfun1-thomas-se-uks-sparta-app:~/nodejs20-sparta-test-app-2/app$ sudo npm install
   
   
   sudo apt update & sudo apt upgrade -y
   
   sudo apt intall nginx
   
   copy downloading file 
   
    scp -i cloudfun1-thomas-az /Users/thomasebden/downloads/nodejs20-sparta-test-app-2.zip adminuser@172.187.147.50:/home/adminuser
   14# copy and download the nonde file zip
      scp -i privatekey ~/Downloads/nodejs20-sparta-test-app.zip adminuser@20.117.182.7:/home/adminuser
   
   
   nodejs20-sparta-test-app-2.zip  setup_nodejs.sh
   adminuser@cloudfun1-thomas-se-uks-sparta-app:~$ cd nodejs20-sparta-test-app-2.zip
   -bash: cd: nodejs20-sparta-test-app-2.zip: Not a directory
   adminuser@cloudfun1-thomas-se-uks-sparta-app:~$ sudo DEBIAN_FRONTEND=noninteractive apt-get install unzip -y


# Database script 

```bash 

#!/bin/bash

# Update and internet test
sudo apt update -y

# upgrade the system
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

#Install the MongoDB Community Server.
#You can install either the latest stable version of MongoDB or a specific version of MongoDB (we are using 7.6).
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
# Update bind IP in MongoDB config file using "sed"


# Restart MongoDB to apply changes
sudo systemctl restart mongod

```

# Verify MongoDB is running
```bash
sudo systemctl status mongod

# Test MongoDB connection (locally)
mongo --eval "db.runCommand({ connectionStatus: 1 })"

# Print MongoDB connection string
echo "MongoDB 7 is running and accessible at mongodb://0.0.0.0:27017"









#!/bin/bash

#i need to check the script runs multiple times 

#making the script idempotent
cd sparta-app/app
pm2 stop all
cd ../..
rm -rf sparta-app

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


#If statement to chck if there is a present directory repo for 
# download sparta-app from github # use ramons github and remove the need to unzip. 
git clone https://github.com/Thomasebden/sparta-app.git
 
# install pm2 globally
sudo npm install -g pm2

# cd into sparta-app
cd sparta-app/app

# create a environment variable
export DB_HOST=mongodb://10.0.3.4:27017/posts

# make enviroment variable persist through restart
#echo 'export DB_HOST=mongodb://10.0.3.4:27017/posts' >> ~/.bashrc

# install app
npm install

# stop app if running
#pm2 stop app.js

# idempotency
pm2 kill


# start node.js app with pm2
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





