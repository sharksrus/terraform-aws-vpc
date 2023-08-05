resource "aws_vpc" "vpc" { #tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = merge(local.defaultTags, var.additionalTags, var.vpc_tags, tomap({ "Name" = "${var.vpc_name}" }))
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.defaultTags, var.additionalTags, tomap({ "Name" = "${var.vpc_name}" }))
}

resource "aws_route_table" "default" {
  vpc_id     = aws_vpc.vpc.id
  depends_on = [aws_internet_gateway.igw]
  tags       = merge(local.defaultTags, var.additionalTags, tomap({ "Name" = "${var.vpc_name}" }))
}

resource "aws_route" "routes_public" {
  route_table_id         = aws_route_table.default.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on             = [aws_route_table.default]
}

resource "aws_main_route_table_association" "main" {
  count          = var.private_subnet ? length(data.aws_availability_zones.available.names) : 0
  vpc_id         = aws_vpc.vpc.id
  route_table_id = aws_route_table.default.id
}
