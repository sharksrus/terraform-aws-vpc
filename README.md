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