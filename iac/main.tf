resource "aws_s3_bucket" "test_bucket" {
  bucket = "my-test-bucket-${terraform.workspace}"  # Unique name per workspace
}

#testtest
