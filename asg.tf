module "asg" {
  source                    = "terraform-aws-modules/autoscaling/aws"
  version                   = "~>8.0"
  name                      = local.name
  key_name                  = aws_key_pair.deployer.key_name
  image_id                  = data.aws_ami.amazon_linux.id
  instance_type             = var.instance_type
  security_groups           = [module.ec2_security_group.security_group_id]
  user_data                 = local.ec2_user_data
  min_size                  = var.min_size_asg
  max_size                  = var.max_size_asg
  desired_capacity          = var.desired_capacity_asg
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  health_check_type         = var.health_check_type
  vpc_zone_identifier       = module.vpc.public_subnets
  tags                      = local.tags
}
