resource "aws_dynamodb_table" "dynamodb_table_terraform_state_lock" {
  name           = "terraform-eks-table1019"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}