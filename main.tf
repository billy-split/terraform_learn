# Define a provider
provider "aws" {
    region = "us-east-2"
    access_key = ""
    secret_key = ""
}

# Define a resources (VPC, Subnet, instances ... )

# 1. VPC
resource "aws_vpc" "dev-vpc" {
    cidr_block = "10.0.0.0/16"
}

# 2. Subnet
resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.dev-vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "us-east-2a"
}