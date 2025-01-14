# Create dynamodb table_name
resource "aws_dynamodb_table" "demo_dynamodb_table" {
    name               = "MessageCenter" #Required 
    billing_mode       = "PROVISIONED"
    read_capacity      = 1
    write_capacity     = 1
    hash_key           = "PartitionKey" #Required 
    range_key          = "SortKey"
    attribute {
        name           = "PartitionKey"
        type           = "S"
    }
    attribute {
        name           = "SortKey"
        type           = "S"
    }
    attribute {
        name           = "TargetKey"
        type           = "S"
    }
    global_secondary_index {
        name            = "GSI1"
        hash_key        = "TargetKey"
        projection_type = "ALL"
        read_capacity   = 1
        write_capacity  = 1
    }
}

resource "null_resource" "import_data" {
  depends_on = [aws_dynamodb_table.demo_dynamodb_table]

  provisioner "local-exec" {
    command = "aws dynamodb batch-write-item --request-items file://import.json"
  }
}

output "table_name" {
  value = aws_dynamodb_table.demo_dynamodb_table.name
}

