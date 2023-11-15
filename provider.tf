# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "4.66.1"
#     }
#   }

# }

provider "aws" {
  #access_key = ""
  #secret_key = ""
  region     = "us-east-1"
}

