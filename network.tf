resource "aws_vpc" "name" {
  cidr_block = "192.168.0.4/16"
  tags = {
    "Name" : "Terraform-VPC"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.name.id

  tags = {
    Name = "my-internet-gateway"
  }
}

