resource "aws_network_acl" "public_isolated" {
  count      = "${var.public_isolated_subnet ? 1 : 0}"
  vpc_id     = "${aws_vpc.vpc.id}"
  subnet_ids = "${aws_subnet.public_isolated.*.id}"

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = "${merge(local.defaultTags, map("Name", "public-isolated-${var.env}-${var.vpc_name}"))}"
}

resource "aws_network_acl_rule" "egress_default_allow" {
  count          = "${var.public_isolated_subnet ? 1 : 0}"
  network_acl_id = aws_network_acl.public_isolated[count.index]
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "egress_deny_vpc_traffic" {
  count          = "${var.public_isolated_subnet ? 1 : 0}"
  network_acl_id = aws_network_acl.public_isolated[count.index]
  rule_number    = 99
  egress         = true
  protocol       = "-1"
  rule_action    = "deny"
  cidr_block     = "${var.vpc_cidr}"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "public_isolated" {
  count          = "${var.public_isolated_subnet ? length(var.availability_zones) : 0}"
  network_acl_id = aws_network_acl.public_isolated[count.index]
  rule_number    = "${1 + count.index}"
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "${cidrsubnet("${var.vpc_cidr}", 8, 246 + count.index)}"
  from_port      = 0
  to_port        = 0
}
