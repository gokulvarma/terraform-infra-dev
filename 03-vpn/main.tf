module "vpn" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "${var.Project_name}-${var.Environment}-vpn"
  ami = data.aws_ami.centos8.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_security_group_id.value]
  subnet_id              = data.aws_subnet.default.id
  user_data = file("openvpn.sh")
  tags = merge(
    var.common_tags,
    var.ec2_tags,
    {
      Name = "${local.name}-vpn"
    }
  )
}
