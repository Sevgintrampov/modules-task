output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}
output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}
output "security_groups_lb_id" {
  value = aws_security_group.elb_sg.id
}
output "security_groups_ec2_id" {
  value = aws_security_group.ec2_sg.id
}
output "security_groups_bastion_id" {
  value = aws_security_group.bastion_sg.id
}