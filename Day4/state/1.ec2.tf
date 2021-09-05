provider "aws" {
#  access_key = "accesskey_here"
#  secret_key = "SECRET_KEY_HERE"
  region     = "us-east-1"
}

resource "aws_instance" "test" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name = "terra"
}

# terraform apply
# check state file terraform.tfstate
# update the instance type, terraform plan --> you will see updated plan 
# terraform apply will corect the instancetype as per config

# now try changing sg inbound rules and test.


# https://www.terraform.io/docs/language/state/index.html
