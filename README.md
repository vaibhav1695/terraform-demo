# terraform-demo
terraform project

-----------------------------------------------
For User_data block 
create script .sh file 
#!/bin/bash 

sudo apt-get update -y
sudo apt install nginx -y
sudo service nginx start 
sudo service nginx enable 

echo "<h1> welcome to terraform world!!! </h1>"  > /var/www/html/index.html
-----------------------
save this file in same path 

add the block in terraform file 
user_data = file ("script.sh")
-----------------------------------------------------
