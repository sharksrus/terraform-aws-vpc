terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      version = ">= 5.11.0"
      source  = "hashicorp/aws"
    }
  }
}
