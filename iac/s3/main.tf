# main.tf

terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_subnet" "variable-subnet" {
  vpc_id                  = aws_vpc.vpc_id
  cidr_block              = "10.0.250.0/24"
  availability_zone       = "us-east-1"
  map_public_ip_on_launch = true

  tags = {
    Name      = "sub-variables-us-east-1a"
    Terraform = "true"
  }
}
