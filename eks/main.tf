resource "aws_eks_cluster" "this" {
  name     = var.name
  role_arn = var.role_arn
  vpc_config {
    subnet_ids = var.private_subnet_ids
  }
}

output "eks_cluster_name" {
  value = aws_eks_cluster.this.name
}
