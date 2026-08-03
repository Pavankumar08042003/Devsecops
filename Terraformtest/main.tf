resource "aws_vpc" "Terra-vp" {

  cidr_block = var.vpc_cidr
  tags = {
    Name = "Terra-vp "

  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Terra-vp.id
  tags = {
    Name = "igw"
  }
}

resource "aws_subnet" "sub1" {
  cidr_block = var.sub1
  vpc_id     = aws_vpc.Terra-vp.id
  tags = {
    Name = "sub1"

  }
}

resource "aws_subnet" "sub2" {
  cidr_block = var.sub2
  vpc_id     = aws_vpc.Terra-vp.id
  tags = {
    Name = "sub2"

  }
}


