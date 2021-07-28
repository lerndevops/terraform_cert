provider aws {
  region = "us-east-1"
}
resource "null_resource" "ansi" {
  provisioner "local-exec" {
   command = "ansible localhost -m ping"
  }
}


resource "null_resource" "ansi" {
  provisioner "local-exec" {
   command = "docker run -d -P nginx"
  }
}

## https://www.terraform.io/docs/language/resources/provisioners/local-exec.html
