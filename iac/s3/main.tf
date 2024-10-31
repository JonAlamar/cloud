# main.tf

terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.aws_region
}

# Fetch the default VPC
data "aws_vpc" "default" {
  default = true
}

# Fetch the default subnet
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

# Create an S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "${local.resource_name_prefix}-bucket"
  acl    = "private"

  tags = local.common_tags
}

# Create a security group for the EC2 instance
resource "aws_security_group" "instance_sg" {
  name        = "${local.resource_name_prefix}-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH access from allowed IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}

# Create an EC2 instance
resource "aws_instance" "example_instance" {
  ami                         = "ami-0c94855ba95c71c99" # Amazon Linux 2 AMI in us-east-1
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnet_ids.default.ids[0]
  vpc_security_group_ids      = [aws_security_group.instance_sg.id]
  associate_public_ip_address = true

  tags = local.common_tags
}
