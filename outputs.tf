output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The unique identifier of the provisioned custom VPC"
}

output "web_public_ip" {
  value       = aws_instance.web.public_ip
  description = "The public IPv4 address assigned to the web instance"
}
