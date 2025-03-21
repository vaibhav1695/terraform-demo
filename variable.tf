

variable "aws_instance_type" {
  default = "t3.micro"
  type    = string
}

variable "ec2_instance_ami" {
  default = "ami-08b5b3a93ed654d19"
  type    = string
}

variable "ec2_volume_size" {
  default = 10
  type    = number
}
