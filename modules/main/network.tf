module "vpc" {
  source     = "../../resources/vpc"
  cidr_block = "10.0.0.0/16"
  tags       = var.tags
  vpc_name   = "${var.tags.service}-${var.tags.env}-vpc"
}

module "internet_gateway" {
  source                = "../../resources/internet_gateway"
  internet_gateway_name = "${var.tags.service}-${var.tags.env}-igw"
  tags                  = var.tags
  vpc_id                = module.vpc.vpc.id
}

module "pub_subnet" {
  source = "../../resources/subnet"
  vpc_id = module.vpc.vpc.id
  subnets = [
    {
      availability_zone = data.aws_availability_zones.this.names[0]
      cidr_block        = "10.0.0.0/24"
      name              = "${var.tags.service}-${var.tags.env}-pub-${data.aws_availability_zones.this.names[0]}",
    }
  ]
  tags = var.tags
}

module "pub_route_table" {
  source           = "../../resources/route_table"
  route_table_name = "${var.tags.service}-${var.tags.env}-pub-${data.aws_availability_zones.this.names[0]}"
  subnet_ids       = module.pub_subnet.subnet.*.id
  tags             = var.tags
  vpc_id           = module.vpc.vpc.id
  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = module.internet_gateway.internet_gateway.id
    }
  ]
}
