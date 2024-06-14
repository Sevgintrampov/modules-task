output "load_balancer_url" {
  value = module.lb.load_balancer_url
}
output "bastion_ip" {
  value = module.ec2.bastion_host
}
output "ec2_private_ip" {
  value = module.ec2.ec2_ip
}