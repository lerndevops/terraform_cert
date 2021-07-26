provider "aws" {
  region     = "us-east-1"
#  access_key = "YOUR-ACCESS-KEY"
#  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0747bdcabd34c712a"
  instance_type = var.instancetype
}


