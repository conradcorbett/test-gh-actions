variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "project_tag" {
  description = "Value of the 'Project' tag for all resources"
  type        = string
  default     = "cc-link-workspaces"
}