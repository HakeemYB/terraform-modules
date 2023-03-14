resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)

  cidr_block = var.public_subnet_cidr_blocks[count.index]
  vpc_id     = aws_vpc.this.id
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)

  cidr_block = var.private_subnet_cidr_blocks[count.index]
  vpc_id     = aws_vpc.this.id
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  value = aws_subnet.private.*.id
}
