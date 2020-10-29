### VPC ###

output "vpc" {
  value = aws_vpc.vpc
}

output "subnets_private" {
  value = aws_subnet.private
}
