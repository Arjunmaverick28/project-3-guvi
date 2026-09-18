output "instance_id" {
  description = "ID of the web EC2 instance"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Elastic IP address of the web server"
  value       = aws_eip.web.public_ip
}

output "website_url" {
  description = "Public URL of the web server"
  value       = "http://${aws_eip.web.public_ip}"
}
