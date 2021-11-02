terraform {
    required_version = "0.12.20"
}

provider "aws" {
    region = var.region
    profile = var.profile
}

resource "aws_instance" "site" {
    ami = "ami-09e67e426f25ce0d7"
    instance_type = "t2.micro"
    key_name = "usedTrain"   # Key-Pair from AWS
    vpc_security_group_ids = ["sg-67ff7962", "sg-0ee5b54e0b7ad2c16"] # Default VPC Security group ID and web-server SG ID
        tags = {
            Name = var.name
            group = var.group   # Ansible group
        }
}