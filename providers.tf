terraform {
  required_version = ">= 1.4.4"
  required_providers {
    aws = {
      version = ">= 4.62.0"
      source  = "hashicorp/aws"
    }
  }
}
