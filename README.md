# Creating Virtual Machines (VMs), Connecting VMs, Automating scripts to run an app on the internet, User Data & Imaging

## Introduction 
This Document will show my processes of creating and connecting Virtual Machine, creating script manually and automatically and setting up virtual machine using User Data and Imaging. I will first show how I created a Vitural Machine (VM) with Microsoft Azure and so on with the following steps to finish with Imaging. This document will show my process including blockers and obsticles, the purpose of this document is to enable the reader to be able follow the steps successfuly to be able to make a finished app with the created qualities.

# Creating Virtual Machines
This section shows the process of creating VMs on Microsoft Azure. To create a two tier app, two virtual machines are needed, one to host the app and one to provide a working databse for the the app's "post" page.

To create the second "databse VM, a private subnet should be used and placed in a different zone, repeating the steps below.  

Before creating VMs, the user must have created a private key and have it stored on in a secure shell (.ssh) and have it saved securely in Azure. 

The user must also have a virtual network set up to use as well.


## Step 1. Open Azure
The user will need to open a Microsoft Azuer account and navigate to the home page. 

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.30.50.png>)

## Step 2. Select Create Virtual Machines 
Select Create Virtual Machine. 

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.32.22.png>)

## Step 3. Virtual Machine Basics

It was important to me to select the correct resource group, name the virtual machine in line with my organisations conventions ( Poject Name, Name, Department, location, function, object). 

I ensured that the region my Vm was physically operating in was the South of England, (according to project specifications). My Availability zone was set to zone 1, it is import to make sure that when selecting zone two, that only one zone is selected at a time. 

The Image used to set up my basic Vm was Ubuntu 22.04 x64 Gen2

The size I used for my Vm was the Standard B1s 

My Username, although not changed in this example, was changed. This is a good example of a small "blocker" as, upon review, I needed to go back and change it. 

 I Used my SSH public key and I used my existing key stored in my Asure User as seen below, selecting that key. This is important to make sure I would not run into any blockers with my security in connecting to my Vm via my local machines terminal. 


![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.34.21.png>) 
![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.44.31.png>) 

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.44.55.png>) 

## Step 4. Disk

I changed my disk size to the standard SSD size to prevent incurring avoidable expenses. 

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.46.07.png>) 

## Setp 5. Networking 

I always ensure that I am operating my Vm on my own Virtual Network. For this Vm (my provision Vm) I want my Subnet to be my Private subnet. Port SSH (22) is open for my inbound rule, allowing me to connect to my Vm througn my SSH with my private key. I also wan to be able to access the vm through the internet and so Select Http 80.

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.47.46.png>) 

Addititonal steps are needed to ensure that virtual machines can be accessed via the internet and to ensure they can be connected to eachother, 

Selecting, "Create New NIC security group" should take you to this page. "Selecting Add Inboun" rule allows the creation of access to both to port 80 and port 3000 by changing the destination port ranges value, this needs to be done once for each port. 

![alt text](<Screenshot 2024-12-17 at 16.22.35.png>)

![alt text](<Screenshot 2024-12-17 at 16.22.47.png>)

![alt text](<Screenshot 2024-12-17 at 16.23.38.png>)

## Step 6. Management

No changes were made 

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.48.33.png>) 

## Step 7. Monitoring

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.48.52.png>) 

## Step 8. Advanced

This is an important step in automation using User Data and Imaging, but for now this machine will use maual scripting. 

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.49.12.png>) 

## Step 9. Tags 

I tagged my machine so that it can be recognised as mine, so that other people know who it belongs to and so that I can find it myself quickly.

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.50.05.png>) 

## Step 10. Review and Create 

It is important to review you Vm details. I reviewed my Vm details to make sure that I would not come up with future blockers.  
In this instance I forgot to change my username ! 

I spotted tjhis blocker and went back tio change it and double check all other details. 

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.55.32.png>) 

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.55.50.png>) 

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.56.37.png>) 

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.57.11.png>) 

## Step 11. Create ! 

Once Create is pressed the Vm will start to deploy. 
 
![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.58.31.png>) 

