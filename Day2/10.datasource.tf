provider "aws" {
  region     = "us-east-1"
 # access_key = "YOUR-ACCESS-KEY"
 # secret_key = "YOUR-SECRET-KEY"
}

data "aws_ami" "test_ami" {
  most_recent = true
  owners = ["amazon"]
# owners = ["self"] if we use OWN org account


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "instance-1" {
    ami = data.aws_ami.test_ami.id
   instance_type = "t2.micro"
}




# Cloud infrastructure, applications, and services emit data, which Terraform can query and act on using data sources. Terraform uses data sources to fetch information from cloud provider APIs, such as disk image IDs, or information about the rest of your infrastructure through the outputs of other Terraform configurations.

# Data sources allow you to load data from APIs or other Terraform workspaces. You can use this data to make your project's configuration more flexible, and to connect workspaces that manage different parts of your infrastructure. You can also use data sources to connect and share data between workspaces in Terraform Cloud and Terraform Enterprise.

# https://learn.hashicorp.com/tutorials/terraform/data-sources
