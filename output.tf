output "name" {
  value       = local.name
  description = "This output provides the value of the name defined in the local values (local.name)."
}

output "aws_account_id" {
  value       = data.aws_caller_identity.this.account_id
  description = "This output returns the AWS Account ID of the caller."
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "This output returns the ID of the VPC created or managed by the vpc module."
}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "This output provides a list of IDs for the public subnets created or managed by the vpc module."
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "This output provides a list of IDs for the private subnets created or managed by the vpc module."
}

output "ec2_security_group_name" {
  value       = module.ec2_security_group.security_group_name
  description = "This output returns the name of the EC2 security group created or managed by the ec2_security_group module."
}

output "autoscaling_group_id" {
  value       = module.asg.autoscaling_group_id
  description = "This output returns the ID of the Auto Scaling Group (ASG) created or managed by the asg module."
}

output "launch_configuration_id" {
  value       = module.asg.launch_template_id
  description = "This output returns the ID of the launch template created or managed by the asg module. "
}

output "private_key_pem" {
  value     = tls_private_key.deployer.private_key_pem
  description = "SSH keys to be used to get into the instances created by autoscaling group"
  sensitive = true
}
