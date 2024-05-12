data "aws_ssm_parameter" "user-security_group_id" {
  name = "/${var.Project_name}/${var.Environment}/user-sg-id"
}
data "aws_ssm_parameter" "private_subnet_id" {
  name = "/${var.Project_name}/${var.Environment}/private_subnet_id"
}
data "aws_ssm_parameter" "load_balancer_arn" {
  name = "/${var.Project_name}/${var.Environment}/app_lb_arn"
}
data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.Project_name}/${var.Environment}/vpc_id"
}
