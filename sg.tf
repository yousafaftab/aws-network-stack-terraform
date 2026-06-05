module "ec2_security_group" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "~>5.2"
  name                = local.name
  description         = var.sg_description
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = var.sg_ingress_cidr_block
  ingress_rules       = var.sg_ingress_rules
  egress_cidr_blocks  = var.sg_egress_cidr_block
  egress_rules        = var.sg_egress_rules
  tags                = local.tags
}
