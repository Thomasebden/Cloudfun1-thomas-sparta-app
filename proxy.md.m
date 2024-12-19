how many

2. 
you get the error you are trying to get a sceond app  instance to use port 3000 but its already in use by the first app instance. 

3. 
find the linux command that allows you to find out the process using port 3000?

 ps aux | grep node


3. fix error 
kill -1 1716
use the kills command on the pid given by the netstat command 



proxy 
1. 
   
2. sudo nano /etc/nginx/sites-available/default

go to location and view 

3. replaces the text 
sudo sed -i 's|try_files.*;|proxy_pass http://localhost:3000/;|' /etc/nginx/sites-available/default

restart nginx 



note from kip to make an exceutable script using nano 

touch app_provision_script.sh

nano app_provision_script.sh 

copy and paste the script into the nano file

press control x

then press ycd 
then enter 

then to make the file executable

chmod +x app_provision_script.sh 

to run the script 

./app_provision_script.sh 

this makes a file which I can run my code in



