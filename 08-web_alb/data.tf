data "aws_ssm_parameter" "web_alb-security_group_id" {
    name  = "/${var.Project_name}/${var.Environment}/web_alb-sg-id"
}
data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.Project_name}/${var.Environment}/public_subnet_id"
}
data "aws_ssm_parameter" "cert_arn" {
  name  = "/${var.Project_name}/${var.Environment}/cert_arn"
}
data "aws_ami" "centos8" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
data "aws_vpc" "default" {
  default = true
}
data "aws_subnet" "default" {
  vpc_id = data.aws_vpc.default.id
  availability_zone = "us-east-1a"
}
data "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.Project_name}/${var.Environment}/vpc_id"
}