## Step 12. View Deployed Resource
Here now you can see the details and actions which can effect the virtual machine, such as Start/ Stop, connect and delete. 

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.59.31.png>) 




# Connecting to the Virtual Machine via Port SSH

From the Main Vm page I selected "Connect" to connect to my Vm 

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 14.59.59.png>) 


For the task, we needed to be able to connect to our Virtual machine via Private Key using the SSH we had earlier created. Selecting "Native SSH" alllows me to connect in this way.

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 15.00.34.png>)

 * Following the intrustions provided by Azure, you can open a a bash terminal in your machine. 

* It best practice to first enter ```PWD``` (Print Working Director), this will print what directory I am in and allows me to check that I am in my user directory. To see what is contained within my directory, I can enter "ls" (list) which prints the contents. 
  
* Then ```cd``` (change directory ) into your ```.ssh``` file by entering  ```cd .ssh``. 
  
  ![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 15.02.28.png>)

* Azure kindly supplies a line of code in "3. Copy and execute SSH command" but this needs to be edited to contain the directory to your private key. For example, below.

```ssh -i cloudfun1-thomas-key adminuser@172.187.128.190``` 

the code is broken down into 3 main parts the path ```ssh -i``` , the key ```cloudfun1-thomas-key``` , and your username@VM'sIPadress ```adminuser@172.187.128.190``` . Azure will not give you your keey automatically and so it is needed to paste in your key correcly as shown otherwise a blocker will occur as shown below. 

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 15.04.25.png>)

## Correct connection should look like this 

![alt text](<../../Images/Making a vm/Screenshot 2024-12-11 at 15.40.34.png>)




# Manually Creating Script 

Both scripts were developed manually over the course of multiple days. this script is annotated with the purpose of each line of code to explain what it should do 

Database Script for VM 2 

this must be the first script to run ! 

running each line at a time should enable you check that each code line works succesfully and enables you to troubleshoot faster. 

```#!/bin/bash``` 

all bash scripts must start with a shabang. 

```
# Update and internet test; 

sudo apt update -y

# upgrade the system

sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# Install gnupg and curl.

sudo DEBIAN_FRONTEND=noninteractive apt-get install gnupg curl

#To import the MongoDB public GPG key, run the following command:
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg --yes -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

#Create the list file /etc/apt/sources.list.d/mongodb-org-7.0.list for your version of Ubuntu.

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

#Reload the package database.

sudo apt-get update

#Install the MongoDB Community Server.
#You can install either the latest stable version of MongoDB or a specific version of MongoDB (we are using 7.6).

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6


#Optional. Although you can specify any available version of MongoDB, apt-get will upgrade the packages when a newer version becomes available. To prevent unintended upgrades, you can pin the package at the currently installed version:

echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-database hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-mongosh hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections

# Start Mongod 

sudo systemctl start mongod

# Configure MongoDB to bind to all IP addresses (0.0.0.0)
# Update bind IP in MongoDB config file using "sed"
sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf

# Restart MongoDB to apply changes

sudo systemctl restart mongod

# Ensure MongoDB starts automatically on reboot

echo enable mongod ...
sudo systemctl enable mongod
echo done!

# Verify MongoDB is running

sudo systemctl status mongod

```

## The annotated script for the provisional Vm can be found below 


```
#!/bin/bash

#provision script
#making the script idempotent: removes the previous app file so there is no need to overwrite and have user input
rm -rf sparta-app

# update
sudo apt update -y

# upgrade include debian
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# install nginx debian
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y

# Creates reverse proxy
sudo sed -i 's|try_files.*;|proxy_pass http://localhost:3000/;|' /etc/nginx/sites-available/default

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

# download sparta-app from github # use ramons github and remove the need to unzip.
git clone https://github.com/Thomasebden/sparta-app.git

# install pm2 globally
sudo npm install -g pm2

# cd into sparta-app
cd sparta-app/app

# create a environment variable
export DB_HOST=mongodb://10.0.3.4:27017/posts

# install app
npm install

# idempotency
pm2 kill

# start node.js app with pm2
pm2 start app.js

# show that the app is running
sleep 5
if curl -s http://localhost:3000 > /dev/null; then
    echo "App is running successfully on port 3000!"
else
    echo "Failed to start the app. Check logs for more details."
fi
```



