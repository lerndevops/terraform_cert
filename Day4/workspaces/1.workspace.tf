provider "aws" {
#  access_key = "accesskey_here"
#  secret_key = "SECRET_KEY_HERE"
  region     = "us-east-1"
}

resource "aws_instance" "test" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
  type = map

  default = {
    default = "t2.micro"
    dev = "t2.large"
    prod = "t2.medium"
 }
}

# create workspaces dev,prod
# check terraform plan by switching workspaces to see appropriate values are taken.
