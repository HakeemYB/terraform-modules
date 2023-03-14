variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_cidr_blocks" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cidr_blocks" {
  type    = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}
