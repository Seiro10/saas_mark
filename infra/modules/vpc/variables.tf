variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}

variable "name_prefix" {
  type        = string
  description = "Prefix for resource names"
}

variable "cluster_name" {
  type        = string
  description = "Kubernetes cluster name for subnet tagging"
}
