terraform {
  required_version = ">= 0.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      env = "qa"
      email       = "akshay@rafay.co"
    }
  }
}

resource "aws_instance" "ubuntu" {
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.aws_region_az

  tags = {
    Name = var.name
    env = "qa"
    email       = var.email
  }
  volume_tags = {
    env = "qa"
    email       = "akshay@rafay.co"
  }
}

resource "aws_instance" "ubuntu-1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.aws_region_az

  tags = {
    Name = var.name1
    env = "qa"
    email       = var.email
  }
  volume_tags = {
    env = "qa"
    email       = "akshay@rafay.co"
  }
  depends_on = [aws_instance.ubuntu]
}
