variable "cidr" {
  description = "The IP range of the subnets"
  type        = list(string)
}
variable "region" {
  description = "AWS region"
  type        = string
}
variable "vpc_cidr" {
  description = "Amount of the available IP's in the network"
}
