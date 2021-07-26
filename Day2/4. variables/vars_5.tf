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


## For variable values run the following command
## export TF_VAR_instancetype="t2.nano"
## terraform plan   --> it should directly take value from ENV variable.
