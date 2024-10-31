# main.tf

# Specify the required Terraform version
terraform {
  required_version = ">= 1.0.0"

  # Configure the backend to use Terraform Cloud
  cloud {
    organization = "MyBusiness"

    workspaces {
      name = "cloud-nonprod-us-east-1"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Example resource: Create an S3 bucket
resource "aws_s3_bucket" "examplebucket" {
  bucket = "my-unique-bucket-${terraform.workspace}"
  acl    = "private"

  tags = {
    Name        = "MyTerraformBucket"
    Environment = terraform.workspace
  }
}
