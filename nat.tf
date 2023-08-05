resource "aws_eip" "nat" {
  count = var.private_subnet ? length(data.aws_availability_zones.available) : 0
  vpc   = true
  tags  = merge(local.defaultTags, var.additionalTags, tomap({ "Name" = "nat-eip-2a-${var.vpc_name}-${var.env}" }))
  //tags = merge(local.defaultTags, var.additionalTags, tomap("Name", "nat-eip-${element(data.aws_availability_zones.available, count.index)}-${var.vpc_name}-${var.env}"))
}

resource "aws_nat_gateway" "nat" {
  count         = var.private_subnet ? length(data.aws_availability_zones.available) : 0
  allocation_id = element(aws_eip.nat[*].id, count.index)
  subnet_id     = element(aws_subnet.public[*].id, count.index)
  depends_on    = [aws_subnet.public]
  tags          = merge(local.defaultTags, var.additionalTags, tomap({ "Name" = "ngw-2a-${var.vpc_name}-${var.env}" }))
}
