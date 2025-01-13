resource "aws_dynamodb_table_item" "item2" {
  depends_on = [
    aws_dynamodb_table.demo_dynamodb_table
  ]
  table_name              = aws_dynamodb_table.demo_dynamodb_table.name
  hash_key                = aws_dynamodb_table.demo_dynamodb_table.hash_key

  item = <<ITEM
  {
    "EmployeeId" : {"S": "002"},
    "EmployeeFirstName" : {"S": "Lone"},
    "EmployeeLastName" : {"S": "Lone"},  
    "EmployeeAge" : {"N" : "27"},
    "EmployeePhone" : {"S" : "9834567"} 
  }
  ITEM
}
