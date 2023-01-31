terraform {
  cloud {
    organization = "SeeSquared"

    workspaces {
      name = "1-createvpc"
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
