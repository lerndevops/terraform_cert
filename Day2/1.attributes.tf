provider "aws" {
  region     = "us-east-1"
#  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
#  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

resource "aws_eip" "ip1" {
  vpc      = true
}

output "eip" {
  value = aws_eip.ip1
}

resource "aws_s3_bucket" "tests3" {
  bucket = "learn-lead-s3"
}

output "mys3bucket" {
  value = aws_s3_bucket.tests3
}

output "publicip" {
  value = aws_eip.ip1.public_ip
}


# By default output shows all the possible attributes. 
# we can filter the outout values too
