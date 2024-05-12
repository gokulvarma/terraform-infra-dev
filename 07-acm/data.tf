data "aws_route53_zone" "selected" {
  name         = "jasritha.tech"
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
  name = "/${var.Project_name}/${var.Environment}/vpc_id"
}

