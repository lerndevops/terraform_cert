provider "aws" {
#  access_key = "accesskey_here"
#  secret_key = "SECRET_KEY_HERE"
  region     = "us-east-1"
}

resource "aws_instance" "test" {
  ami           = var.amiid
  instance_type = "t2.micro"
  key_name = "terra"
}
