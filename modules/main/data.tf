data "aws_availability_zones" "this" {
  state = "available"
}

data "aws_eip" "this" {
  filter {
    name   = "tag:Name"
    values = ["${var.tags.service}-${var.tags.env}-ec2-${data.aws_availability_zones.this.names[0]}"]
  }
}

data "aws_ssm_parameter" "amazon_linux_2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

data "template_file" "user_data" {
  template = file("${path.module}/files/template/cloud-config.yml")
  vars = {
    squid_config            = indent(6, file("${path.module}/files/config/squid.conf"))
    cloudwatch_agent_config = indent(6, file("${path.module}/files/config/amazon-cloudwatch-agent.json"))
  }
}

data "template_file" "pac" {
  template = file("${path.module}/files/template/proxy.pac")
  vars = {
    proxy_host = data.aws_eip.this.public_ip
  }
}
