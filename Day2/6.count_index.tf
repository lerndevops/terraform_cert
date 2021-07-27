provider aws {
  region = "us-east-1"
}

resource "aws_instance" "multi-instance" {
  count         = 3
  ami           = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"


tags = {
    Name = "server${count.index}"
  }
}


# by default count assingns same name across
# if we want diff names count.index helps
# 
