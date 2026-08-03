resource "aws_vpc" "Terra-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    name = "Terra-vpc "

  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Terra-vpc.id
  tags = {
    name = "igw"
  }
}

resource "aws_subnet" "sub1" {
  cidr_block = var.sub1
  vpc_id     = aws_vpc.Terra-vpc.id
  tags = {
    name = "sub1"

  }
}

resource "aws_subnet" "sub2" {
  cidr_block = var.sub2
  vpc_id     = aws_vpc.Terra-vpc.id
  tags = {
    name = "sub2"

  }
}

  
