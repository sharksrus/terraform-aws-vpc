### VPC ###

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_cidr" {
  value = "${aws_vpc.vpc.cidr_block}"
}

## route tables ##
output "private_route_tables" {
  value = ["${aws_route_table.private.*.id}"]
}

output "public_route_tables" {
  value = ["${aws_route_table.public.*.id}"]
}

### SUBBNETS ###
## IDs ##
output "mgmt_subnet_ids" {
  value = ["${aws_subnet.mgmt.*.id}"]
}

output "private_subnet_ids" {
  value = "${aws_subnet.private.*.id}"
}

output "public_subnet_ids" {
  value = ["${aws_subnet.public.*.id}"]
}

output "rds_subnet_ids" {
  value = "${aws_subnet.rds.*.id}"
}

output "storage_subnet_ids" {
  value = ["${aws_subnet.storage.*.id}"]
}

output "public_isolated_subnet_ids" {
  value = ["${aws_subnet.public_isolated.*.id}"]
}

#Output Prive subnets each
## private
output "private_subnet_id_0" {
  value = "${aws_subnet.private.0.id}"
}

output "private_subnet_id_1" {
  value = "${aws_subnet.private.1.id}"
}

output "private_subnet_id_2" {
  value = "${aws_subnet.private.2.id}"
}

## CIDRs ##

output "mgmt_subnet_cidrs" {
  value = ["${aws_subnet.mgmt.*.cidr_block}"]
}

output "private_subnet_cidrs" {
  value = ["${aws_subnet.private.*.cidr_block}"]
}

output "public_subnet_cidrs" {
  value = ["${aws_subnet.public.*.cidr_block}"]
}

output "storage_subnet_cidrs" {
  value = ["${aws_subnet.storage.*.cidr_block}"]
}

## NAT ##
output "nat_gateway_public_ips" {
  value = "${aws_eip.nat.*.public_ip}"
}

output "nat_gateway_public_ips1" {
  value = "${aws_eip.nat.0.public_ip}"
}

output "nat_gateway_public_ips2" {
  value = "${aws_eip.nat.1.public_ip}"
}

output "nat_gateway_public_ips3" {
  value = "${aws_eip.nat.2.public_ip}"
}
