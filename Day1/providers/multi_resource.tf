provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

resource "aws_eip" "one" {
  vpc      = true
}

output "eip" {
  value = aws_eip.one
}

resource "aws_s3_bucket" "ex-s3" {
  bucket = "learn-lead-bucket-1"
}

output "mys3" {
  value = aws_s3_bucket.ex-s3
}


#terraform init
#terraform plan
#terraform apply
#terraform destroy
#terraform destroy -target aws_s3_bucket.ex-s3
