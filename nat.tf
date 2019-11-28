resource "aws_eip" "nat" {
  count = length(var.availability_zones)
  vpc   = true

  tags = merge(local.defaultTags, var.additionalTags, map("Name", "nat-eip-${element(var.availability_zones, count.index)}-${var.vpc_name}-${var.env}"))
}

resource "aws_nat_gateway" "nat" {
  count         = length(var.availability_zones)
  allocation_id = element(aws_eip.nat.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)
  depends_on    = ["aws_subnet.public"]

  tags = merge(local.defaultTags, var.additionalTags, map("Name", "ngw-${element(var.availability_zones, count.index)}-${var.vpc_name}-${var.env}"))
}
