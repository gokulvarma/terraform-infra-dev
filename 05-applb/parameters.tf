resource "aws_ssm_parameter" "load_balancer_arn" {
  name  = "/${var.Project_name}/${var.Environment}/app_lb_arn"
  type  = "String"
  value = aws_lb_listener.http.arn
}
