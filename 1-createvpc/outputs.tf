output "aws_region" {
  description = "AWS region"
  value       = var.aws_region
}

output "project_tag" {
  description = "Tag for aws resources in this project"
  value       = var.project_tag
}

output "vpc_id" {
  description = "vpc_id"
  value       = aws_vpc.example.id
}

output "sg_ids" {
  description = "sg_ids"
  value       = aws_security_group.sg-vpc.id
}

output "subnet_id" {
  description = "sg_ids"
  value       = aws_subnet.public.id
}