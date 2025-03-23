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

meta Argument using : Count  and for_each  :-

Using Meta Argument  # count :-
count = 3   

OUTPUT - File :-
output "aws_ec2_public_ip" {
        value = aws_instance.my-instance[*].public_ip
}
output "aws_ec2_public_dns" {
        value = aws_instance.my-instance[*].public_dns
}
output "aws_root_size" {
        value = aws_instance.my-instance[*].root_block_device[*]
}


using meta argument # for_each :-

  for_each = ({
        vaibhav_micro = "t2.micro"
        vishal_micro = "t2.micro"
})

OUTPUT FiLE :---
output "aws_ec2_public_ip" {
  value = [
    for ip  in aws_instance.my-instance  : ip.public_ip
  ]
}
ubuntu@ip-1

