#endpoints
#s3
resource "aws_vpc_endpoint" "private_s3" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.region}.s3"
}

resource "aws_vpc_endpoint_route_table_association" "mgmt_s3" {
  count           = length(var.availability_zones)
  vpc_endpoint_id = aws_vpc_endpoint.private_s3.id
  route_table_id  = element(aws_route_table.public.*.id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  count           = length(var.availability_zones)
  vpc_endpoint_id = aws_vpc_endpoint.private_s3.id
  route_table_id  = "${element(aws_route_table.private.*.id, count.index)}"
}

resource "aws_vpc_endpoint_route_table_association" "public_s3" {
  count           = length(var.availability_zones)
  vpc_endpoint_id = aws_vpc_endpoint.private_s3.id
  route_table_id  = element(aws_route_table.public.*.id, count.index)
}

#dynamodb
resource "aws_vpc_endpoint" "private_dynamo" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.region}.dynamodb"
}

resource "aws_vpc_endpoint_route_table_association" "mgmt_dynamo_main" {
  count           = length(var.availability_zones)
  vpc_endpoint_id = aws_vpc_endpoint.private_dynamo.id
  route_table_id  = element(aws_route_table.public.*.id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "private_dynamo_main" {
  count           = length(var.availability_zones)
  vpc_endpoint_id = aws_vpc_endpoint.private_dynamo.id
  route_table_id  = "${element(aws_route_table.private.*.id, count.index)}"
}

resource "aws_vpc_endpoint_route_table_association" "public_dynamo_main" {
  count           = length(var.availability_zones)
  vpc_endpoint_id = aws_vpc_endpoint.private_dynamo.id
  route_table_id  = element(aws_route_table.public.*.id, count.index)
}
