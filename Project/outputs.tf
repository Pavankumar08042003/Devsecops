output "subnetids" {
  value = aws_subnet.public-subnets.*.id

}
output "ec2" {
  value = aws_instance.ec2.public_ip

}
