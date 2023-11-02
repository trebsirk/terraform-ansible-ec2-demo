terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
  profile = "terraform"
}

resource "aws_key_pair" "ssh-key" {
  count      = length("hi") != 0 ? 1 : 0
  key_name   = "devops-ssh-key"
  public_key = trimspace(file("~/.ssh/id_ed25519.pub"))
}

resource "aws_instance" "devops_demo_server" {
  ami = "ami-04e914639d0cca79a"
  instance_type = "t2.micro"
  key_name = "devops-ssh-key"
  associate_public_ip_address = true
  security_groups = ["allow-ssh"]
  tags = {
    Name = "devops demo"
  }
}

resource "aws_security_group" "allow-ssh" {
  name        = "allow-ssh"
  description = "Allow SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

