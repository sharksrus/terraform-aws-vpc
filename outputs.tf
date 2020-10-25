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
  value = aws_subnet.rds
}

output "subnets_storage" {
  value = aws_subnet.storage
}

output "vpc" {
  value = aws_vpc.vpc
}
