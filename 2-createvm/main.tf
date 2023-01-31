data "terraform_remote_state" "createdvpc" {
  backend = "remote"

  config = {
    organization = var.tfc_org_name
    workspaces = {
      name = var.tfc_vpc_workspace_name
    }
  }
}

provider "aws" {
  region  = data.terraform_remote_state.createdvpc.outputs.aws_region
  #region = "us-west-2"
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "app" {
  vpc_security_group_ids      = [ data.terraform_remote_state.createdvpc.outputs.sg_ids ]
  subnet_id                   = data.terraform_remote_state.createdvpc.outputs.subnet_id
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<html><body><div>Hello, world!</div></body></html>" > /var/www/html/index.html
    EOF

  tags = {
    Project = data.terraform_remote_state.createdvpc.outputs.project_tag
  }
}