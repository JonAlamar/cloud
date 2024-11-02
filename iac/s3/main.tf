# main.tf

terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "random_string" "random" {
  length = 10
}
