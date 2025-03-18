
#1 vpc , 1 subnet , 1 security group 

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags= {
    Name = "my-vpc"
}
}

resource "aws_subnet" "pb_sn" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
}

}

resource "aws_security_group" "sg" {
  name        = "my_sg"
  description = "Public_security"
  vpc_id      = aws_vpc.my-vpc.id

  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

}

  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]


}

  tags = {
    Name = "vpc_sg"
  }

}
