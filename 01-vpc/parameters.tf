resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.Project_name}/${var.Environment}/vpc_id"
  type  = "String"
  value = module.roboshop.vpc_id
}
resource "aws_ssm_parameter" "public_subnet_id" {
  name  = "/${var.Project_name}/${var.Environment}/public_subnet_id"
  type  = "StringList"
  value = join(",",module.roboshop.public_subnet_id)
  }
resource "aws_ssm_parameter" "private_subnet_id" {
  name  = "/${var.Project_name}/${var.Environment}/private_subnet_id"
  type  = "StringList"
  value = join(",",module.roboshop.private_subnet_id)
  }
resource "aws_ssm_parameter" "database_subnet_id" {
  name  = "/${var.Project_name}/${var.Environment}/database_subnet_id"
  type  = "StringList"
  value = join(",",module.roboshop.database_subnet_id)
  }