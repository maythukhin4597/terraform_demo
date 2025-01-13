resource "aws_dynamodb_table_item" "item1" {
  depends_on = [
    aws_dynamodb_table.demo_dynamodb_table
  ]
  table_name              = aws_dynamodb_table.demo_dynamodb_table.name
  hash_key                = aws_dynamodb_table.demo_dynamodb_table.hash_key

  item = <<ITEM
  {
    "EmployeeId" : {"S": "001"},
    "EmployeeFirstName" : {"S": "May"},
    "EmployeeLastName" : {"S": "Khin"},  
    "EmployeeAge" : {"N" : "27"},
    "EmployeePhone" : {"S" : "1234567"} 
  }
  ITEM
}
