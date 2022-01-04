module "proxy_sg" {
  source              = "../../resources/security_group"
  security_group_name = "${var.tags.service}-${var.tags.env}-sg"
  tags                = var.tags
  vpc_id              = module.vpc.vpc.id
  ingress_rule = {
    0 = {
      cidr_blocks = ["126.88.109.246/32"]
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "23.prime.37@gmail.com"
    }
  }
}

module "proxy_iam" {
  source                      = "../../resources/iam"
  create_iam_instance_profile = true
  policies = [
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
  profile_name    = "${var.tags.service}-${var.tags.env}-profile"
  role_document   = "${path.module}/files/template/default_iam_assume_role.json"
  role_name       = "${var.tags.service}-${var.tags.env}-ec2-role"
  role_parameters = { SERVICE = "ec2.amazonaws.com" }
  tags            = var.tags
}

module "proxy_key" {
  source     = "../../resources/key_pair"
  key_name   = "${var.tags.service}-${var.tags.env}-keypair"
  public_key = file("${path.module}/files/keypair/${var.tags.service}-${var.tags.env}-keypair.pub")
  tags       = var.tags
}

module "proxy" {
  source                      = "../../resources/ec2"
  ami                         = data.aws_ssm_parameter.amazon_linux_2_ami.value
  associate_public_ip_address = true
  eip_ids                     = [data.aws_eip.this.id]
  iam_instance_profile        = module.proxy_iam.iam_instance_profile[0].name
  instance_type               = "t3a.micro"
  instances                   = 1
  key_name                    = module.proxy_key.key_pair.id
  name                        = "${var.tags.service}-${var.tags.env}"
  subnet_id                   = module.pub_subnet.subnet.0.id
  tags                        = var.tags
  user_data                   = data.template_file.user_data.rendered
  volume_size                 = 20
  vpc_security_group_ids      = [module.proxy_sg.security_group.id]
}

module "proxy_logs" {
  source            = "../../resources/cloudwatch/logs"
  retention_in_days = 400
  tags              = var.tags
  log_group_names = [
    "/aws/ec2/proxy/messages",
    "/aws/ec2/proxy/secure",
    "/aws/ec2/proxy/squid/access.log",
    "/aws/ec2/proxy/squid/cache.log"
  ]
}
