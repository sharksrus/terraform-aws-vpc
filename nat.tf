resource "aws_eip" "nat" {
  /* count = var.private_subnet ? length(data.aws_availability_zones.available.names) : 0 */
  count = var.private_subnet ? 1 : 0
  vpc   = true
  tags  = merge(local.defaultTags, var.additionalTags, tomap({ "Name" = "nat-eip-${element(data.aws_availability_zones.available.names, count.index)}" }))

}

resource "aws_nat_gateway" "nat" {
  /* count         = var.private_subnet ? length(data.aws_availability_zones.available.names) : 0 */
  count = var.private_subnet ? 1 : 0
  /* allocation_id = element(aws_eip.nat[*].id, count.index)
  subnet_id     = element(aws_subnet.public[*].id, count.index) */
  allocation_id = aws_eip.nat.0.id
  subnet_id     = aws_subnet.public.0.id
  depends_on    = [aws_subnet.public]
  tags          = merge(local.defaultTags, var.additionalTags, tomap({ "Name" = "natgw-${element(data.aws_availability_zones.available.names, count.index)}" }))

}
