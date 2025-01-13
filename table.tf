# Create dynamodb table_name
resource "aws_dynamodb_table" "demo_dynamodb_table" {
    name               = "Employee" #Required 
    billing_mode       = "PROVISIONED"
    read_capacity      = 5
    write_capacity     = 5
    hash_key           = "EmployeeId" #Required 
    attribute {
        name           = "EmployeeId"
        type           = "S"
    }
    tags = {
        name           = "Demo dynamodb table"
        Environment    = "Testing"
    }
}

output "table_name" {
  value = aws_dynamodb_table.demo_dynamodb_table.name
}

