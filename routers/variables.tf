variable "vpc_id" {
  type    = string
  default = "vpc-0062a907480790450"
}

variable "public_subnet_ids" {
  type    = list(string)
  default = ["subnet-04a3427b99b0a960e", "subnet-0aceeb937602c4029"]
}
