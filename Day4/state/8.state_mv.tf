provider "aws" {
  region     = "us-east-1"
#  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
#  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

resource "aws_instance" "one" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
}

resource "aws_instance" "two" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
}


# terraform init
# terraform plan 
# terraform apply

# Now, if we wanted to change the name of the any resource in "tf" file, terraform usually destroys and recreates. check ...
# edit the resource name from "one" to "newone"
# terraform plan ------> This shows 1 destroy and 1 create
# terraform state mv aws_instance.one aws_instance.newone

# Now terraform plan shows NO Changes.


