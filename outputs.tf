### VPC ###

output "vpc" {
  value = aws_vpc.vpc
}

output "subnets_private" {
  value = [
    aws_subnet.private
  ]
}

output "nat_gateways" {
  value = aws_eip.nat
}

output "nat_gateway_eips" {
  value = aws_eip.nat
}
