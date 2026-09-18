output "vpc_id" {
  description = "ID of the project VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.networking.public_subnet_ids
}

output "web_security_group_id" {
  description = "ID of the web security group"
  value       = module.networking.web_security_group_id
}

output "web_instance_id" {
  description = "ID of the web EC2 instance"
  value       = module.compute.instance_id
}

output "web_public_ip" {
  description = "Elastic IP address of the web server"
  value       = module.compute.public_ip
}

output "website_url" {
  description = "Public URL of the web server"
  value       = module.compute.website_url
}

output "s3_bucket_name" {
  description = "Name of the project S3 bucket"
  value       = aws_s3_bucket.project.bucket
}
