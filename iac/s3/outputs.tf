# outputs.tf

output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.example_bucket.id
}

output "ec2_instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.example_instance.public_ip
}

output "ec2_instance_public_dns" {
  description = "The public DNS name of the EC2 instance"
  value       = aws_instance.example_instance.public_dns
}
