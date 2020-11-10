### VPC ###

output "vpc" {
  value = aws_vpc.vpc
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

output "subnets_private" {
  value = aws_subnet.private
}

output "nat_gw_eips" {
  value = aws_eip.nat
}
