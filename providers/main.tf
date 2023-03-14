provider "aws" {
  region = var.region
}

output "aws_region" {
  value = provider.aws.region
}
