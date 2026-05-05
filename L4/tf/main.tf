# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "micro" {
  ami           = "ami-0eb38b817b93460ac"
  instance_type = var.instance_type
  
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = var.instance_name
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  cidr = "10.20.0.0/20"
}

resource "aws_subnet" "main" {
  vpc_id     = module.vpc.vpc_id
  cidr_block = "10.20.1.0/24"

  tags = {
    Name = "main_subnet"
   }
 }

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  to_port           = 22
  from_port         = 22
}