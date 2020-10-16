
variable "additionalTags" {
  default = {}
}

variable "availability_zones" {
  description = "A list of availability zones in the region"
  default     = []
}

variable "env" {
  description = "Environment name"
}
variable "owner" {}
variable "product" {}

variable "private_subnet" {
  description = "To enable private subnet set 'true'"
  default     = false
}

variable "private_subnet_tags" {
  type    = map
  default = {}
}

variable "public_subnet_tags" {
  type    = map
  default = {}
}

variable "rds_subnet" {
  description = "To enable rds subnet set 'true'"
  default     = false
}

variable "rds_subnet_tags" {
  type    = map
  default = {}
}

variable "region" {
  default     = ""
  description = "AWS Region. i.e us-east-1"
}

variable "storage_subnet" {
  description = "To enable storage subnet set 'true'"
  default     = false
}

variable "storage_subnet_tags" {
  type    = map
  default = {}
}

variable "technicalcontact" {
  description = "A email to reach out when needed."
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  default     = ""
}

variable "vpc_name" {
  description = "A unique Identifier for the VPC and its resources"
  default     = ""
}

variable "vpc_tags" {
  default = {}
}