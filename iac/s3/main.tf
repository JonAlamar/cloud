# main.tf

terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "<AMI>"
  instance_type = "t2.micro"

  subnet_id              = "<SUBNET>"
  vpc_security_group_ids = ["<SECURITY_GROUP>"]

  tags = {
    "Identity" = "<IDENTITY>"
  }
}
