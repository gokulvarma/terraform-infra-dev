module "roboshop" {
  source = "git::https://github.com/divya-vegesna05/terraform-aws-vpc.git?ref=master"
  Project_name = var.Project_name
  Environment = var.Environment
  common_tags = var.common_tags
  vpc_tags = var.vpc_tags
  public_cidr = var.public_cidr
  private_cidr = var.private_cidr
  database_cidr = var.database_cidr
  is_peering_required = var.is_peering_required
}
