module "payment" {
  source = "../../terraform-roboshop-app"
  priority = var.priority
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  iam_instance_profile = var.iam_instance_profile
  tags = var.tags
  private_subnet_id =  split(",", data.aws_ssm_parameter.private_subnet_id.value)
  component_security_group_id = data.aws_ssm_parameter.payment-security_group_id.value
   app_alb_listener_arn = data.aws_ssm_parameter.load_balancer_arn.value
}