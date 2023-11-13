terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "terraform-eks-bucket048"
    dynamodb_table = "terraform-eks-table1019"
    key            = "terra-eks-statefile.tfstate"
    region         = "us-east-1"
  }
}