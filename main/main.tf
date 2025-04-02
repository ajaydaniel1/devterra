terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
  
  # User data to download the startup script from GitHub
  user_data = <<-EOF
    #!/bin/bash

    # Download the startup script from GitHub
    curl -o https://raw.githubusercontent.com/ajaydaniel1/devterra/refs/heads/dev/startup_script.sh
    chmod +x /tmp/startup_script.sh
    /tmp/startup_script.sh
  EOF

  tags = {
    Name = "TerraformInstance"
  }
}

