# Se definen los providers segun la doc de terraform
# https://registry.terraform.io/providers/hashicorp/aws/latest
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.69.0"
    }
  }
}

