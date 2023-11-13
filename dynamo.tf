resource "aws_dynamodb_table" "dynamodb_table_terraform_state_lock" {
  name           = "jenkis-tetris-terraform2793"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
