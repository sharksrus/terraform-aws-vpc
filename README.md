# terraform-aws-vpc
[![CI Actions Status](https://github.com/vglen/terraform-aws-vpc/workflows/CI/badge.svg)](https://github.com/vglen/terraform-aws-vpc/actions)


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additionalTags | n/a | `map` | `{}` | no |
| availability\_zones | A list of availability zones in the region | `list` | `[]` | no |
| env | Environment name | `any` | n/a | yes |
| nat\_availability\_zones | A list of availability zones you want to run nat gateway | `list` | `[]` | no |
| owner | n/a | `any` | n/a | yes |
| private\_subnet | To enable private subnet set 'true' | `bool` | `true` | no |
| private\_subnet\_tags | n/a | `map` | `{}` | no |
| product | n/a | `any` | n/a | yes |
| public\_subnet\_tags | n/a | `map` | `{}` | no |
| rds\_subnet | To enable rds subnet set 'true' | `bool` | `false` | no |
| rds\_subnet\_tags | n/a | `map` | `{}` | no |
| region | AWS Region. i.e us-east-1 | `string` | `""` | no |
| storage\_subnet | To enable storage subnet set 'true' | `bool` | `false` | no |
| storage\_subnet\_tags | n/a | `map` | `{}` | no |
| technicalcontact | A email to reach out when needed. | `any` | n/a | yes |
| vpc\_cidr | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden | `string` | `""` | no |
| vpc\_name | A unique Identifier for the VPC and its resources | `string` | `""` | no |
| vpc\_tags | n/a | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| nat\_gw\_eips | n/a |
| subnets\_private | n/a |
| subnets\_public | n/a |
| subnets\_rds | n/a |
| vpc | n/a |
<!-- BEGIN_TF_DOCS -->
# TERRAFORM-AWS-VPC
<!-- markdownlint-disable no-inline-html -->

[![CI](https://github.com/sharksrus/terraform-aws-vpc/actions/workflows/ci.yaml/badge.svg)](https://github.com/sharksrus/terraform-aws-vpc/actions/workflows/ci.yaml)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_main_route_table_association.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/main_route_table_association) | resource |
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.default_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.default_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.routes_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_endpoint.private_dynamo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.private_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint_route_table_association.private_dynamo_main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint_route_table_association) | resource |
| [aws_vpc_endpoint_route_table_association.private_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint_route_table_association) | resource |
| [aws_vpc_endpoint_route_table_association.public_dynamo_main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint_route_table_association) | resource |
| [aws_vpc_endpoint_route_table_association.public_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint_route_table_association) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionalTags"></a> [additionalTags](#input\_additionalTags) | n/a | `map(any)` | `{}` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment name | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | n/a | `string` | n/a | yes |
| <a name="input_private_subnet"></a> [private\_subnet](#input\_private\_subnet) | To enable private subnet set 'true' | `bool` | `true` | no |
| <a name="input_private_subnet_tags"></a> [private\_subnet\_tags](#input\_private\_subnet\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_product"></a> [product](#input\_product) | n/a | `string` | n/a | yes |
| <a name="input_public_subnet"></a> [public\_subnet](#input\_public\_subnet) | To enable private subnet set 'true' | `bool` | `true` | no |
| <a name="input_public_subnet_tags"></a> [public\_subnet\_tags](#input\_public\_subnet\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_rds_subnet"></a> [rds\_subnet](#input\_rds\_subnet) | To enable rds subnet set 'true' | `bool` | `false` | no |
| <a name="input_rds_subnet_tags"></a> [rds\_subnet\_tags](#input\_rds\_subnet\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_storage_subnet"></a> [storage\_subnet](#input\_storage\_subnet) | To enable storage subnet set 'true' | `bool` | `false` | no |
| <a name="input_storage_subnet_tags"></a> [storage\_subnet\_tags](#input\_storage\_subnet\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_technicalcontact"></a> [technicalcontact](#input\_technicalcontact) | A email to reach out when needed. | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden | `string` | `""` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | A unique Identifier for the VPC and its resources | `string` | `""` | no |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | n/a | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nat_gw_eips"></a> [nat\_gw\_eips](#output\_nat\_gw\_eips) | n/a |
| <a name="output_subnets_private"></a> [subnets\_private](#output\_subnets\_private) | n/a |
| <a name="output_subnets_public"></a> [subnets\_public](#output\_subnets\_public) | n/a |
| <a name="output_subnets_rds"></a> [subnets\_rds](#output\_subnets\_rds) | n/a |
| <a name="output_subnets_storage"></a> [subnets\_storage](#output\_subnets\_storage) | n/a |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | n/a |

<!-- markdownlint-disable MD041  -->
## TERRAFORM-AWS-VPC

Module for creating VPCs.

## Updating `README.md`

To update the README, run terraform-docs:

```sh
terraform-docs .
```
<!-- END_TF_DOCS -->