# Installing PM2 

Pm2 is used to allow the provisional app to be run in the background of the terminal, this is good because it enables use of the terminal but means that it will continue to run until the process is "killed".  The below process shows my initial install of PM2 which was later refined in the above script after causing complications.

![alt text](<Screenshot 2024-12-18 at 12.23.14.png>)

![alt text](<Screenshot 2024-12-18 at 12.23.45.png>)


# Reverse proxy 

I created a reverse proxy, this enables the user to be able to view to the posts page without seeing what port they are accessing. 

![alt text](<Screenshot 2024-12-18 at 14.00.48.png>)

on the righthand side you can see that I am Using a code which I researched to find, and implemented in my code under "proxy"

![alt text](<Screenshot 2024-12-19 at 12.37.14.png>)

the result can be seen below

![alt text](<Screenshot 2024-12-19 at 12.40.02.png>)

you can see where my change was inplemented in my code here. 

![alt text](<Screenshot 2024-12-19 at 12.42.44.png>)


# Blockers

Before installing and using my PM2, I could not make my script idempotent and so I needed to find a solution. With help from team mates I was able to establish that: 

* I needed to create a new Repo with the dowloaded app unzipped on github. 
* This needed to be done manually in a terminal. 
* I also needed to then remove my ```unzip``` commands and following ```cd``` commands.
* I needed to install Pm2 on my script and have it functioning. 
* I also needed to create a envrionment varialble to connect to my other VM so my database would appear
* 

![alt text](<Screenshot 2024-12-18 at 16.33.33.png>)

## making the script idempotent 

A really good example of me overcoming blockers was the issue of overwriting my ```Curl``` command. This was very intricate and needed special placement to allow an overwrite using ```--yes``` this was a significant blocker as it required examplary attention to detail anmd really took me hours to find. 


![alt text](<Screenshot 2024-12-19 at 14.01.23.png>)


# Automating script

To Automate the script the process of creating an executable file needs to be done.

![alt text](<Screenshot 2024-12-19 at 14.05.43.png>)

The above image shows what must be done in order to create an executeable. Once logged in to the blank virtual machine, enter: 

```touch app_database.sh``` 

this creates a file called app_database.sh 

enter 
```nano app_database``` 

this enables the file to be a text edit file and will take you into the nano file. 

![alt text](<Screenshot 2024-12-20 at 09.54.56.png>)

copy and paste the script into the nano file and then saving and exiting the file will ensure that the script is saved within the Vm. 


![alt text](<Screenshot 2024-12-20 at 09.55.29.png>)

* changing the permissions is the next step, 
* the below cammands will change the file permissions to enable the script to run. 
* ```chmod +x app_database.sh```
  
to run the app enter ```./app_database.sh```

![alt text](<Screenshot 2024-12-19 at 16.11.47.png>)


# Cloud infrastructure 

this diagram represents the different levels of automation. 

![alt text](<Screenshot 2024-12-18 at 14.31.52.png>)


# User Data

User data simply replaces the need to log into the Vm in a terminal and enter the script into a nano file. 
Once the scripts for boths apps are indempotent, and can be run on fresh VMs. The scripts are ready to be entered into the "User Data" entry.

This means that once logged on to your vms after creating both the database and provision vm as shown above in this document, however when it comes to "advanced " I need to enter the script for the vm into the "user data" and enable User Data as shown below. After this I should be able to automatically enter the provsional Vm public IP into a web browser and view the two teir app as shown in the slides below. 


![alt text](<Screenshot 2024-12-18 at 14.33.21.png>)

![alt text](<Screenshot 2024-12-20 at 09.42.28.png>)

![alt text](<Screenshot 2024-12-20 at 09.43.35.png>)

![alt text](<Screenshot 2024-12-20 at 09.51.43.png>)

![alt text](<Screenshot 2024-12-20 at 09.52.21.png>)

![alt text](<Screenshot 2024-12-20 at 09.52.35.png>)

![alt text](<Screenshot 2024-12-20 at 09.52.50.png>)

# Conclusion
As you can see, my app works on a two tier basis, using manual, bash scripting and User Data  














