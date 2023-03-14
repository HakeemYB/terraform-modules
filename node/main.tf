resource "aws_security_group" "this" {
  name_prefix = var.name_prefix

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block]
  }
}

output "security_group_id" {
  value = aws_security_group.this.id
}
