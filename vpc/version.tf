terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.79.0"
    }
    
  }
}
terraform {
  backend "s3" {
    bucket = "za-wk7-terraformstatebucket" # replace with your bucket
    key    = "qa/terraform.tfstate"
    region = "us-east-1"
    #use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}