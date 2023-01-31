provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPCLinkingWorkspaces"
    Project = var.project_tag
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "Public Subnet"
    Project = var.project_tag
  }
}

resource "aws_security_group" "sg-vpc" {
  name = "sgvpc_${var.project_tag}"
  vpc_id = aws_vpc.example.id
  tags = {
    Name = "${var.project_tag}"
  }

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }
  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
