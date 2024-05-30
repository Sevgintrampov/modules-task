variable "instance_type" {
  description = "The size of the instance"
  type        = string
}
variable "random_pet" {
  type = string
}
variable "private_subnet" {
}
variable "security_gr_ec2" {
}
variable "public_subnet" {
}
variable "security_gr_bastion" {
}