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
  
  # User data to download the startup script from GitHub
user_data = <<-EOF
  #!/bin/bash

  # Download the startup script from GitHub and save it to /tmp/startup_script.sh
  curl -o /tmp/startup_script.sh https://raw.githubusercontent.com/ajaydaniel1/devterra/refs/heads/dev/startup_script.sh

  # Make the downloaded script executable
  chmod +x /tmp/startup_script.sh

  # Execute the script
  /tmp/startup_script.sh
EOF


  tags = {
    Name = "TerraformInstance"
  }
}