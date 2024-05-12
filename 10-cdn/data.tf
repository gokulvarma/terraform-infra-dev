data "aws_ssm_parameter" "cert_arn" {
  name  = "/${var.Project_name}/${var.Environment}/cert_arn"
}
data "aws_cloudfront_cache_policy" "CachingOptimized" {
  name = "Managed-CachingOptimized"
}
data "aws_cloudfront_cache_policy" "CachingDisabled" {
  name = "Managed-CachingDisabled"
}
