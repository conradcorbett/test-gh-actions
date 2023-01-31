output "aws_region" {
  value = data.terraform_remote_state.createdvpc.outputs.aws_region
}

output "public_ip" {
  value = aws_instance.app.public_ip
}