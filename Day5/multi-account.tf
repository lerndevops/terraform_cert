# providers.tf

provider "aws" {
  region     =  "us-east-1"
}

provider "aws" {
  alias      =  "aws02"
  region     =  "us-east-2"
  profile   = "profile2"
}


## all the profile detais are saved in .aws/credentials under root.
## we can update any number of profiles here.
