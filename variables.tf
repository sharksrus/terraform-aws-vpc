
variable "additionalTags" {
  type    = map(any)
  default = {}
}
variable "env" {
  type        = string
  description = "Environment name"
}
variable "owner" {
  type = string
}
variable "product" {
  type = string
}

variable "private_subnet" {
  type        = bool
  description = "To enable private subnet set 'true'"
  default     = true
}
variable "public_subnet" {
  type        = bool
  description = "To enable private subnet set 'true'"
  default     = true
}
variable "private_subnet_tags" {
  type    = map(any)
  default = {}
}
variable "public_subnet_tags" {
  type    = map(any)
  default = {}
}
variable "rds_subnet" {
  type        = bool
  description = "To enable rds subnet set 'true'"
  default     = false
}
variable "rds_subnet_tags" {
  type    = map(any)
  default = {}
}
variable "storage_subnet" {
  type        = bool
  description = "To enable storage subnet set 'true'"
  default     = false
}
variable "storage_subnet_tags" {
  type    = map(any)
  default = {}
}
variable "technicalcontact" {
  type        = string
  description = "A email to reach out when needed."
}
variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  default     = ""
}
variable "vpc_name" {
  type        = string
  description = "A unique Identifier for the VPC and its resources"
  default     = ""
}
variable "vpc_tags" {
  type    = map(any)
  default = {}
}
