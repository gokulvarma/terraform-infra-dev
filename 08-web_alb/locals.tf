locals {
  name = "${var.Project_name}-${var.Environment}"
 public_subnet_id = split(",",data.aws_ssm_parameter.public_subnet_id.value)
}