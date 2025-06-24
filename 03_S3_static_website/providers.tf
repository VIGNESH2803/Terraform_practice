terraform {
  required_version = ">1.7.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "5.100.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }

  }
}

provider "aws" {
  # Configuration options
  region = "eu-west-1"
}

