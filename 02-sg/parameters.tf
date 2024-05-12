resource "aws_ssm_parameter" "mongodb-security_group_id" {
  name  = "/${var.Project_name}/${var.Environment}/mongodb-sg-id"
  type  = "String"
  value = module.mongodb.security_group_id
}
resource "aws_ssm_parameter" "mysql-security_group_id" {
  name  = "/${var.Project_name}/${var.Environment}/mysql-sg-id"
  type  = "String"
  value = module.mongodb.security_group_id
}
resource "aws_ssm_parameter" "redis-security_group_id" {
  name  = "/${var.Project_name}/${var.Environment}/redis-sg-id"
  type  = "String"
  value = module.mongodb.security_group_id
}
resource "aws_ssm_parameter" "rabbitmq-security_group_id" {
  name  = "/${var.Project_name}/${var.Environment}/rabbitmq-sg-id"
  type  = "String"
  value = module.mongodb.security_group_id
}
resource "aws_ssm_parameter" "catalogue-security_group_id" {
  name  = "/${var.Project_name}/${var.Environment}/catalogue-sg-id"
  type  = "String"
  value = module.catalogue.security_group_id
}
resource "aws_ssm_parameter" "user-security_group_id" {
  name  = "/${var.Project_name}/${var.Environment}/user-sg-id"
  type  = "String"
  value = module.user.security_group_id
}
resource "aws_ssm_parameter" "cart-security_group_id" {
  name  = "/${var.Project_name}/${var.Environment}/cart-sg-id"
  type  = "String"
  value = module.cart.security_group_id
}
resource "aws_ssm_parameter" "shipping-security_group_id" {
  name  = "/${var.Project_name}/${var.Environment}/shipping-sg-id"
  type  = "String"
  value = module.mongodb.security_group_id
}
resource "aws_ssm_parameter" "payment-security_group_id" {
  name  = "/${var.Project_name}/${var.Environment}/payment-sg-id"
  type  = "String"
  value = module.mongodb.security_group_id
}
resource "aws_ssm_parameter" "web-security_group_id" {
  name  = "/${var.Project_name}/${var.Environment}/web-sg-id"
  type  = "String"
  value = module.web.security_group_id
}
resource "aws_ssm_parameter" "vpn-security_group_id" {
  name  = "/${var.Project_name}/${var.Environment}/vpn-sg-id"
  type  = "String"
  value = module.vpn.security_group_id
}
resource "aws_ssm_parameter" "app_alb-security_group_id" {
  name  = "/${var.Project_name}/${var.Environment}/app_alb-sg-id"
  type  = "String"
  value = module.app_alb.security_group_id
}
resource "aws_ssm_parameter" "web_alb-security_group_id" {
  name  = "/${var.Project_name}/${var.Environment}/web_alb-sg-id"
  type  = "String"
  value = module.web_alb.security_group_id
}