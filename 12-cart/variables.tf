variable "Project_name" {
  type = string
  default = "roboshop"
}
variable "Environment" {
  type = string
  default = "dev"
}
variable "common_tags" {
  type = map
  default = {
    Project = "roboshop"
    Environment = "dev"
    Terraform = "true"
  }
}
variable "tags" {
  type = map
  default = {
    Component = "cart"
  }
}
variable "priority" {
  type = string
  default = "40"
}
variable "zone_name" {
  type = string
  default = "jasritha.tech"
}
variable "iam_instance_profile" {
  default = "terraform_admin_access"
}