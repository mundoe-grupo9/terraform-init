resource "aws_dynamodb_table" "terraform-lock" {
  name           = "terraform_state"
  # read_capacity  = 1
  # write_capacity = 1
  billing_mode     = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "DynamoDB Terraform State Lock Table"
  }
}