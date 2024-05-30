output "instance_id" {
  value = aws_instance.nginx_instance.id
}
output "bastion_host" {
  value = aws_instance.bastion_host.public_ip
}
output "ec2_ip" {
  value = aws_instance.nginx_instance.private_ip
}