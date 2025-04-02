terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c1ac8a41498c1a9c" # Ubuntu 20.04 LTS // eu-north-1
  instance_type = "t3.micro"

# Load script after deploying instance

user_data =  file("${path.module}/devterra/startup_script.sh")




}
