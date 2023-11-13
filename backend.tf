terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "jenkis-tetris-terraform2793"
    dynamodb_table = "jenkis-tetris-terraform2793"
    key            = "terra-eks-statefile.tfstate"
    region         = "us-east-1"
  }
}
