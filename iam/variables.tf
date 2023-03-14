variable "name" {
  type    = string
  default = "eks-worker-nodes"
}

variable "policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy, arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
