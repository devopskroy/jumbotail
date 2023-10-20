output "test_table_arn" {
  value = aws_dynamodb_table.test_table.arn
}

output "prod_table_arn" {
  value = aws_dynamodb_table.prod_table.arn
}
