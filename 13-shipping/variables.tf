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
    Component = "shipping"
  }
}
variable "priority" {
  type = string
  default = "16"
}
variable "zone_name" {
  type = string
  default = "jasritha.tech"
}
variable "zone_id" {
  type = string
  default = "Z04879463GXQ7LRPO48K6"
}
variable "iam_instance_profile" {
  default = "terraform_admin_access"
}