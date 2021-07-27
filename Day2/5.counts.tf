resource "aws_instance" "multi-instance" {
  count         = 3
  ami           = "ami-05692172625678b4e"
  instance_type = "t2.micro"

}

# https://www.terraform.io/docs/language/meta-arguments/count.html
