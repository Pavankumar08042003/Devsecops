resource "aws_instance" "ec2" {
  ami           = var.ami
  key_name      = "Pavan"
  instance_type = "t3.micro"
  tags = {
    Name = " Terraform-Ec2"
  }
  subnet_id       = aws_subnet.public-subnets[0].id
  security_groups = [aws_security_group.allow.id]



}
