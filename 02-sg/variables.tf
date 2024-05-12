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
variable "sg_tags" {
  type = map
  default = {}
}
variable "sg_ingress_rules" {
  default = [
    {
      from_port         = 22
     protocol           = "tcp"
     to_port           = 22
     cidr_blocks       = ["0.0.0.0/0"]
    },
    {
      from_port         = 80
     protocol          = "tcp"
     to_port           =  80
     cidr_blocks       = ["0.0.0.0/0"]
    }
  ]
}
variable "sg_description" {
  type = string
  default = "allow rules for"
}

