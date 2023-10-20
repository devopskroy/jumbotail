resource "aws_dynamodb_table" "test_table" {
  name           = var.table_name
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  attribute {
    name = "TopScore"
    type = "N"
  }
   ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }
   tags = {
    Name        = "dynamodb-table-1"
    Environment = "testing"
  }
}

resource "aws_dynamodb_table" "prod_table" {
  name           = var.table_name
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  attribute {
   name = "TopScore"
    type = "N"
  }
   ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }
   tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
  
}
