resource "aws_vpc" "name" {

  cidr_block = "192.168.0.0/16"
  tags = {
    "Name" : "Terraform-VPC"
  }
}
#added igw for this code

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.name.id

  tags = {
    Name = "int-internet-gateway"
  }
}

terraform {
  backend "s3" {
    bucket = "devopsbucket08"
    key    = "statefile"
    region = "ap-south-1"
  }
}


