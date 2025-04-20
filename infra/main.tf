terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  profile = "my-new-project"
  region  = "eu-west-3"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr           = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.11.0/24", "10.0.12.0/24"]
  availability_zones = ["eu-west-3b", "eu-west-3c"]
  name_prefix        = "saas_mark"
  cluster_name       = "saas_mark-cluster"
}


module "alb" {
  source = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnet_ids
  name_prefix    = "saas-mark"
}



