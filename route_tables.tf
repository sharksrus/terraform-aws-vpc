resource "aws_route_table" "public" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.defaultTags, var.additionalTags, map("Name", "public-${element(var.availability_zones, count.index)}-${var.env}-${var.vpc_name}"))
}

resource "aws_route" "default_public" {
  count                  = var.private_subnet ? length(var.availability_zones) : 0
  route_table_id         = element(aws_route_table.public.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_route_table.public]
}

resource "aws_route_table" "private" {
  count  = var.private_subnet ? length(var.availability_zones) : 0
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.defaultTags, var.additionalTags, map("Name", "private-${element(var.availability_zones, count.index)}-${var.env}-${var.vpc_name}"))
}

resource "aws_route" "default_private" {
  count  = var.private_subnet ? length(var.availability_zones) : 0
  route_table_id         = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.0.id
  depends_on             = [aws_route_table.private]
}

resource "aws_route_table_association" "private" {
  count          = var.private_subnet ? length(var.availability_zones) : 0
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

resource "aws_route_table_association" "public" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = element(aws_route_table.public.*.id, count.index)
}

resource "aws_route_table_association" "rds" {
  count          = var.rds_subnet ? length(var.availability_zones) : 0
  subnet_id      = element(aws_subnet.rds.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}
