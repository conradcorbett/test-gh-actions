terraform {
  cloud {
    organization = "SeeSquared"

    workspaces {
      name = "2-createvm"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.21.0"
    }
  }

  required_version = "~> 1.2"
}