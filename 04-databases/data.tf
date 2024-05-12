data "aws_ssm_parameter" "mongodb-security_group_id" {
  name = "/${var.Project_name}/${var.Environment}/mongodb-sg-id"
}
data "aws_ssm_parameter" "redis-security_group_id" {
  name = "/${var.Project_name}/${var.Environment}/redis-sg-id"
}
data "aws_ssm_parameter" "rabbitmq-security_group_id" {
  name = "/${var.Project_name}/${var.Environment}/rabbitmq-sg-id"
}
data "aws_ssm_parameter" "vpn-security_group_id" {
  name  = "/${var.Project_name}/${var.Environment}/vpn-sg-id"
}
data "aws_ssm_parameter" "mysql-security_group_id" {
  name = "/${var.Project_name}/${var.Environment}/mysql-sg-id"
}
data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.Project_name}/${var.Environment}/public_subnet_id"
}
data "aws_ssm_parameter" "private_subnet_id" {
  name = "/${var.Project_name}/${var.Environment}/private_subnet_id"
}
data "aws_ssm_parameter" "database_subnet_id" {
  name = "/${var.Project_name}/${var.Environment}/database_subnet_id"
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