locals {
  name = "${var.Project_name}-${var.Environment}"
 private_subnet_id = split(",",data.aws_ssm_parameter.private_subnet_id.value)
}