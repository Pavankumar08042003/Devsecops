resource "aws_security_group" "allow" {
  name   = "Terraform-sg"
  vpc_id = aws_vpc.prod-vpc.id
  tags = {
    Name = "Allow All"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}

data "http" "myip" {
  url = "https://checkip.amazonaws.com/"
}
