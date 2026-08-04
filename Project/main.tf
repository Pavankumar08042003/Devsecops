resource "aws_vpc" "prod-vpc" {
  cidr_block = var.prdvpc
  tags = {
    Name = var.vpc_name
  }

}
resource "aws_internet_gateway" "intgw" {
  vpc_id = aws_vpc.prod-vpc.id
  tags = {
    Name = "intgw"
  }
}

resource "aws_subnet" "public-subnets" {
  vpc_id                  = aws_vpc.prod-vpc.id
  count                   = length(var.public-subnets)
  cidr_block              = var.public-subnets[count.index]
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index + 1}"

  }
}


resource "aws_subnet" "private-subnets" {
  vpc_id            = aws_vpc.prod-vpc.id
  count             = length(var.private-subnets)
  cidr_block        = var.private-subnets[count.index]
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "private-subnet-${count.index + 1}"

  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.prod-vpc.id

}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.prod-vpc.id

}

resource "aws_route_table_association" "public-rt-asso" {
  route_table_id = aws_route_table.public-rt.id
  count          = length(var.public-subnets)
  subnet_id      = aws_subnet.public-subnets[count.index].id

}

resource "aws_route_table_association" "private-rt-asso" {
  route_table_id = aws_route_table.private-rt.id
  count          = length(var.private-subnets)
  subnet_id      = aws_subnet.private-subnets[count.index].id

}

