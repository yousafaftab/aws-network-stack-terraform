module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~>5.13"

  name = local.name

  cidr = var.vpc_cidr

  azs = var.availability_zones

  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  tags = local.tags
}
