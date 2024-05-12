data "aws_ssm_parameter" "cart-security_group_id" {
  name = "/${var.Project_name}/${var.Environment}/cart-sg-id"
}
data "aws_ssm_parameter" "private_subnet_id" {
  name = "/${var.Project_name}/${var.Environment}/private_subnet_id"
}
data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.Project_name}/${var.Environment}/vpc_id"
}
data "aws_ssm_parameter" "load_balancer_arn" {
  name = "/${var.Project_name}/${var.Environment}/app_lb_arn"
}