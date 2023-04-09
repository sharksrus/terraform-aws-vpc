resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = merge(local.defaultTags, var.additionalTags, var.vpc_tags, tomap("Name", "${var.vpc_name}-${var.env}"))
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.defaultTags, var.additionalTags, tomap("Name", "${var.vpc_name}-${var.env}"))
}

resource "aws_route_table" "default" {
  vpc_id     = aws_vpc.vpc.id
  depends_on = [aws_internet_gateway.igw]
  tags       = merge(local.defaultTags, var.additionalTags, tomap("Name", "${var.vpc_name}-${var.env}"))
}

resource "aws_route" "routes_public" {
  route_table_id         = aws_route_table.default.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on             = [aws_route_table.default]
}

resource "aws_main_route_table_association" "main" {
  count          = var.private_subnet ? length(var.availability_zones) : 0
  vpc_id         = aws_vpc.vpc.id
  route_table_id = aws_route_table.default.id
}
