## For this example create the file names as given

# main.tf
provider "aws" {
  region     = "us-east-1"
#  access_key = "YOUR-ACCESS-KEY"
#  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0747bdcabd34c712a"
  instance_type = var.instancetype
}

# variables.tf

variable "instancetype" {

}

# myvars.tfvars
instancetype="t2.micro"



# when you terraform plan , we need to supply vars file as we used customized name.
# terraform plan -var-file="myvars.tfvars"
# terraform apply -var-file="myvars.tfvars"

