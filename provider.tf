# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "4.66.1"
#     }
#   }

# }

provider "aws" {
  AWS_ACCESS_KEY_ID = ${{ secrets.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY = ${{ secrets.AWS_SECRET_ACCESS_KEY }}
  region     = "us-east-1"
}

