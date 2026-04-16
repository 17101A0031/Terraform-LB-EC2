terraform {
  backend "s3" {
    bucket = "siddhesh-proj-1"
    key = "main"
    region = "ap-south-1"
    dynamodb_table = "my-dynamodb-table"
  }
}
