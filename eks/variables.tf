variable "name" {
  type    = string
  default = "my-eks-cluster"
}

variable "role_arn" {
  type    = string
  default = ""
}

variable "private_subnet_ids" {
  type    = list(string)
  default = []
}
