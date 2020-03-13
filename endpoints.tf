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
  route_table_id  = element(aws_route_table.private.*.id, count.index)
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
  route_table_id  = element(aws_route_table.private.*.id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "public_dynamo_main" {
  count           = length(var.availability_zones)
  vpc_endpoint_id = aws_vpc_endpoint.private_dynamo.id
  route_table_id  = element(aws_route_table.public.*.id, count.index)
}

### SSM
resource "aws_vpc_endpoint" "ssm" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.region}.ssm"
  subnet_ids = [
    aws_subnet.private.0.id,
    aws_subnet.private.1.id,
    aws_subnet.private.2.id
  ]
  private_dns_enabled = true
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoints_sg.id]
  tags = {
    Name             = "${var.env}-${var.vpc_name}-ssm"
    Environment      = var.env
    technicalcontact = var.technicalcontact
    Product          = var.product
    Owner            = var.owner
  }
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.region}.ssmmessages"
  subnet_ids = [
    aws_subnet.private.0.id,
    aws_subnet.private.1.id,
    aws_subnet.private.2.id
  ]
  private_dns_enabled = true
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoints_sg.id]
  tags = {
    Name             = "${var.env}-${var.vpc_name}-ssmmessages"
    Environment      = var.env
    technicalcontact = var.technicalcontact
    Product          = var.product
    Owner            = var.owner
  }
}


resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.region}.ec2messages"
  subnet_ids = [
    aws_subnet.private.0.id,
    aws_subnet.private.1.id,
    aws_subnet.private.2.id
  ]
  private_dns_enabled = true
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoints_sg.id]
  tags = {
    Name             = "${var.env}-${var.vpc_name}-ec2messages"
    Environment      = var.env
    technicalcontact = var.technicalcontact
    Product          = var.product
    Owner            = var.owner
  }
}
