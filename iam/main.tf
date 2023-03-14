resource "aws_iam_role" "this" {
  name = var.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "this" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy" # attach the default EKS cluster policy
  role       = aws_iam_role.this.name
}

resource "aws_iam_policy" "this" {
  name   = "my-custom-eks-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "eks:CreateCluster",
          "eks:DescribeCluster",
          "eks:UpdateClusterConfig",
          "eks:UpdateClusterVersion",
          "eks:UpdateNodegroupConfig",
          "eks:UpdateNodegroupVersion",
          "eks:ListNodegroups",
          "eks:CreateFargateProfile",
          "eks:DeleteFargateProfile",
          "eks:DescribeFargateProfile",
          "eks:ListFargateProfiles",
          "eks:CreateNodegroup",
          "eks:DeleteNodegroup",
          "eks:DescribeNodegroup",
          "eks:DescribeUpdate",
          "eks:ListUpdates",
          "eks:CreateAddon",
          "eks:DescribeAddon",
          "eks:ListAddons",
          "eks:DeleteAddon",
          "eks:TagResource",
          "eks:UntagResource"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "iam:PassRole"
        ]
        Resource = "*"
        Condition = {
          StringEquals = {
            "iam:PassedToService": "eks.amazonaws.com"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "this" {
  policy_arn = aws_iam_policy.this.arn
  role       = aws_iam_role.this.name
}


resource "aws_iam_role_policy_attachment" "this" {
  policy_arn = var.policy_arn
  role       = aws_iam_role.this.name
}

output "iam_role_name" {
  value = aws_iam_role.this.name
}
