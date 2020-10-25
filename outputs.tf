output "eip" {
  value = aws_eip.nat
}

output "net" {
  value = aws_nat_gateway.nat
}

output "subnets_private" {
  value = aws_subnet.private
}

output "subnets_public" {
  value = aws_subnet.public
}

output "subnets_rds" {
  count = var.rds_subnet ? 1 : 0
  value = aws_subnet.rds
}

output "subnets_storage" {
  count = var.storage_subnet ? 1 : 0
  value = aws_subnet.storage
}

output "vpc" {
  value = aws_vpc.vpc
}
