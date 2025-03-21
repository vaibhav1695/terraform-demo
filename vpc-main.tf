
# VPC block  

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true


  tags = {
    Name = "my-vpc"
  }
}

# public subnet block 

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public_subnet"
  }
}


#private Subnet Block 

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private_subnet"
  }
}

# Internet Gateway Block 

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}


# route table Block :-

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Route table associatation 

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.route.id
}
