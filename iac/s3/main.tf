# main.tf

terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"

  subnet_id              = "subnet-0d8d614e45a6b6b02"
  vpc_security_group_ids = ["sg-0ae35beb5cf748183"]

  tags = {
    "Identity" = "Test Identity Tag"
  }
}
