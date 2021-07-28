
# Actual 

resource "aws_security_group" "demo" {
  name        = "sample-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1521
    to_port     = 1521
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


## dynamic-block.tf


provider aws {
  region = "us-east-1"
}


variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [80, 8080,443, 1521, 9000]
}

resource "aws_security_group" "dyna-sg" {
  name        = "dyna-sg1"
  description = "testing dynamic block"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}




## Terraform Dynamic Block is important when you want to create multiple resources inside of similar types, so instead of copy and pasting the same terraform configuration in the terraform file does not make sense and it is not feasible if you need to create hundreds of resources using terraform.

## If we describe terraform dynamic block in simple words then it is a "for loop" which is going to iterate over and will help you to create a dynamic resource. With the help of dynamic blocks you can create nested repeatable blocks such as settings, ingress rules etc…

# Do not overuse the dynamic block when it is not necessary
# Multiple nested dynamic blocks should be avoided otherwise it might cause you trouble in debugging and troubleshooting.
# If the dynamic block is getting too complex inside your terraform file then it’s better to use terraform module.
