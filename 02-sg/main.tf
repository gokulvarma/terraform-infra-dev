module mongodb{
    source = "git::https://github.com/divya-vegesna05/terraform-aws-securitygroup.git?ref=master"
    Project_name = var.Project_name
    Environment = var.Environment
    common_tags = var.common_tags
    sg_name = "mongodb"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_description = "${var.sg_description}mongodb"
}
module catalogue{
    source = "git::https://github.com/divya-vegesna05/terraform-aws-securitygroup.git?ref=master"
    Project_name = var.Project_name
    Environment = var.Environment
    common_tags = var.common_tags
    sg_name = "catalogue"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_description = "${var.sg_description}catalogue"
}
module redis{
    source = "git::https://github.com/divya-vegesna05/terraform-aws-securitygroup.git?ref=master"
    Project_name = var.Project_name
    Environment = var.Environment
    common_tags = var.common_tags
    sg_name = "redis"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_description = "${var.sg_description}redis"
}
module mysql{
    source = "git::https://github.com/divya-vegesna05/terraform-aws-securitygroup.git?ref=master"
    Project_name = var.Project_name
    Environment = var.Environment
    common_tags = var.common_tags
    sg_name = "mysql"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_description = "${var.sg_description}mysql"
}
module rabbitmq{
    source = "git::https://github.com/divya-vegesna05/terraform-aws-securitygroup.git?ref=master"
    Project_name = var.Project_name
    Environment = var.Environment
    common_tags = var.common_tags
    sg_name = "rabbitmq"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_description = "${var.sg_description}rabbitmq"
}
module user{
    source = "git::https://github.com/divya-vegesna05/terraform-aws-securitygroup.git?ref=master"
    Project_name = var.Project_name
    Environment = var.Environment
    common_tags = var.common_tags
    sg_name = "user"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_description = "${var.sg_description}user"
}
module shipping{
    source = "git::https://github.com/divya-vegesna05/terraform-aws-securitygroup.git?ref=master"
    Project_name = var.Project_name
    Environment = var.Environment
    common_tags = var.common_tags
    sg_name = "shipping"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_description = "${var.sg_description}shipping"
}
module payment{
    source = "git::https://github.com/divya-vegesna05/terraform-aws-securitygroup.git?ref=master"
    Project_name = var.Project_name
    Environment = var.Environment
    common_tags = var.common_tags
    sg_name = "payment"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_description = "${var.sg_description}payment"
}
module cart{
    source = "git::https://github.com/divya-vegesna05/terraform-aws-securitygroup.git?ref=master"
    Project_name = var.Project_name
    Environment = var.Environment
    common_tags = var.common_tags
    sg_name = "cart"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_description = "${var.sg_description}cart"
}
module web{
    source = "git::https://github.com/divya-vegesna05/terraform-aws-securitygroup.git?ref=master"
    Project_name = var.Project_name
    Environment = var.Environment
    common_tags = var.common_tags
    sg_name = "web"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_description = "${var.sg_description}web"
}
module "vpn" {
     source = "git::https://github.com/divya-vegesna05/terraform-aws-securitygroup.git?ref=master"
    Project_name = var.Project_name
    Environment = var.Environment
    common_tags = var.common_tags
    sg_name = "vpn"
    vpc_id = data.aws_vpc.default.id
    sg_description = "${var.sg_description}vpn"
}
module "app_alb" {
     source = "git::https://github.com/divya-vegesna05/terraform-aws-securitygroup.git?ref=master"
    Project_name = var.Project_name
    Environment = var.Environment
    common_tags = var.common_tags
    sg_name = "app-lb"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_description = "${var.sg_description}applb"
}
module "web_alb" {
     source = "git::https://github.com/divya-vegesna05/terraform-aws-securitygroup.git?ref=master"
    Project_name = var.Project_name
    Environment = var.Environment
    common_tags = var.common_tags
    sg_name = "web-lb"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_description = "${var.sg_description}weblb"
}
resource "aws_security_group_rule" "applb-vpn" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb.security_group_id
  source_security_group_id = module.vpn.security_group_id
}
resource "aws_security_group_rule" "applb-catalogue" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb.security_group_id
  source_security_group_id = module.catalogue.security_group_id
}
resource "aws_security_group_rule" "applb-web" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb.security_group_id
  source_security_group_id = module.web.security_group_id
}
resource "aws_security_group_rule" "applb-user" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb.security_group_id
  source_security_group_id = module.user.security_group_id
}
resource "aws_security_group_rule" "applb-cart" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb.security_group_id
  source_security_group_id = module.cart.security_group_id
}
resource "aws_security_group_rule" "applb-shipping" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb.security_group_id
  source_security_group_id = module.shipping.security_group_id
}
resource "aws_security_group_rule" "applb-payment" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb.security_group_id
  source_security_group_id = module.payment.security_group_id
}
resource "aws_security_group_rule" "weblb-internet" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.web_alb.security_group_id
}
resource "aws_security_group_rule" "vpn-home" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  security_group_id = module.vpn.security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "mongodb-catalogue" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.security_group_id
  source_security_group_id = module.catalogue.security_group_id
}
resource "aws_security_group_rule" "mongodb-user" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.security_group_id
  source_security_group_id = module.user.security_group_id
}
resource "aws_security_group_rule" "mongodb-vpn" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.mongodb.security_group_id
  source_security_group_id = module.vpn.security_group_id
}
resource "aws_security_group_rule" "redis-user" {
  type              = "ingress"
  from_port         =  6379
  to_port           =  6379
  protocol          = "tcp"
  security_group_id = module.redis.security_group_id
  source_security_group_id = module.user.security_group_id
}
resource "aws_security_group_rule" "redis-cart" {
  type              = "ingress"
  from_port         =  6379
  to_port           =  6379
  protocol          = "tcp"
  security_group_id = module.redis.security_group_id
  source_security_group_id = module.cart.security_group_id
}
resource "aws_security_group_rule" "redis-vpn" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.redis.security_group_id
  source_security_group_id = module.vpn.security_group_id
}
resource "aws_security_group_rule" "mysql-shipping" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = module.mysql.security_group_id
  source_security_group_id = module.shipping.security_group_id
}
resource "aws_security_group_rule" "mysql-vpn" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.mysql.security_group_id
  source_security_group_id = module.vpn.security_group_id
}
resource "aws_security_group_rule" "rabbitmq-payment" {
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  security_group_id = module.rabbitmq.security_group_id
  source_security_group_id = module.payment.security_group_id
}
resource "aws_security_group_rule" "rabbitmq-vpn" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.rabbitmq.security_group_id
  source_security_group_id = module.vpn.security_group_id
}
# resource "aws_security_group_rule" "catalogue-web" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = module.catalogue.security_group_id
#   source_security_group_id = module.web.security_group_id
# }
resource "aws_security_group_rule" "catalogue-vpn" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.catalogue.security_group_id
  source_security_group_id = module.vpn.security_group_id
}
resource "aws_security_group_rule" "catalogue-vpn-http" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.catalogue.security_group_id
  source_security_group_id = module.vpn.security_group_id
}
# resource "aws_security_group_rule" "catalogue-cart" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = module.catalogue.security_group_id
#   source_security_group_id = module.cart.security_group_id
# }
resource "aws_security_group_rule" "catalogue-applb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.catalogue.security_group_id
  source_security_group_id = module.app_alb.security_group_id
}
resource "aws_security_group_rule" "user-vpn" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.user.security_group_id
  source_security_group_id = module.vpn.security_group_id
}
# resource "aws_security_group_rule" "user-payment" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = module.user.security_group_id
#   source_security_group_id = module.payment.security_group_id
# }
resource "aws_security_group_rule" "user-appalb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.user.security_group_id
  source_security_group_id = module.app_alb.security_group_id
}
# resource "aws_security_group_rule" "cart-web" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = module.cart.security_group_id
#   source_security_group_id = module.web.security_group_id
# }
resource "aws_security_group_rule" "cart-vpn" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.cart.security_group_id
  source_security_group_id = module.vpn.security_group_id
}
resource "aws_security_group_rule" "cart-shipping" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.cart.security_group_id
  source_security_group_id = module.shipping.security_group_id
}
resource "aws_security_group_rule" "cart-payment" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.cart.security_group_id
  source_security_group_id = module.payment.security_group_id
}
resource "aws_security_group_rule" "cart-appalb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.cart.security_group_id
  source_security_group_id = module.app_alb.security_group_id
}
# resource "aws_security_group_rule" "user-web" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = module.user.security_group_id
#   source_security_group_id = module.web.security_group_id
# }

# resource "aws_security_group_rule" "shipping-web" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = module.shipping.security_group_id
#   source_security_group_id = module.web.security_group_id
# }
resource "aws_security_group_rule" "shipping-vpn" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.shipping.security_group_id
  source_security_group_id = module.vpn.security_group_id
}
resource "aws_security_group_rule" "shipping-appalb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.shipping.security_group_id
  source_security_group_id = module.app_alb.security_group_id
}
# resource "aws_security_group_rule" "payment-web" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = module.payment.security_group_id
#   source_security_group_id = module.web.security_group_id
# }
resource "aws_security_group_rule" "payment-vpn" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.payment.security_group_id
  source_security_group_id = module.vpn.security_group_id
}
resource "aws_security_group_rule" "payment-appalb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.payment.security_group_id
  source_security_group_id = module.app_alb.security_group_id
}
resource "aws_security_group_rule" "web-vpn" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.web.security_group_id
  source_security_group_id = module.vpn.security_group_id
}
resource "aws_security_group_rule" "web-internet" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.web.security_group_id
  cidr_blocks = ["0.0.0.0/0"]
}
