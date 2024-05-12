resource "aws_lb" "web_alb" {
  name               = "${var.Project_name}-${var.Environment}-${var.tags.Component}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.web_alb-security_group_id.value]
  subnets            = local.public_subnet_id
  tags = merge(var.common_tags,var.tags)
}
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn = data.aws_ssm_parameter.cert_arn.value
  ssl_policy = "ELBSecurityPolicy-2016-08"
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "hi, this is https success response"
      status_code  = "200"
    }
  }
}
module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"

  zone_name = var.zone_name

  records = [
    {
      name    = "web-${var.Environment}"
      type    = "A"
      alias   = {
        name    = aws_lb.web_alb.dns_name
        zone_id = aws_lb.web_alb.zone_id
      }
    }
  ]
}