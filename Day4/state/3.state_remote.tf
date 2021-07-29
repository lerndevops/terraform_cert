provider "aws" {
  region = "us-east-1"
#  access_key = "YOUR-ACCESS-KEY"
#  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_db_instance" "default" {
  allocated_storage    = 5
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "learn"
  password             = "learnlead"
 #password             = file("../rds_pass.txt") 
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = "true"
}


# IF we go like this , if this is commited to GitHub, everyone can see the password
# If we use some file to put password and pass it to the code, its ok, But the state file still shows it if it is pushed. 
