resource "aws_subnet" "public" {
  count             = length(data.aws_availability_zones.available.names)
  vpc_id            = aws_vpc.vpc.id
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  tags              = merge(local.defaultTags, var.additionalTags, var.public_subnet_tags, tomap({ "Name" = "public-${element(data.aws_availability_zones.available.names, count.index)}" }))
}

resource "aws_subnet" "storage" {
  count             = var.storage_subnet ? length(data.aws_availability_zones.available.names) : 0
  vpc_id            = aws_vpc.vpc.id
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 4 + count.index)
  tags              = merge(local.defaultTags, var.additionalTags, var.storage_subnet_tags, tomap({ "Name" = "storage-${element(data.aws_availability_zones.available.names, count.index)}" }))
}

resource "aws_subnet" "rds" {
  count             = var.rds_subnet ? length(data.aws_availability_zones.available.names) : 0
  vpc_id            = aws_vpc.vpc.id
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 8 + count.index)
  tags              = merge(local.defaultTags, var.additionalTags, var.rds_subnet_tags, tomap({ "Name" = "rds-${element(data.aws_availability_zones.available.names, count.index)}" }))
}

resource "aws_subnet" "private" {
  count             = var.private_subnet ? length(data.aws_availability_zones.available.names) : 0
  vpc_id            = aws_vpc.vpc.id
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, 2 + count.index)
  tags              = merge(local.defaultTags, var.additionalTags, var.private_subnet_tags, tomap({ "Name" = "private-${element(data.aws_availability_zones.available.names, count.index)}" }))
}
