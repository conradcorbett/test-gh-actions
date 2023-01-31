variable "tfc_org_name" {
  description = "Name of the Terraform Cloud Organization"
  type        = string
  default     = "SeeSquared"
}

variable "tfc_vpc_workspace_name" {
  description = "Name of the workspace that creates the VPC in the previous step"
  type        = string
  default     = "1-createvpc"
}

variable "instance_type" {
  description = "Type of EC2 instance to use"
  type        = string
  default     = "t2.nano"
}
