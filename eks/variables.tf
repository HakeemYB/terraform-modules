variable "name" {
  type    = string
  default = "my-eks-cluster"
}

variable "role_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

variable "private_subnet_ids" {
  type    = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}
