variable "table_name" {
  description = "table name"
}

variable "read_capacity" {
  description = "Read capacity of DynamoDB table."
  default     = 10
}

variable "write_capacity" {
  description = "Write capacity of DynamoDB table."
  default     = 10
}

variable "attribute_definitions" {
  description = "List of attribute of DynamoDB table."
  type        = list(object({
    name = string
    type = string
  }))
}

variable "key_schema" {
  description = "List of key schema of DynamoDB table."
  type        = list(object({
    name         = string
    attribute_type = string
  }))
}
