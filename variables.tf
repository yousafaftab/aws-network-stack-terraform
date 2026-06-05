variable "aws_region" {
  description = "The AWS region where the infrastructure will be deployed. Example: ap-southeast-1 (Singapore)"
  default     = "ap-southeast-1"
  type        = string
}

variable "username" {
  description = "The username of the individual applying the Terraform code, used for resource tagging or tracking changes."
  default     = ""
  type        = string
}

#################################
########## VPC VARIABLES ########
#################################
variable "vpc_cidr" {
  description = "The CIDR block for the Virtual Private Cloud (VPC). Defines the range of IP addresses for the VPC."
  type        = string
}

variable "availability_zones" {
  description = "The list of Availability Zones within the region where the VPC resources (such as subnets) will be deployed."
  type        = list(string)
  default     = ["ap-southeast-1a"]
}

variable "vpc_private_subnets" {
  description = "A list of CIDR blocks for private subnets within the VPC, typically used for internal resources not exposed to the internet."
  type        = list(string)
}

variable "vpc_public_subnets" {
  description = "A list of CIDR blocks for public subnets within the VPC, typically used for resources that need direct internet access."
  type        = list(string)
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable or disable DNS hostnames in the VPC. Required for instances that need DNS resolution."
  type        = bool
  default     = false
}

variable "enable_dns_support" {
  description = "A boolean flag to enable or disable DNS support in the VPC. When enabled, the instances can resolve AWS service endpoints."
  type        = bool
  default     = false
}

variable "enable_nat_gateway" {
  description = "A boolean flag to enable or disable a NAT gateway in the VPC, which allows instances in private subnets to access the internet."
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  description = "A boolean flag to specify if a single NAT gateway should be created for the entire VPC. Helps in reducing costs."
  type        = bool
  default     = false
}

#################################
########## ASG VARIABLES ########
#################################

variable "instance_type" {
  description = "The type of EC2 instance (e.g., t2.micro, t3.medium) to be deployed by the Auto Scaling Group."
  type        = string
}

variable "min_size_asg" {
  description = "The minimum number of EC2 instances that should be maintained by the Auto Scaling Group."
  type        = number
  default     = 0
}

variable "max_size_asg" {
  description = "The maximum number of EC2 instances that can be launched by the Auto Scaling Group."
  type        = number
  default     = 0
}

variable "desired_capacity_asg" {
  description = "The desired number of EC2 instances that should be running in the Auto Scaling Group."
  type        = number
  default     = 0
}

variable "wait_for_capacity_timeout" {
  description = "The maximum time (in seconds) to wait for the Auto Scaling Group to reach the desired capacity."
  type        = number
  default     = 0
}

variable "health_check_type" {
  description = "The type of health checks (e.g., EC2, ELB) to perform on instances in the Auto Scaling Group."
  type        = string
}

#################################
########## SG VARIABLES #########
#################################

variable "sg_description" {
  description = "A description or purpose of the Security Group associated with EC2 instances."
  type        = string
}

variable "sg_ingress_cidr_block" {
  description = "A list of CIDR blocks allowed for ingress traffic. Defines the allowed source IPs for inbound traffic."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "sg_ingress_rules" {
  description = "A list of ingress rules defining the allowed protocols, ports, and sources for inbound traffic."
  type        = list(string)
  default     = ["http-80-tcp"]
}

variable "sg_egress_cidr_block" {
  description = "A list of CIDR blocks allowed for egress traffic. Defines the allowed destination IPs for outbound traffic."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "sg_egress_rules" {
  description = "A list of egress rules defining the allowed protocols, ports, and destinations for outbound traffic."
  type        = list(string)
  default     = ["all-all"]
}
