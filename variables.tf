variable "additionalTags" {
  default = {}
}

variable "vpc_tags" {
  default = {}
}

variable "availability_zones" {
  description = "A list of availability zones in the region"
  default     = []
}

variable "region" {
  default     = "us-east-1"
  description = "AWS Region. i.e us-east-1"
}

variable "businessUnit" {
  description = "Used to identify the cost center or business unit associated with a resource; typically for cost allocation and tracking"
}

variable "env" {
  description = "Environment name"
}

variable "mgmt_subnet_tags" {
  type    = "map"
  default = {}
}

variable "owner" {}

variable "public_subnet_tags" {
  type    = "map"
  default = {}
}

variable "private_subnet_tags" {
  type    = "map"
  default = {}
}

variable "product" {}

variable "storage_subnet_tags" {
  type    = "map"
  default = {}
}

variable "rds_subnet_tags" {
  type    = "map"
  default = {}
}

variable "storage_subnet" {
  description = "To enable storage subnet set 'true'"
  default     = false
}

variable "rds_subnet" {
  description = "To enable rds subnet set 'true'"
  default     = false
}

variable "public_isolated_subnet" {
  description = "To enable public isolated subnet set 'true'"
  default     = false
}

variable "public_isolated_subnet_tags" {
  type    = "map"
  default = {}
}

variable "technicalContact" {
  description = "A email to reach out when needed."
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  default     = "0.0.0.0/0"
}

variable "vpc_name" {
  description = "A unique Identifier for the VPC and its resources"
  default     = ""
}
