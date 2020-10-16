data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.vpc.id
  availability_zone = element(var.availability_zones, count.index)
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  tags              = merge(local.defaultTags, var.additionalTags, var.public_subnet_tags, map("Name", "public-${element(var.availability_zones, count.index)}-${var.vpc_name}-${var.env}"))
}

resource "aws_subnet" "storage" {
  count             = var.storage_subnet ? length(var.availability_zones) : 0
  vpc_id            = aws_vpc.vpc.id
  availability_zone = element(var.availability_zones, count.index)
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 4 + count.index)
  tags              = merge(local.defaultTags, var.additionalTags, var.storage_subnet_tags, map("Name", "storage-${element(var.availability_zones, count.index)}-${var.vpc_name}-${var.env}"))
}

resource "aws_subnet" "rds" {
  count             = var.rds_subnet ? length(var.availability_zones) : 0
  vpc_id            = aws_vpc.vpc.id
  availability_zone = element(var.availability_zones, count.index)
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 8 + count.index)
  tags              = merge(local.defaultTags, var.additionalTags, var.rds_subnet_tags, map("Name", "rds-${element(var.availability_zones, count.index)}-${var.vpc_name}-${var.env}"))
}

resource "aws_subnet" "private" {
  count             = var.private_subnet ? length(var.availability_zones) : 0
  vpc_id            = aws_vpc.vpc.id
  availability_zone = element(var.availability_zones, count.index)
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, 2 + count.index)
  tags              = merge(local.defaultTags, var.additionalTags, var.private_subnet_tags, map("Name", "private-${element(var.availability_zones, count.index)}-${var.vpc_name}-${var.env}"))
}
