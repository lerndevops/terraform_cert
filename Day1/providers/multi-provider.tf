provider "aws" {
  alias  = "east"
  region = "us-east-1"
}

provider "aws" {
  alias  = "west"
  region = "us-west-2"
}


resource "aws_sns_topic" "topic-us-east" {
  provider = aws.east
  name     = "topic-us-east"
}

resource "aws_sns_topic" "topic-us-west" {
  provider = aws.west
  name     = "topic-us-west"
}

# When we want to use same provider multiple times, alias option can be used.  
