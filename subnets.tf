data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
  count             = "${length(var.availability_zones)}"
  vpc_id            = "${aws_vpc.vpc.id}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  cidr_block        = "${cidrsubnet("${var.vpc_cidr}", 4, count.index)}"
  tags              = "${merge(local.defaultTags, var.additionalTags, var.public_subnet_tags, map("Name", "public-${element(var.availability_zones, count.index)}-${var.env}-${var.vpc_name}"))}"
}

resource "aws_subnet" "private" {
  count             = "${length(var.availability_zones)}"
  vpc_id            = "${aws_vpc.vpc.id}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  cidr_block        = "${cidrsubnet("${var.vpc_cidr}", 4, 6 + count.index)}"
  tags              = "${merge(local.defaultTags, var.additionalTags, var.private_subnet_tags, map("Name", "private-${element(var.availability_zones, count.index)}-${var.env}-${var.vpc_name}"))}"
}

resource "aws_subnet" "mgmt" {
  count             = "${length(var.availability_zones)}"
  vpc_id            = "${aws_vpc.vpc.id}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  cidr_block        = "${cidrsubnet("${var.vpc_cidr}", 8, 192 + count.index)}"
  tags              = "${merge(local.defaultTags, var.additionalTags, var.mgmt_subnet_tags, map("Name", "mgmt-${element(var.availability_zones, count.index)}-${var.env}-${var.vpc_name}"))}"
}

resource "aws_subnet" "storage" {
  count             = "${var.storage_subnet ? length(var.availability_zones) : 0}"
  vpc_id            = "${aws_vpc.vpc.id}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  cidr_block        = "${cidrsubnet("${var.vpc_cidr}", 8, 198 + count.index)}"
  tags              = "${merge(local.defaultTags, var.additionalTags, var.storage_subnet_tags, map("Name", "storage-${element(var.availability_zones, count.index)}-${var.env}-${var.vpc_name}"))}"
}

resource "aws_subnet" "public_isolated" {
  count             = "${var.public_isolated_subnet ? length(var.availability_zones) : 0}"
  vpc_id            = "${aws_vpc.vpc.id}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  cidr_block        = "${cidrsubnet("${var.vpc_cidr}", 8, 204 + count.index)}"
  tags              = "${merge(local.defaultTags, var.public_isolated_subnet_tags, map("Name", "public-isolated-${element(var.availability_zones, count.index)}-${var.env}-${var.vpc_name}"))}"
}

resource "aws_subnet" "rds" {
  count             = "${var.rds_subnet ? length(var.availability_zones) : 0}"
  vpc_id            = "${aws_vpc.vpc.id}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  cidr_block        = "${cidrsubnet("${var.vpc_cidr}", 8, 210 + count.index)}"
  tags              = "${merge(local.defaultTags, var.additionalTags, var.rds_subnet_tags, map("Name", "rds-${element(var.availability_zones, count.index)}-${var.env}-${var.vpc_name}"))}"
}
