module "mongodb" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "${var.Project_name}-${var.Environment}-mongodb"
  ami = data.aws_ami.centos8.id
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.mongodb-security_group_id.value]
  subnet_id              = local.database_subnet_id
  tags = merge(
    var.common_tags,
    {
      Component = "mongodb"
    },
    {
      Name = "${local.name}-mongodb"
    }
  )
}
resource "null_resource" "mongodb" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    instance_id = module.mongodb.id
  }
    connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = module.mongodb.private_ip
  }
provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }
provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh mongodb dev",
    ]
  }
}
module "redis" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "${var.Project_name}-${var.Environment}-redis"
  ami = data.aws_ami.centos8.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.redis-security_group_id.value]
  subnet_id              = local.database_subnet_id
  tags = merge(
    var.common_tags,
    {
      Component = "redis"
    },
    {
      Name = "${local.name}-redis"
    }
  )
}
resource "null_resource" "redis" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    instance_id = module.redis.id
  }
    connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = module.redis.private_ip
  }
provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }
provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh redis dev",
    ]
  }
}
module "mysql" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "${var.Project_name}-${var.Environment}-mysql"
  ami = data.aws_ami.centos8.id
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.mysql-security_group_id.value]
  subnet_id              = local.database_subnet_id
  iam_instance_profile = "terraform_admin_access"
  tags = merge(
    var.common_tags,
    {
      Component = "mysql"
    },
    {
      Name = "${local.name}-mysql"
    }
  )
}
resource "null_resource" "mysql" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    instance_id = module.mysql.id
  }
    connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = module.mysql.private_ip
  }
  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh mysql dev",
    ]
  }
}
module "rabbitmq" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "${var.Project_name}-${var.Environment}-rabbitmq"
  ami = data.aws_ami.centos8.id
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.rabbitmq-security_group_id.value]
  subnet_id              = local.database_subnet_id
  iam_instance_profile = "terraform_admin_access"
  tags = merge(
    var.common_tags,
    {
      Component = "rabbitmq"
    },
    {
      Name = "${local.name}-rabbitmq"
    }
  )
}
resource "null_resource" "rabbitmq" {
  # Changes to any instance of the instance requires re-provisioning
  triggers = {
    instance_id = module.rabbitmq.id
  }
    connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = module.rabbitmq.private_ip
  }

provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }
provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh rabbitmq dev",
    ]
  }
}
module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = var.zone_name

  records = [
    {
      name    = "mongodb-dev"
      type    = "A"
      ttl     = 1
      records = [
        "${module.mongodb.private_ip}",
        ]
    },
    {
      name    = "redis-dev"
      type    = "A"
      ttl     = 1
      records = [
        "${module.redis.private_ip}",
        ]
    },
    {
      name    = "mysql-dev"
      type    = "A"
      ttl     = 1
      records = [
        "${module.mysql.private_ip}",
        ]
    },
    {
      name    = "rabbitmq-dev"
      type    = "A"
      ttl     = 1
      records = [
        "${module.rabbitmq.private_ip}",
        ]
    }
  ]
}
  
