resource "aws_lb" "app_lb" {
  name               = "${var.Project_name}-${var.Environment}-${var.applb_tags.Name}"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.app_alb-security_group_id.value]
  subnets            = split(",", data.aws_ssm_parameter.private_subnet_id.value)
  tags = merge(var.common_tags,var.applb_tags)
}
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "hi, this is success response"
      status_code  = "200"
    }
  }
}
module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"

  zone_name = var.zone_name

  records = [
    {
      name    = "*.app-${var.Environment}"
      type    = "A"
      alias   = {
        name    = aws_lb.app_lb.dns_name
        zone_id = aws_lb.app_lb.zone_id
      }
    }
  ]
}
