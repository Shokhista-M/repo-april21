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
}