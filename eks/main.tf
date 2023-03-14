resource "aws_iam_role" "demo" {
  name = var.name

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

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
