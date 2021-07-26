## main.tf

#provider "aws" {
#   region     = "us-east-1"
 # access_key = "YOUR-KEY"
 # secret_key = "YOUR-KEY"
#}

resource "aws_iam_user" "name1" {
  name = var.username
  path = "/system/"
}

## elb.tf

provider "aws" {
  region     = "us-east-1"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_elb" "bar" {
  name               = var.elb_name
  availability_zones = var.az

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = var.timeout
  connection_draining         = true
  connection_draining_timeout = var.timeout

  tags = {
    Name = "foobar-terraform-elb"
  }
}


## variables.tf

variable "username" {
  type = number
}

variable "elb_name" {
  type = string
}

variable "az" {
  type = list
}

variable "timeout" {
  type = number
}


## terraform.tfvars

elb_name="myelb"
timeout="400"
az=["us-east-1a","us-east-1b"]
username="7897987"



# https://www.terraform.io/docs/providers/aws/r/elb.html
