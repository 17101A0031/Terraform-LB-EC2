variable "aws_region" {}
variable "environment" {}
variable "project_name" {}

variable "ec2_instances" {
  type = map(object({
    ami_id        = string
    instance_type = string
  }))
}
