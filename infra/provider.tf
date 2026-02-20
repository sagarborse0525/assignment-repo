terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0"
    }
  }

  backend "s3" {
    bucket  = "tf-state-mgmt-bkt"
    key     = "AWS_DEPLOY_ENV/AWS_USE_CASE/terraform.tfstate"
    encrypt = true
    region  = "us-east-1"
    dynamodb_table ="tf-iac-state-lock"

  }
}

provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::AWS_ACCOUNT_ID:role/AUTOMATIONADMIN"
  }
}