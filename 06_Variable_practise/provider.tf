terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.3.0"
    }
  }
}


provider "aws" {
  # Configuration options
  region = var.aws-region
}


data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-20.04-amd64-server-*"]
  }
}


resource "aws_instance" "ubuntu-aws_instance" {

    ami=data.aws_ami.ubuntu.id
    instance_type = var.instance_type

    tags = {
      name = "web-server"
    }
  
}