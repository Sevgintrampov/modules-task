variable "region" {
  description = "This is the region"
  type        = string
  default     = "us-west-2"
}
variable "cidr" {
  description = "The IP range of the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "vpc_range" {
  description = "Amount of the available IP's in the network"
  default     = "10.0.0.0/16"
}
variable "instance_type" {
  default = "t2.micro"
}