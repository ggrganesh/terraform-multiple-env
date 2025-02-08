# Terrafrom configuration and version 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
  
    }
  }
  backend "s3" {
    bucket = "82s-tf-remote-state-ganesh"
    key = "infra-workspace"
    region = "us-east-1"
    dynamodb_table = "82s-tf-remote-state-locking"
    encrypt = true

    
  }

}

  provider "aws" {
  # Configuration options
  region = "us-east-1"
}