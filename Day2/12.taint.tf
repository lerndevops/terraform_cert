provider aws {
  region = "us-east-1"
}

resource "aws_instance" "test" {
  ami           = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"
}


# After creation , go and update instance type by stopping it.
# terraform taint aws_instance.test      
# terraform plan  --> This shows that the resource is being recreated with updated details.

# terraform untaint aws_instance.test
# terraform plan --> This shows it is about to restore as per code.


# The terraform taint command informs Terraform that a particular object has become degraded or damaged.  Terraform represents this by marking the object as "tainted" in the Terraform state, in which case Terraform will propose to replace it in the next plan you create.

# https://www.terraform.io/docs/cli/commands/taint.html
