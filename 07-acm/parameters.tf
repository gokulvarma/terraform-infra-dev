resource "aws_ssm_parameter" "certificate_arn" {
  name  = "/${var.Project_name}/${var.Environment}/cert_arn"
  type  = "String"
  value = aws_acm_certificate.cert.arn
}
