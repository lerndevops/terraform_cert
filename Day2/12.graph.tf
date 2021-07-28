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

# The terraform graph command is used to generate a visual representation of either a configuration or execution plan. The output is in the DOT format, which can be used by GraphViz to generate charts.

# Outputs the visual execution graph of Terraform resources according to either the current configuration or an execution plan.

# The graph is outputted in DOT format. The typical program that can read this format is GraphViz, but many web services are also available to read this format.

# apt-get update
# apt-get install graphviz
# terraform graph > g.dot
# cat g.dot |dot -Tsvg > gra.svg
# copy the svg file and open with local browser


