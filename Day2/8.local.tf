
provider "aws" {
  region     = "us-east-1"
#  access_key = "YOUR-ACCESS-KEY"
#  secret_key = "YOUR-SECRET-KEY"
}

locals {
  common_tags = {
    env = "dev"
    app = "learnlead"
    type = "web"
  }
}
resource "aws_instance" "appli" {
   ami = "ami-0747bdcabd34c712a"
   instance_type = "t2.micro"
   tags = local.common_tags
}

resource "aws_instance" "db" {
   ami = "ami-0747bdcabd34c712a"
   instance_type = "t2.small"
   tags = local.common_tags
}

resource "aws_ebs_volume" "vol1" {
  availability_zone = "us-east-1a"
  size              = 8
  tags = local.common_tags
}



#Terraform locals are named values that you can refer to in your configuration. You can use local values to simplify your Terraform configuration and avoid repetition. Local values (locals) can also help you write more readable configuration by using meaningful names rather than hard-coding values.

# Unlike variables found in programming languages, Terraform's locals don't change values during or between Terraform runs such as plan, apply, or destroy. You can use locals to give a name to the result of any Terraform expression, and re-use that name throughout your configuration. Unlike input variables, locals are not set directly by users of your configuration.

# https://learn.hashicorp.com/tutorials/terraform/locals?in=terraform/configuration-language&utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS

