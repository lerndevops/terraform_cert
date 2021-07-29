provider aws {
  region = "us-east-1"
}

resource "aws_s3_bucket" "private" {
  bucket = "my-private-bucket-${terraform.workspace}"
  acl    = "private"

  tags = {
    Name        = "My private bucket"
    Environment = terraform.workspace
  }
}

