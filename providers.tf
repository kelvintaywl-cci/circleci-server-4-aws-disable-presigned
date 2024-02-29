terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.38.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.aws_region
  default_tags {
    tags = {
      # IMPORTANT: please modify as needed!
      "owner" : "kelvin@circleci.com"
      "team" : "customer_engineering"
    }
  }
}
