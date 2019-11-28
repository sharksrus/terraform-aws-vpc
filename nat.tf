resource "aws_eip" "nat" {
  count = "${length(var.availability_zones)}"
  vpc   = true

  tags = "${merge(local.defaultTags, var.additionalTags, map("Name","nat-eip-${element(var.availability_zones, count.index)}-${var.env}-${var.vpc_name}"))}"
}

resource "aws_nat_gateway" "nat" {
  count         = "${length(var.availability_zones)}"
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.mgmt.*.id, count.index)}"
  depends_on    = ["aws_subnet.mgmt"]

  tags = "${merge(local.defaultTags, var.additionalTags, map("Name","ngw-${element(var.availability_zones, count.index)}-${var.env}-${var.vpc_name}"))}"
}
