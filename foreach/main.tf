resource "aws_vpc" "Hydvpc" {
  cidr_block = var.Vpccidr
  tags = {
    Name = "Hydvpc"
  }

}

resource "aws_subnet" "Subnets" {
  vpc_id     = aws_vpc.Hydvpc.id
  for_each   = var.subnets
  cidr_block = each.value
  tags = {
    Name = "Terraform-${each.key}"
  }
  lifecycle {
    prevent_destroy = false
  }

}



