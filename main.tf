terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "029DA-DevOps24"
    
    workspaces {
        prefix = "network-"
    }
  }
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
}

provider "aws" {}

module "network" {
    source = "./modules/network"
    prefix = terraform.workspace
    vpc_cidr_block = "10.0.0.0/16"
    subnet_cidr_block = "10.0.1.0/24"
}
module "iam" {
    source = "./modules/aim"
    groups = {
        "system_admins"   = ["system_admin_1", "system_admin_2", "system_admin_3"]
        "database_admins" = ["database_admin_1", "database_admin_2", "database_admin_3"]
        "read_only"       = ["read_only_1", "read_only_2", "read_only_3"]
    }
}
