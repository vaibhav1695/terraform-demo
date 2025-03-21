ubuntu@ip-172-31-80-235:~/terraform/vpc-demo$ cat outputs.tf 

output "vpc_id" {
  value = aws_vpc.main.arn
}


output "public_subnet_zone" {
  value = aws_subnet.public_subnet.availability_zone
}
