output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_ip" {
  description = "Public IP of t3 micro instance"
  value       = aws_instance.micro.public_ip
}

