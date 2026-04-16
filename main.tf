provider "aws" {
  region = var.aws_region
}

locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "ec2_instances" {
  source = "./modules/ec2"

  for_each = var.ec2_instances

  instance_name = "${local.name_prefix}-${each.key}"
  ami_id        = each.value.ami_id
  instance_type = each.value.instance_type
  subnet_id     = element(data.aws_subnets.default.ids, 0)
  vpc_id        = data.aws_vpc.default.id
}

module "lb" {
  source = "./modules/lb"

  name_prefix = local.name_prefix
  vpc_id      = data.aws_vpc.default.id
  subnet_ids  = data.aws_subnets.default.ids

  instance_ids = {
    for k, ec2 in module.ec2_instances :
    k => ec2.instance_id
  }

  sg_id = values(module.ec2_instances)[0].sg_id
}
