variable "cidr_block" {
  description = "CIDR block for the VPC."
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for the public subnets."
  type        = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for the private subnets."
  type        = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}
