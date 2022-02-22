terraform {
  cloud {
    organization = "LGUplus-Internship-GTW"

    workspaces {
      name = "intern225023-workshop"
    }
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    } 
  }
}

provider "aws" {
  region = "us-west-1"
}