## create a folder structure
# mkdir modules work
# cd modules;mkdir ec2;cd ec2 ;create ec2.tf as below

provider "aws" {
#  access_key = "accesskey_here"
#  secret_key = "SECRET_KEY_HERE"
  region     = "us-east-1"
}

resource "aws_instance" "moduetest" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
}


# NOW go to work folder nd create test.tf

module "ec2module" {
  source = "../modules/ec2"
}
  
  #terraform init
  # terraform plan
# if you want to change instance type, that should be done at module level, if u update in test.tf, it doesnt work
