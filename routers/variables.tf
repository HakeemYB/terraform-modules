variable "vpc_id" {
  type    = string
  default = ""
}

variable "public_subnet_ids" {
  type    = list(string)
  default = []
}
